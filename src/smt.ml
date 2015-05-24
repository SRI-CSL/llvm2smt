(*
 * Convert abstract syntax to SMT2 bitvector constraints/expressions.
 *
 * Values of type Integer 1  are converted to Boolean expressions in SMT
 * Values of type (Integer n) where n>1 are converted to SMT expressions of type (_ BitVec n)
 *
 *)

open Printf
open Llvm
open Dl
open Bc   
open Util

(*
 * Size of the address space in bits
 *)
let default_addr_width = 64  (* We fall back to this if the datalayout string doesn't tell us. *)

let get_addr_width cu =
  let pointer = cu.dl.pointer in
    (match pointer with
       | None  ->
	   begin
	     (Printf.eprintf "No pointer size in datalayout; using the default of %d\n" default_addr_width);
	     default_addr_width
	   end
       | Some align -> align.size )



(*
 * State stores information needed for conversion to SMT
 * - mem_idx: to give a unique id to each memory state
 * - sp_idx: to give a unique id to each stack pointer
 * - fu = function (or None)
 * We also store the compilaation unit and address width
 * - these are needed to get type and bitsize information
 *)
type state = {
  mutable mem_idx: int;
  mutable sp_idx: int;
  mutable fu: Bc.finfo option;
  cu: Bc.cunit;
  addr_width: int;
}

let state_fu st =
  let f = st.fu  in
    (match f with
       | Some fu -> fu
       | None -> failwith "state fu field (i.e. a finfo) not set!")
    


(*
 * Compute padding in bits NOT bytes
 *)
let bit_padding bit_align offset =
  let tail = offset mod bit_align in
    if tail == 0 then 0 else (bit_align - tail)

	
(*
 * Alignment in bytes
 *)
let rec byte_align64 st t =
  let list_align typs = List.map (byte_align64 st) typs in
   (match t with
      | Vartyp v -> (byte_align64 st (Bc_manip.typ_of_var st.cu (state_fu st) v))
      | Void -> 0
      | Half -> 2
      | Integer n -> if n <= 8 then 1 else if n <= 16 then 2 else if n <= 32 then 4 else 8
      | Pointer(_,_) -> 8
      | Float -> 4
      | Double -> 8
      | Arraytyp(len,element_ty) -> byte_align64 st element_ty
      | Structtyp(true, tys) -> 1
      | Structtyp(false, tys) -> List.fold_left max 0 (list_align tys)
      | Vector(len,element_ty) -> byte_align64 st element_ty
      | _ -> 4) (* just a guess *)

let rec byte_align32 st t =
  let list_align typs = List.map (byte_align32 st) typs in
   (match t with
      | Vartyp v -> (byte_align32 st (Bc_manip.typ_of_var st.cu (state_fu st) v))
      | Void -> 0
      | Half -> 2
      | Integer n -> if n <= 8 then 1 else if n <= 16 then 2 else 4
      | Pointer(_,_) -> 4
      | Float -> 4
      | Double -> 4
      | Arraytyp(len,element_ty) -> byte_align32 st element_ty
      | Structtyp(true, tys) -> 1
      | Structtyp(false, tys) -> List.fold_left max 0 (list_align tys)
      | Vector(len,element_ty) -> byte_align32 st element_ty
      | _ -> 4) (* just a guess *)

let byte_align st t  =
  assert((st.addr_width  == 64) || (st.addr_width == 32));
  if st.addr_width == 64
  then byte_align64 st t
  else byte_align32 st t

let bit_align st t =
  8 * (byte_align st t)

let rec bitwidth st t =
  let list_bitwidth typs = List.map (bitwidth st) typs in
    (match t with
      | Vartyp v -> (bitwidth st (Bc_manip.typ_of_var st.cu (state_fu st) v))
      | Void -> 0
      | Half -> 16
      | Integer n -> n
      | Pointer(_,_) -> st.addr_width
      | Float -> 32
      | Double -> 64
      | X86_fp80 -> 80
      | X86_mmx -> 64
      | Fp128 -> 128
      | Ppc_fp128 -> 128
      | Arraytyp(len,element_ty) -> len*(bitwidth st element_ty)
      | Structtyp(true, tys) -> (* packed struct *)
	  List.fold_left (fun x y -> x+y) 0 (list_bitwidth tys)
      | Structtyp(false, tys) -> (* not packed *)
	  (* Printf.eprintf "Warning: inaccurate size computation for struct type: %s\n" (Llvm_pp.string_of_typ t); *)
	  bitwidth_of_struct st (bit_align st t) tys
      | Vector(len,element_ty) -> len*(bitwidth st element_ty)
      | _ -> 
	  begin
	    Util.nfailwith ("can't convert type: " ^ (Llvm_pp.string_of_typ t));
	    0
	  end)

and bitwidth_of_struct st struct_align typs =
  let rec bitwidth_of_struct_aux offset typs =
    (match typs with
      | [] -> offset + (bit_padding struct_align offset)
      | ty::tl ->
	  let width = bitwidth st ty in
	  let ty_align = (bit_align st ty) in
	  let new_offset = offset + (bit_padding ty_align offset) + width  in
	    bitwidth_of_struct_aux new_offset tl)
  in
    bitwidth_of_struct_aux 0 typs

let bytewidth  st  ty =
  let bits = bitwidth  st ty in
    if (bits mod 8) <> 0
    then Printf.eprintf "Warning: bitwidth %d  of %s not divisible by 8!\n" bits (Llvm_pp.string_of_typ ty);
    bits/8 + (if (bits mod 8) <> 0 then 1 else 0)

let is_bool st tau = (bitwidth st tau) = 1


(*
 * return memory<id>
 *)
let mem_ref st =
  "memory" ^ (string_of_int st.mem_idx)
      
(*
 * Same thing for the stack pointer
 *)
let sp_ref st = 
  "rsp" ^ (string_of_int st.sp_idx) 
      


(*
 * SMT name: b = buffer, argument = var
 *)
let name_to_smt b = function
  | Id(true, i) -> bprintf b "|@%d|" i
  | Id(false, i)      -> bprintf b "|%%%d|" i
  | Name(true, name)  -> bprintf b "|@%s|" name
  | Name(false, name) -> bprintf b "|%%%s|" name


(*
 * SMT type for tau
 *)
let typ_to_smt b st tau =
  let n = (bitwidth st tau) in
    if n == 1 then
      bprintf b "Bool"
    else
      bprintf b "(_ BitVec %d)" n


(*
 * Zero bitvector of n bits
 *)
let zero_vector b n =
  bprintf b "(_ bv0 %d)" n


let int_to_bv n w =
  let b = Buffer.create 64 in
    bprintf b "(_ bv%d %d)" n w;
    Buffer.contents b


(*
 * Convert an Int value to an int
 *)
let val_to_int v = 
  match v with
    | Int x -> Big_int.int_of_big_int x
    | _ -> failwith ("Value is not an integer: " ^ (Llvm_pp.string_of_value v))


(*
 * Integer comparison --> converted to an SMT bitvector compare
 *)
let icmp_op_to_smt = function
  | I.Eq  -> "="
  | I.Ne  -> "distinct"
  | I.Slt -> "bvslt"
  | I.Sgt -> "bvsgt"
  | I.Sle -> "bvsle"
  | I.Sge -> "bvsge"
  | I.Ult -> "bvult"
  | I.Ugt -> "bvugt"
  | I.Ule -> "bvule"
  | I.Uge -> "bvuge"


(*
 * Typed value --> converted to an SMT expression
 * Raise Exception InstructionNotSupported ... 
 *)
exception InstructionNotSupported of string

let rec val_typ_to_smt b st (typ, v) =
  if is_bool st typ then 
    bool_val_to_smt b st v 
  else 
    val_to_smt b st (typ, v)

and bool_val_to_smt b st v =
  (match v with
     | Var x -> name_to_smt b x
     | True -> bprintf b "true"
     | False -> bprintf b "false"
     | And (x, y) -> binop_to_smt b st "and" x y
     | Or  (x, y) -> binop_to_smt b st "or" x y
     | Xor (x, y) -> binop_to_smt b st "xor" x y
     | Icmp(cmp, x, y) -> icmp_to_smt b st cmp x y
     | _ -> Util.nfailwith ("bool value not supported: " ^  (Llvm_pp.string_of_value v)))

and val_to_smt b st (typ, v) =
  (match v with
     | Var x          -> name_to_smt b x
     | Null           -> zero_vector b st.addr_width
     | Zero           -> zero_vector b (bitwidth st typ)
     | Int n          -> bprintf b "(_ bv%s %d)" (Big_int.string_of_big_int n) (bitwidth st typ)
	 (*
	   | Trunc(x, y)          -> bprintf b "trunc(%a to %a)" bpr_typ_value x         bpr_typ y
	   | Zext(x, y)           -> bprintf b "zext(%a to %a)" bpr_typ_value x          bpr_typ y
	   | Sext(x, y)           -> bprintf b "sext(%a to %a)" bpr_typ_value x          bpr_typ y
	   | Bitcast(x, y)        -> bprintf b "bitcast (%a to %a)" bpr_typ_value x      bpr_typ y
	   | Inttoptr(x, y)       -> bprintf b "inttoptr (%a to %a)" bpr_typ_value x     bpr_typ y
	   | Ptrtoint(x, y)       -> bprintf b "ptrtoint (%a to %a)" bpr_typ_value x      bpr_typ y
	   | Getelementptr(inbounds, x) -> bprintf b "getelementptr %a(%a)" (yes "inbounds ") inbounds bpr_typ_value_list x
	 *)
     | Select([c;t;e]) -> ite_to_smt b st c t e
     | Select(_)       -> Util.nfailwith ("malformed Select: " ^ (Llvm_pp.string_of_value v))
	 
     | Add(_, _, x, y) -> binop_to_smt b st "bvadd" x y
     | Sub(_, _, x, y) -> binop_to_smt b st "bvsub" x y
     | Mul(_, _, x, y) -> binop_to_smt b st "bvmul" x y
     | Shl(_, _, x, y) -> binop_to_smt b st "bvshl" x y
     | Sdiv(_, x, y)   -> binop_to_smt b st "bvsdiv" x y
     | Udiv(_, x, y)   -> binop_to_smt b st "bvudiv" x y
     | Lshr(_, x, y)   -> binop_to_smt b st "bvlshr" x y
     | Ashr(_, x, y)   -> binop_to_smt b st "bvashr" x y
     | Urem(x, y)      -> binop_to_smt b st "bvurem" x y
     | Srem(x, y)      -> binop_to_smt b st "bvsrem" x y
     | And (x, y)      -> binop_to_smt b st "bvand" x y
     | Or  (x, y)      -> binop_to_smt b st "bvor" x y
     | Xor (x, y)      -> binop_to_smt b st "bvxor" x y
     | _ -> Util.nfailwith ("value not supported: " ^  (Llvm_pp.string_of_value v)))
  
and binop_to_smt b st op left right =
  bprintf b "(%s " op;
  val_typ_to_smt b st left;
  bprintf b " ";
  val_typ_to_smt b st right;
  bprintf b ")"

and ite_to_smt b st cond left right = (* if cond then left else right *)
  bprintf b "(if ";
  val_typ_to_smt b st cond;
  bprintf b " ";
  val_typ_to_smt b st left;
  bprintf b " ";
  val_typ_to_smt b st right;
  bprintf b ")"

and icmp_to_smt b st cmp left right = (* Comparison: cmp = operation, left/right = integer arguments *)
  bprintf b "(%s " (icmp_op_to_smt cmp);
  val_typ_to_smt b st left;
  bprintf b " ";
  val_typ_to_smt b st right;
  bprintf b ")"


(*
 * Alloca: with a constant size
 * - ty = type of elements
 * - n = number of elements 
 *)
let const_alloca_to_smt b st ty n =
  let old_sp = st.sp_idx in
  let new_sp = old_sp + 1 in
  let size = n * (bytewidth st ty) in
    bprintf b "(define-fun rsp%d () Address (bvsub rsp%d %s))" new_sp  old_sp (int_to_bv size st.addr_width);
    st.sp_idx <- new_sp

(*
 * Alloca: general form
 * - ty = type of elements
 * - n = number of elements (as a typed value)
 *)
let gen_alloca_to_smt b st ty n =
  let old_sp = st.sp_idx in
  let new_sp = old_sp + 1 in
  let size = bytewidth st ty in
    st.sp_idx <- new_sp;
    bprintf b "(define-fun rsp%d () Address (bvsub rsp%d (bvmul %s " new_sp  old_sp (int_to_bv size st.addr_width);
    val_to_smt b st n;
    bprintf b ")))"

(*
 * ty = type
 * n = number of elements (typ * value) option
 *)
let alloca_to_smt b st ty n =
  match n with
    | None -> const_alloca_to_smt b st ty 1
    | Some(_, Int x) -> const_alloca_to_smt b st ty (Big_int.int_of_big_int x)
    | Some x -> gen_alloca_to_smt b st ty x

(*
 * b = buffer
 * st = state
 * ty = type of pointer
 * v = the pointer
 * (load_to_smt b st ty v)
 *)
let load_to_smt b st i ty v =
  (match ty with
     | Pointer(t,_) ->
	 let n = bitwidth st t in
	   begin
	     bprintf b "(read%d %s " n (mem_ref st);
	     val_typ_to_smt b st (ty, v);
	     bprintf b ")" 
	   end
     | _ -> Util.nfailwith ("malformed Load instruction: " ^ (Llvm_pp.string_of_rhs i)))


(*
 * Store to smt:
 * b = buffer
 * st = state
 * ty = type of value
 * v = value written
 * p = pointer
 *)
let store_to_smt b st ty v p =
  let n = bitwidth st ty in
  let old_mem = st.mem_idx in
  let new_mem = old_mem + 1 in
    bprintf b "(define-fun memory%d () Mem (write%d memory%d " new_mem n old_mem;
    val_typ_to_smt b st p;
    bprintf b " ";
    val_typ_to_smt b st (ty, v);
    bprintf b "))";
    st.mem_idx <- new_mem
	
(*
 * Right-hand side of an instruction
 *)
let rhs_to_smt b st i =
  let is_bool_type = is_bool st in 
    match i with
      | Add(_, _, (ty, x), y, _) -> binop_to_smt b st "bvadd" (ty, x) (ty, y)
      | Sub(_, _, (ty, x), y, _) -> binop_to_smt b st "bvsub" (ty, x) (ty, y)
      | Mul(_, _, (ty, x), y, _) -> binop_to_smt b st "bvmul" (ty, x) (ty, y)
      | Shl(_, _, (ty, x), y, _) -> binop_to_smt b st "bvshl" (ty, x) (ty, y)
      | Sdiv(_, (ty, x), y, _)   -> binop_to_smt b st "bvsdiv" (ty, x) (ty, y)
      | Udiv(_, (ty, x), y, _)   -> binop_to_smt b st "bvudiv" (ty, x) (ty, y)
      | Lshr(_, (ty, x), y, _)   -> binop_to_smt b st "bvlshr" (ty, x) (ty, y)
      | Ashr(_, (ty, x), y, _)   -> binop_to_smt b st "bvashr" (ty, x) (ty, y)
      | Urem((ty, x), y, _)      -> binop_to_smt b st "bvurem" (ty, x) (ty, y)
      | Srem((ty, x), y, _)      -> binop_to_smt b st "bvsrem" (ty, x) (ty, y)
      | And ((ty, x), y, _)      -> binop_to_smt b st (if is_bool_type ty then "and" else "bvand") (ty, x) (ty, y) 
      | Or  ((ty, x), y, _)      -> binop_to_smt b st (if is_bool_type ty then "or" else "bvor") (ty, x) (ty, y)	   
      | Xor ((ty, x), y, _)      -> binop_to_smt b st (if is_bool_type ty then "or" else "bvor") (ty, x) (ty, y)	   	   
      | Icmp(cmp, (ty, x), y, _) -> icmp_to_smt b st cmp (ty, x) (ty, y)
      | Select([c;t;e], _)       -> ite_to_smt b st c t e
      | Select(_)                -> Util.nfailwith ("malformed Select instruction: " ^ (Llvm_pp.string_of_rhs i))
      | Alloca(_)                -> bprintf b "%s" (sp_ref st)
      | Load(_, _, (ty, v), _, _, _) -> load_to_smt b st i ty v

      (*
	| Trunc(x, y, md)          ->
	| Zext(x, y, md)           ->
	| Sext(x, y, md)           ->
	| Bitcast(x, y, md)        ->
	| Addrspacecast(x, y, md)  ->
	| Inttoptr(x, y, md)       ->
	| Ptrtoint(x, y, md)       ->
	| Va_arg(x, y, md)         ->
	| Getelementptr(inbounds, x, md) ->
	| Shufflevector(x, md) ->
	| Insertelement(x, md) ->
	| Extractelement(x, md) ->
	| Phi(ty, incoming, md) ->
	| Landingpad(x, y, z, w, md) ->
	| Call(is_tail_call, callconv, retattrs, callee_ty, callee_name, operands, callattrs, md) ->
	| Cmpxchg(x, y, z, w, v, u, t, md) ->
	| Atomicrmw(x, y, z, w, v, u, md) ->
	| Fence(x, y, md) ->
	| Extractvalue(x, y, md) ->
	| Insertvalue(x, y, z, md) ->
	
	| Unreachable md ->
	| Return(None, md) ->
	| Return(Some(x, y), md) ->
	| Br(x, None, md) ->
	| Br(x, Some(y, z), md) ->
	| Indirectbr(x, y, md) ->	   
	| Resume(x, md) ->
	| Switch(x, y, z, md) ->	   
	| Invoke(x, y, z, w, v, u, t, s, md) ->

      *)
      | _ ->
	  let msg = (Llvm_pp.string_of_rhs i) in
	    eprintf "WARNING: %s" msg;
	    raise (InstructionNotSupported msg)

let rhs_to_string st i = 
  let b = Buffer.create 100 in
    rhs_to_smt b st i;
    Buffer.contents b


(*
 * Instructions that have side effect on the memory or stack pointer
 * - for now, we just handle store and alloca
 *)
let instr_effect b st rhs =
  match rhs with
    | Alloca(_, y, z, w, _) ->  alloca_to_smt b st y z
    | Store(_, _, (ty, z), w, _, _, _) -> store_to_smt b st ty z w
    | Call(_, _, _, _, _, _, _, _) ->
	let msg = (Llvm_pp.string_of_rhs rhs) in
	  eprintf "WARNING: %s" msg;
	  raise (InstructionNotSupported msg)
    | Fence(_, _, _) ->
	let msg = (Llvm_pp.string_of_rhs rhs) in
	  eprintf "WARNING: %s" msg;
	  raise (InstructionNotSupported msg)
    | _ ->  ()
	
let instr_effect_to_string st rhs =
  let b = Buffer.create 100 in
    instr_effect b st rhs;
    Buffer.contents b
  
	
(*
 * Convert instruction to smt
 * - st = state
 *)
let instr_assign b st n rhs =
  begin
    bprintf b "(define-fun ";
    name_to_smt b n;
    bprintf b " () ";
    typ_to_smt b st (Bc_manip.typ_of_var st.cu (state_fu st) n);
    bprintf b " ";
    rhs_to_smt b st rhs;
    bprintf b ")"
  end

let instr_assign_to_string st n rhs =
  let b = Buffer.create 100 in
    instr_assign b st n rhs;
    Buffer.contents b

(*
 * For assignments we don't support, we just add a declaration:
 * - st = state
 * - n = left-hand side of the assignment
 *)
let decl_to_smt b st n =
  begin
    bprintf b "(declare-fun ";
    name_to_smt b n;
    bprintf b " () ";
    typ_to_smt b st (Bc_manip.typ_of_var st.cu (state_fu st) n);
    bprintf b ")"
  end
  
let decl_to_string st n = 
  let b = Buffer.create 40 in
    decl_to_smt b st n;
    Buffer.contents b

(*
 * Convert instruction to smt
 * - st = state
 *)
let instr_to_smt b st (v, rhs) =
  bprintf b ";;%s" (Llvm_pp.string_of_instr (v, rhs));
  (* according to the grammar the None case must be in { call, store, fence } U Terminators *)
  match v with 
    | None ->
	(try 
	   let effect = instr_effect_to_string st rhs in
	     if effect <> "" then bprintf b "%s\n" effect
	 with 
	     (InstructionNotSupported _) -> bprintf b ";;  Not supported!\n")

    | Some n ->
	(try 
	   let effect = instr_effect_to_string st rhs in
	   let assign = instr_assign_to_string st n rhs in
	     if effect <> "" then bprintf b "%s\n" effect;
	     if assign <> "" then bprintf b "%s\n" assign
	 with
	     (InstructionNotSupported _) -> bprintf b "%s\n" (decl_to_string st n))
	

let declare_state b st =
  let aw = st.addr_width in 
    bprintf b "(declare-fun %s () Mem)\n" (mem_ref st);
    bprintf b "(define-fun %s () %s %s)\n" (sp_ref st) (Prelude.addr_type aw) (Prelude.zero_address aw)

let declare_parameters b st =
  let rec loop param_list ctr =
    match param_list with 
      | [] -> ()
      | (ty, _, v) :: tl ->
	  let x, new_ctr  = match v with Some k -> (k, ctr) | None -> Id(false, ctr), (ctr + 1) in 
	    bprintf b "(declare-fun ";
	    name_to_smt b x;
	    bprintf b " () ";
	    typ_to_smt b st ty;
	    bprintf b ")\n";
	    loop tl new_ctr
  in
    match st.fu with
      | Some(f) -> loop (fst f.fparams) 0
      | None -> ()

(*
 * We just declare globals for now. In principle we should also
 * initialize memory for all the constants.
 *)
let declare_globals b st =
  let opt_val v = 
    match v with
      | None -> "no value"
      | Some x -> Llvm_pp.string_of_value x 
  in
  let declare_global ginfo =
    bprintf b ";; %s %s = %s\n" (Llvm_pp.string_of_var ginfo.gname) (Llvm_pp.string_of_typ ginfo.gtyp) (opt_val ginfo.gvalue);
    bprintf b "(declare-fun ";
    name_to_smt b ginfo.gname;
    bprintf b " () ";
    typ_to_smt b st (Pointer(ginfo.gtyp, None));
    bprintf b ")\n"
  in
    List.iter declare_global st.cu.cglobals    


(*
 * Outputs the block entry condition 
 *)
let smt_block_entry_condition b fu state binfo =
  let ename = "block_" ^ (string_of_int binfo.bindex) ^ "_entry_condition"; in
  let pred_list = Bc_manip.get_predecessors fu binfo.bname in 
    bprintf b ";; %s \n" ename

    
(*
 * Converts a block to a sequence of SMT definitions/declarations
 *)
let block_to_smt b fu state binfo =
  if not binfo.bseen
  then
    begin
      (* Printf.eprintf "processing block %s\n" (Llvm_pp.string_of_var binfo.bname); *)
      smt_block_entry_condition b fu state binfo;
      bprintf b ";; Block %s with predecessors:" (Llvm_pp.string_of_var binfo.bname);
      List.iter (fun v -> (bprintf b " %s" (Llvm_pp.string_of_var v))) (Bc_manip.get_predecessors fu binfo.bname);
      bprintf b "\n";
      List.iter (fun instr -> (instr_to_smt b state instr)) binfo.binstrs;
      bprintf b "\n";
    end;
  binfo.bseen <- true


(*
 *
 * Returns a list of all the currently unseen predecessors of the block.
 *
 *)
let get_predecessor_block_list fu block preds_no_cycles =
  if block.bseen
  then
    []
  else
    let pred_list = Hashtbl.find_all preds_no_cycles block.bname in 
    let candidates = List.map (fun n -> (Bc_manip.lookup_block fu n)) pred_list in
      List.filter (fun b -> not b.bseen) candidates
	
let rec block_list_to_smt b fu state block_list preds_no_cycles  =
  match block_list with
    | [] -> ()
    | block :: rest ->
	let pred_blocks = get_predecessor_block_list fu block preds_no_cycles in
	  if pred_blocks == []
	  then
	    begin
	      block_to_smt b fu state block;
	      block_list_to_smt b fu state rest preds_no_cycles
	    end
	  else
	    begin
	      block.bseen <- true;
	      block_list_to_smt b fu state pred_blocks preds_no_cycles;
	      block.bseen <- false;
	      block_to_smt b fu state block;
	      block_list_to_smt b fu state rest preds_no_cycles
	    end
	    

let fun_to_smt b fu state =
  begin
    (* TODO: don't reset the mem_idx/sp_idx counters *)
    (* reset the local counters
    state.mem_idx <- 0;
    state.sp_idx <- 0;
    *)
    (* Printf.eprintf "processing Function %s\n" (Llvm_pp.string_of_var fu.fname);  *)
    state.fu  <- Some(fu);
    bprintf b "\n;; Function: ";
    name_to_smt b fu.fname;
    bprintf b "\n";
    bprintf b ";; %s\n" (Bc_pp.string_of_fparams fu.fparams);
    if fu.fblocks  <> []
    then
      let graph = Cycles.fu_to_graph fu in
      let ll = Johnson.find_all_cycles graph in
      let preds_no_cycles =
	if List.length ll > 0
	then
	  let edges = Cycles.cycles_to_edges fu ll in
	  let preds = Hashtbl.copy fu.predecessors in
	  let snip = (fun (v0, v1) -> (Hashtbl.remove preds v1)) in
	    (List.iter snip edges); 
	    (Cycles.show_cycles b fu ll);
	    (* (Bc_manip.print_neighbors preds); *)
	    preds
	else
	  fu.predecessors
      in	
	declare_state b state;
	declare_parameters b state;
	bprintf b "\n";
	block_list_to_smt b fu state fu.fblocks preds_no_cycles;
	Buffer.add_char b '\n'
    else
      bprintf b "\n"
  end

  
let cu_to_smt b cu =
  let aw = get_addr_width cu in 
  let state = { mem_idx = 0; sp_idx = 0; fu = None; cu = cu; addr_width = aw; } in 
    Prelude.print_prelude b aw;
    declare_globals b state;
    bprintf b "\n";
    List.iter (fun f -> (fun_to_smt b f state)) cu.cfuns
