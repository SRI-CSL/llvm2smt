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
 * - fu = current function (or None)
 * - blk = current block (or None)
 * - preds = cfg_preds of the current block (or None)
 * - retval = return value (either a typ_val pair or None)
 * We also store the compilation unit and address width
 * - these are needed to get type and bitsize information
 *)
type state = {
  mutable mem_idx: int;
  mutable sp_idx: int;
  mutable fu: Bc.finfo option;
  mutable blk: Bc.binfo option;
  mutable preds: (Bc.cfg_edge list) option;
  mutable retval: (typ * value) option;
  cu: Bc.cunit;
  addr_width: int;
}

let state_fu st =
  let f = st.fu  in
    (match f with
       | Some fu -> fu
       | None -> failwith "state fu field (i.e. a finfo) not set!")
    
let state_blk st =
  let blk = st.blk  in
    (match blk with
       | Some binfo -> binfo
       | None -> failwith "state blk field (i.e. a binfo) not set!")
    
let state_preds st =
  let preds = st.preds  in
    (match preds with
       | Some binfo -> binfo
       | None -> failwith "state preds field (i.e. a binfo) not set!")
    

let init_state fu st =
  st.fu <- Some(fu);
  st.blk <- None;
  st.preds <- None;
  st.mem_idx <- st.mem_idx + 1;
  st.sp_idx  <- st.sp_idx + 1;
  st.retval <- None

let state_store_return st x =
  st.retval <- x

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
 * - for locals, we add the function name as a suffix
 *)
let name_to_smt b st var =
  let f = st.fu in
  let fu_name = 
    (match f with 
       | Some fi -> "_" ^ (Llvm_pp.string_of_var fi.fname)
       | None -> "")
  in
    (match var with
      | Id(true, i) -> bprintf b "|@%d|" i
      | Id(false, i)      -> bprintf b "|%%%d%s|" i fu_name
      | Name(true, name)  -> bprintf b "|@%s|" name
      | Name(false, name) -> bprintf b "|%%%s%s|" name fu_name)

(*
 * SMT name string: argument = var
 *)
let name_to_smt_string st v =
  Util.spr (fun b -> name_to_smt b st) v

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

(*
 * In with the new ...
 *
 *)
let bbig_int_to_bv b n w =
  if (Big_int.sign_big_int n) < 0
  then
    bprintf b "(bvneg (_ bv%s %d))" (Big_int.string_of_big_int (Big_int.minus_big_int n)) w
  else
    bprintf b "(_ bv%s %d)" (Big_int.string_of_big_int n) w

let big_int_to_bv n w =
  let b = Buffer.create 64 in
    bbig_int_to_bv b n w;	  
    Buffer.contents b


(*
 * Out with the old ???
 *
 *)
let bint_to_bv b n w =
  if n < 0
  then
    bprintf b "(bvneg (_ bv%d %d))" ( - n) w
  else
    bprintf b "(_ bv%d %d)" n w

let int_to_bv n w =
  let b = Buffer.create 64 in
    bint_to_bv b n w;	  
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
 * These two types are not used. They are just commentary.
 * To implement GEP we provide a function
 *
 *  gep_offset st typ z
 *
 * which returns a pair (etype, offset)
 *
 * etype: the type of the thing at the end of the z path in typ.
 *
 * offset: the polynomial representing the offset from the
 * base pointer needed to get to the thing at the end of
 * the z path in typ. i.e. the thing of type etype.
 *
 * The offset is a polynomial, since the path may use values as
 * indexes (though these variable indices can only index through arrays and pointers,
 * not structs.) 
 *
 *
 * The polynomial offset returned by gep_offset is in
 * canonical form:
 *
 *  ((n, None),  (n0, Some(ti0, vi0)),  ...,  (nM, Some(tiM, viM)))
 *
 * n can be 0, none of the nI are. The non-constant terms can be empty. The index M could
 * be arbitrarily large.
 *
 *)
type polyoffset = int * ((typ * value) option)

type offset = polyoffset list

(* prints an offset polynomial *)
let print_polyoffset po =
  (match po with
     | (n, None)  -> Printf.eprintf "GEP = %d" n
     | (n, Some (t, v)) -> Printf.eprintf " + (%d * %s : %s)" n (Llvm_pp.string_of_value v) (Llvm_pp.string_of_typ t)
  )

let print_offset_list offset =
  List.iter print_polyoffset offset

let bpr_polyoffset b po =
  (match po with
     | (n, None)  -> bprintf b ";;;GEP = %d" n
     | (n, Some (t, v)) -> bprintf b " + (%d * %s : %s)" n (Llvm_pp.string_of_value v) (Llvm_pp.string_of_typ t)
  )

let bpr_offset_list b offset =
  List.iter (fun po -> bpr_polyoffset b po) offset
  
    
let is_zero_poly p =
    (match p with 
       | (0, _) -> true
       | _ -> false)

let add_to_offset p off =
    if (is_zero_poly p)
    then
      off
    else
      (match off with
	| [] -> [p]
	| hd :: tl  -> if (is_zero_poly hd) then p :: tl else p :: off)

let canonicalize offset =
  let rec canonicalize_aux offset sum rest = 
    (match offset with
       | [] -> (sum, None) :: rest
       | hd :: tl ->
	   (match hd with
	      | (n, None) -> canonicalize_aux tl (sum + n) rest
	      | (0, _) -> canonicalize_aux tl sum rest
	      | _ -> canonicalize_aux tl sum (hd :: rest)))
  in 
    canonicalize_aux offset 0 []
			     
let make_offset st ty ti vi =
  let sz = bytewidth st ty in
    (match vi with
       | Int(n)  -> (sz * (Big_int.int_of_big_int n), None)   (* should we worry about trucation? *)
       | _ -> (sz, Some((ti, vi))))

let offset_in_packed_struct st typ_list i =
  let rec offset_in_struct_aux typ_list i sum =
    if i == 0
    then
      sum
    else
      (match typ_list with
	 | [] -> sum
	 | hd :: tl -> offset_in_struct_aux tl (i - 1) sum + (bytewidth st hd)
      )
  in
    (offset_in_struct_aux typ_list i 0)
      
let offset_in_unpacked_struct st typ_list i =
  let rec offset_in_unpacked_struct_aux offset typ_list i =
    (match typ_list with
       | [] -> offset/8
       | ty::tl ->
	   if i == 0
	   then
	     (offset + (bit_padding (bit_align st ty) offset))/8
	   else
	     let width = bitwidth st ty in
	     let ty_align = (bit_align st ty) in
	     let new_offset = offset + (bit_padding ty_align offset) + width  in
	       offset_in_unpacked_struct_aux new_offset tl (i - 1))  
  in
    offset_in_unpacked_struct_aux 0 typ_list i
      

let offset_in_struct st packed typ_list i =
  (* Printf.eprintf "offset_in_struct %s %d\n" (Llvm_pp.string_of_typs typ_list) i; *)
  if packed
  then
    offset_in_packed_struct st typ_list i
  else
    offset_in_unpacked_struct st typ_list i
      
      
(*
 * gep_step is the recursion step of gep_offset. It returns
 *
 * (etyp0, offset0)  the type and offset of the vi-th
 * position in typ.
 *
 * This function is only recursive because of the possible need
 * for a Vartyp lookup.
 *
 *)
let rec gep_step st typ ti vi = 
  (match typ with
     | Vartyp(vt) ->
	 let vty = (Bc_manip.typ_of_var st.cu (state_fu st) vt)
	 in
	   gep_step st vty ti vi
     | Structtyp(packed, typ_list) ->
	 let i = (val_to_int vi) in
	 let etyp0 = List.nth typ_list i in 
	 let offset0 = ((offset_in_struct st packed typ_list i), None) in
	   (etyp0, offset0)
     | Arraytyp(length, etyp0) ->
	 let offset0 = (make_offset st etyp0 ti vi) in 
	   (etyp0, offset0)
     | Vector(length, etyp0) ->
	 let offset0 = (make_offset st etyp0 ti vi) in 
	   (etyp0, offset0)
     | Pointer(etyp0, _) ->
	 let offset0 = (make_offset st etyp0 ti vi) in 
	   (etyp0, offset0)
     | _ -> failwith("offset_of_aux: typ = "^(Llvm_pp.string_of_typ typ)^", vi = "^(Llvm_pp.string_of_value vi)^"\n"))
  
  
  

(*
  if etyp is a struct then i must be an integer constant.
  
  if etyp is an array [ len * etype0 ] then we will be doing a rec call to:

      gep_offset st typ etyp0 z0 (current + (i * sizeof(etype0)))
  
  if etype is a struct then we can compute the i-th member type etype0 and again
  do a recursive call to:

      gep_offset st typ etyp0 z0 (current + offset_of(etype, i))

  if etyp is a vector then some research is required.

  N.B. since we may encounter non constant indexes "current" will be of
  type offset (i.e. a list of polyoffsets)
  
*)
let gep_offset st etyp z =
  let rec gep_offset_aux st etyp z current =
    (match z with
       | [] -> (etyp, (canonicalize current))
       | (ti, vi) :: z0  ->
	   let (etyp0, offset) = gep_step st etyp ti vi in
	     gep_offset_aux st etyp0 z0  ( add_to_offset offset current) )
  in
    gep_offset_aux st etyp z [(0, None)]

(*
 * Forms a non-associate bv addition of the constituent (string representations)
 * of smt terms in the list. Used in gep_to_smt.
 *)
let rec bvsum b plist =
  (match plist with
     | [] -> failwith ("bvsum in a conundrum")
     | [p] -> bprintf b "%s" p
     | hd :: tl ->  bprintf b "(bvadd %s %a)" hd bvsum tl)

(*
 * Typed value --> converted to an SMT expression
 * Raise Exception InstructionNotSupported ... 
 *)
exception InstructionNotSupported of string

let rec typ_val_to_smt b st (typ, v) =
  if is_bool st typ then 
    bool_val_to_smt b st v 
  else 
    val_to_smt b st (typ, v)

and bool_val_to_smt b st v =
  (match v with
     | Var x -> name_to_smt b st x
     | True -> bprintf b "true"
     | False -> bprintf b "false"
     | And (x, y) -> binop_to_smt b st "and" x y
     | Or  (x, y) -> binop_to_smt b st "or" x y
     | Xor (x, y) -> binop_to_smt b st "xor" x y
     | Icmp(cmp, x, y) -> icmp_to_smt b st cmp x y
     | _ -> Util.nfailwith ("bool value not supported: " ^  (Llvm_pp.string_of_value v)))

and trunc_to_smt b st x ty =
  let n = (bitwidth st ty) in
    bprintf b "((_ extract %d 0) " (n - 1);
    typ_val_to_smt b st x;
    bprintf b ")"

and zext_to_smt b st tx x ty = 
  if is_bool st tx then
    let n = (bitwidth st ty) in
      bprintf b "(ite ";
      typ_val_to_smt b st (tx, x);
      bprintf b " (_ bv1 %d) (_ bv0 %d))" n n;
  else
    let n = (bitwidth st ty) - (bitwidth st tx) in
      bprintf b "((_ zero_extend %d) " n;
      typ_val_to_smt b st (tx, x);
      bprintf b ")"

and sext_to_smt b st tx x ty = 
  if is_bool st tx then
    let n = (bitwidth st ty) in
      bprintf b "(ite ";
      typ_val_to_smt b st (tx, x);
      bprintf b " (bvneg (_ bv1 %d)) (_ bv0 %d))" n n;
  else
    let n = (bitwidth st ty) - (bitwidth st tx) in
      bprintf b "((_ sign_extend %d) " n;
      typ_val_to_smt b st (tx, x);
      bprintf b ")"	       

and int_ptr_to_smt b st tx x ty = 
  let np = (bitwidth st tx) in  (* source size *)
  let n = (bitwidth st ty) in   (* destination *)
    if np < n then
      (* zero extend *)
      begin
	bprintf b "((_ zero_extend %d) " (n - np);
	typ_val_to_smt b st (tx, x);
	bprintf b ")"
      end
    else if np > n then
      (* truncate *)
      begin
	bprintf b "((_ extract %d 0) " (n - 1);
	typ_val_to_smt b st (tx, x);
	bprintf b ")"
      end
      
    else
      (* no op *)
      typ_val_to_smt b st (tx, x)

and gep_to_smt b st (tx, x) z =
  (match tx with
     | Pointer(totyp, _) ->
	 let (aty, apolylist) = gep_offset st tx z in
	 let offsets = List.map (fun poly -> polyoffset_to_smt st poly) apolylist in
	   (*
	     bpr_offset_list b apolylist;
	     bprintf b "\n;; GEP HERE\n";
	   *)
	   bprintf b "(bvadd ";
	   val_to_smt b st (tx, x);
	   bprintf b " ";
	   bvsum b offsets;
	   bprintf b ")"
     | _ -> failwith("Crazy GEP type: "^(Llvm_pp.string_of_typ tx)^"\n")
  )
	      
and polyoffset_to_smt st poly =
  (match poly with
     | (n, None)  ->  int_to_bv n st.addr_width
     | (n, Some(ti, vi)) ->
	 let w = bitwidth st ti in
	 let c = int_to_bv n w in
	 let v =  typ_val_to_smt_string st (ti, vi) in
	 let raw = "(bvmul " ^ c ^ " " ^ v ^ ")" in 
	   if w < st.addr_width
	   then
	     "((_ sign_extend " ^ (string_of_int (st.addr_width - w)) ^ ") " ^ raw ^")"
	   else
	     raw
  ) 
	
and val_to_smt b st (typ, v) =
  (match v with
     | Var x             -> name_to_smt b st x
     | Null              -> zero_vector b st.addr_width
     | Zero              -> zero_vector b (bitwidth st typ)
     | Int n             -> bbig_int_to_bv b n (bitwidth st typ)
     | Trunc(x, ty)      -> trunc_to_smt b st x ty
     | Zext((tx, x), ty) -> zext_to_smt b st tx x ty
     | Sext((tx, x), ty) -> sext_to_smt b st tx x ty
     | Bitcast(x, ty)    -> typ_val_to_smt b st x  (* no op *)
     | Inttoptr((tx, x), ty) -> int_ptr_to_smt b st tx x ty
     | Ptrtoint((tx, x), ty) -> int_ptr_to_smt b st tx x ty
     | Getelementptr(inbounds, (tx, x) :: z) -> gep_to_smt b st (tx, x) z
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
  typ_val_to_smt b st left;
  bprintf b " ";
  typ_val_to_smt b st right;
  bprintf b ")"

and ite_to_smt b st cond left right = (* if cond then left else right *)
  bprintf b "(if ";
  typ_val_to_smt b st cond;
  bprintf b " ";
  typ_val_to_smt b st left;
  bprintf b " ";
  typ_val_to_smt b st right;
  bprintf b ")"

and icmp_to_smt b st cmp left right = (* Comparison: cmp = operation, left/right = integer arguments *)
  bprintf b "(%s " (icmp_op_to_smt cmp);
  typ_val_to_smt b st left;
  bprintf b " ";
  typ_val_to_smt b st right;
  bprintf b ")"

and typ_val_to_smt_string st (typ, v) =
  Util.spr (fun b -> typ_val_to_smt b st) (typ, v)

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
	     typ_val_to_smt b st (ty, v);
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
    typ_val_to_smt b st p;
    bprintf b " ";
    typ_val_to_smt b st (ty, v);
    bprintf b "))";
    st.mem_idx <- new_mem


(*
 * Deal with branch conditions
 * - smt_eq_condition entry_cond typ v const:
 *   v is a value of type typ
 *   const is a constant of type typ
 *
 * - smt_distinct_condition entry_cond typ v const_list
 *   v is a value of type typ
 *   const_list is a list of constants of type typ 
 *   the function produces 
 *     (and entry_cond (not (= v c_1)) ... (not (= (v c_n))))
 *)
let smt_eq_condition st entry_cond typ v const =
  let register = name_to_smt_string st (Bc_manip.value_to_var v) in
  let conjunct = 
    match const with
      | True -> register
      | False -> "(not "^register^")"
      | _ -> "(= " ^ register ^ " " ^ (typ_val_to_smt_string st (typ, const)) ^ ")"
  in
    "(and " ^entry_cond^" "^conjunct^")"

let smt_distinct_condition st entry_cond typ v const_list =
  let register = name_to_smt_string st (Bc_manip.value_to_var v) in
  let diseq c = "(not (= " ^ register ^ " " ^ (typ_val_to_smt_string st (typ, c)) ^ "))" in
  let conjuncts = List.fold_left (fun s c -> s ^ " " ^ (diseq c))  "" const_list in
    "(and " ^ entry_cond ^ " " ^ conjuncts ^ ")"


(*
 * Translates a cfg_edge into a smt term.
 * (v0, cond) is the cfg_edge
 * v0 is the name of predecessor block
 * cond is the branching condition under which we
 * come from v0.
 *)
let smt_precondition fu st (v0, cond) =
  let fstr = Llvm_pp.string_of_var fu.fname in
  let pblk = Bc_manip.lookup_block fu v0 in
  let entry_cond_name = Bc_manip.get_entry_condition_name fstr pblk.bindex in 
    (match cond with
       | Uncond -> entry_cond_name
       | Eq(t, v, const) -> 
	   smt_eq_condition st entry_cond_name t v const
       | Distinct(t, v, const_list) -> 
	   smt_distinct_condition st entry_cond_name t v const_list
       | Unsupported -> failwith "Unsupported predecessor condition!"
    )


(*
 * Return the condition for the egde from src label
 * - this scans the predecessor list for the current block
 *)
let condition_from_block pred_list label =
  let rec loop l = 
    match l with
      | (v, c) :: tl -> if v = label then c else loop tl
      | _ -> failwith ("Condition_from_block failed: block " ^ (Llvm_pp.string_of_var label) ^ " not found")
  in loop pred_list

(*
 * incoming is a (value * value) list of the form
 *
 * ( (v0, label0) ... (vN, labelN) )
 *)
let phi_to_smt b st ty incoming =
  let preds = state_preds st in
  let rec phi_to_smt_aux list = 
    match list with
      | [(v, (Basicblock label))] -> typ_val_to_smt b st (ty, v) (* last elsif condition is ignored *)
      | (v, (Basicblock label)) :: tl ->
	  let cnd = condition_from_block preds label in
	  let fu = state_fu st in
	    bprintf b "(ite %s " (smt_precondition fu st (label, cnd));
	    typ_val_to_smt b st (ty, v);
	    bprintf b " ";
	    phi_to_smt_aux tl;
	    bprintf b ")"
      | (v1, v2) :: tl -> failwith ("Malformed phi expression: v2 is " ^ (Llvm_pp.string_of_value v2) ^ "\n");
      | [] -> failwith "Malformed phi expression: empty list\n"
  in
    phi_to_smt_aux incoming

  
 
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
      | Trunc(x, ty, _)          -> trunc_to_smt b st x ty
      | Zext((tx, x), ty, _)     -> zext_to_smt b st tx x ty
      | Sext((tx, x), ty, _)     -> sext_to_smt b st tx x ty
      | Bitcast(x, ty, _)        -> typ_val_to_smt b st x (* no op *)
      | Inttoptr((tx, x), ty, _) -> int_ptr_to_smt b st tx x ty
      | Ptrtoint((tx, x), ty, _) -> int_ptr_to_smt b st tx x ty
      | Getelementptr(inbounds, (tx, x) :: z, _) -> gep_to_smt b st (tx, x) z
      | Phi(ty, incoming, _) -> phi_to_smt b st ty incoming
      (*

	Feasible
	| Addrspacecast(x, y, md)  ->
	| Extractvalue(x, y, md) ->
	| Insertvalue(x, y, z, md) ->

	Maybe, but probably not easy
	| Cmpxchg(x, y, z, w, v, u, t, md) ->
	| Atomicrmw(x, y, z, w, v, u, md) ->
	| Fence(x, y, md) ->
	| Shufflevector(x, md) ->
	| Insertelement(x, md) ->
	| Extractelement(x, md) ->

	Can't support
	| Va_arg(x, y, md)         ->
	| Landingpad(x, y, z, w, md) ->
	| Call(is_tail_call, callconv, retattrs, callee_ty, callee_name, operands, callattrs, md) ->

	Terminators
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
    | Return(x,_) -> 
	state_store_return st x
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
    name_to_smt b st n;
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
    name_to_smt b st n;
    bprintf b " () ";
    typ_to_smt b st (Bc_manip.typ_of_var st.cu (state_fu st) n);
    bprintf b ")"
  end
  
let decl_to_string st n = 
  let b = Buffer.create 40 in
    decl_to_smt b st n;
    Buffer.contents b


let commentify str =
  let subst =  Str.global_replace (Str.regexp "\n") "\n;; " in
    (subst (String.trim str))
      
(*
 * Convert instruction to smt
 * - st = state
 *)
let instr_to_smt b st (v, rhs) =
  bprintf b ";; %s\n" (commentify (Llvm_pp.string_of_instr (v, rhs)));
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
	    name_to_smt b st x;
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
    name_to_smt b st ginfo.gname;
    bprintf b " () ";
    typ_to_smt b st (Pointer(ginfo.gtyp, None));
    bprintf b ")\n"
  in
    List.iter declare_global st.cu.cglobals    




let smt_postcondition fu st cblk (v0, cond) =
  let fstr = Llvm_pp.string_of_var fu.fname in
  let entry_cond_name = Bc_manip.get_entry_condition_name fstr cblk.bindex in 
  let smt_cond = 
    (match cond with
       | Eq(t, v, const) -> 
	   smt_eq_condition st entry_cond_name t v const
       | Distinct(t, v, const_list) -> 
	   smt_distinct_condition st entry_cond_name t v const_list
       | Uncond ->
(*	   failwith ("Unconditonal backward pointer! in function " ^ fstr ^ ", block " ^ (Llvm_pp.string_of_var cblk.bname)); *)
	   entry_cond_name	   
       | Unsupported -> failwith "Unsupported predecessor condition!"
    )
  in
    "(not " ^ smt_cond ^ ")"


(*
 * Translates a list of cfg_edges into a list of
 * smt terms.
 *)
let smt_precondition_list fu st cfg_pred_list =
  List.map
    (fun e -> (smt_precondition fu st e))
    cfg_pred_list

let smt_postcondition_list fu st binfo cfg_succ_list =
  List.map
    (fun e -> (smt_postcondition fu st binfo e))
    cfg_succ_list





let get_backward_successor_list fu state binfo = 
  let my_rank = binfo.brank in
  let cfg_successors_list = Bc_manip.get_cfg_successors fu binfo.bname in
    List.filter (fun (bname, cond) -> (Bc_manip.lookup_block fu bname).brank < my_rank) cfg_successors_list
      
(*
 * Outputs the block exit condition  
 *)
let smt_block_exit_comment b fu state binfo backward_successor_list =
  if backward_successor_list = []
  then
    bprintf b ";; No backward arrows\n"
  else
    begin
      bprintf b ";; BACKWARD ARROWS: ";
      List.iter (fun (bname, cond) -> (bprintf b " %s" (Llvm_pp.string_of_var bname))) backward_successor_list;
      bprintf b "\n";
    end
    
(*
 * Outputs the block exit condition  
 *)
let smt_block_exit_condition b fu state binfo backward_successor_list =
  if backward_successor_list <> []
  then
    let cond_list = smt_postcondition_list fu state binfo backward_successor_list in
      begin
	bprintf b "(assert \n";
	if List.length cond_list = 1
	then
	  bprintf b "    %s\n" (List.nth cond_list 0)
	else
	  begin
	    bprintf b "    (and\n";
	    List.iter (fun c -> bprintf b "        %s\n" c) cond_list;
	    bprintf b "    )\n";
	  end;
	bprintf b ")\n"
      end


(*
 * Prefixes an informative comment about a block prior to its
 * corresponding sequence of SMT definitions/declarations.
 *)
let smt_block_entry_comment b fu state binfo =
  let cfg_pred_list = state_preds state in 
  let pred_list = List.map (fun (v, e) -> v) cfg_pred_list in
  let blkname = (Llvm_pp.string_of_var binfo.bname) in
  let unseen = Bc_manip.get_predecessor_block_list fu binfo in 
    (* Printf.eprintf "processing block %s\n" blkname; *)
    bprintf b ";; BLOCK %s with index %d and rank = %d\n" blkname binfo.bindex binfo.brank;
    bprintf b ";; Predecessors:";
    List.iter (fun v -> (bprintf b " %s" (Llvm_pp.string_of_var v))) pred_list;
    bprintf b "\n";
    if unseen <> []
    then
      begin
	bprintf b ";; Backward pointers:";
	List.iter (fun blk -> (bprintf b " %s" (Llvm_pp.string_of_var blk.bname))) unseen;
	bprintf b "\n";
      end

(*
 * Outputs the block entry condition 
 *)
let smt_block_entry_condition b fu state binfo =
  let cfg_pred_list = state_preds state in 
  let fstr = Llvm_pp.string_of_var fu.fname in
  let ename = Bc_manip.get_entry_condition_name fstr binfo.bindex in
  let seen_pred_list =  List.filter (fun (bname, cond) -> (Bc_manip.lookup_block fu bname).bseen) cfg_pred_list in
    bprintf b ";; %s \n" ename;
    if seen_pred_list = []
    then
      bprintf b "(define-fun %s () Bool true)\n" ename
    else
      let cond_list = smt_precondition_list fu state seen_pred_list in
	bprintf b "(define-fun %s () Bool\n" ename;
	if List.length cond_list = 1
	then
	  bprintf b "    %s\n" (List.nth cond_list 0)
	else
	  begin
	    bprintf b "    (or\n";
	    List.iter (fun c -> bprintf b "        %s\n" c) cond_list;
	    bprintf b "    )\n";
	  end;
	bprintf b ")\n"


(*
 * Add a definition for the returned value (if any)
 *)
let declare_result b state =
  match state.retval with
    | None -> ()
    | Some(tau, v) ->
	let fu = state_fu state in 
	let fstr = Llvm_pp.string_of_var fu.fname in 
	  bprintf b "(define-fun %s_result () " fstr;
	  typ_to_smt b state tau;
	  bprintf b " ";
	  typ_val_to_smt b state (tau, v);
	  bprintf b ")\n"
	    
(*
 * Converts a block to a sequence of SMT definitions/declarations
 *)
let block_to_smt b fu state binfo =
  if not binfo.bseen
  then
    begin
      let cfg_pred_list = Bc_manip.get_cfg_predecessors fu binfo.bname in
	(* keep track of the current block  (used in phi instructions) *)
	state.blk <- Some(binfo);
	(* keep track of our predecessors (used in phi instructions) *)
	state.preds <- Some(cfg_pred_list);
	smt_block_entry_comment b fu state binfo;
	smt_block_entry_condition b fu state binfo;
	List.iter (fun instr -> (instr_to_smt b state instr)) binfo.binstrs;
	let backward_successor_list = get_backward_successor_list fu state binfo in 
	  smt_block_exit_comment b fu state binfo backward_successor_list; 
	  smt_block_exit_condition b fu state binfo backward_successor_list;
	  bprintf b "\n";
	  binfo.bseen <- true;
    end


let fun_to_smt b fu state =
  begin
    init_state fu state;
    bprintf b "\n;; Function: ";
    name_to_smt b state fu.fname;
    bprintf b "\n";
    bprintf b ";; %s\n" (Bc_pp.string_of_fparams fu.fparams);
    if fu.fblocks  <> []
    then
      begin
	Bc_manip.set_ranks fu;
	let compare b1 b2 = Pervasives.compare b1.brank b2.brank in 
	let block_list = List.sort compare fu.fblocks in 
	  declare_state b state;
	  declare_parameters b state;
	  bprintf b "\n";
	  List.iter (fun blk -> block_to_smt b fu state blk) block_list; 
	  Buffer.add_char b '\n';
	  declare_result b state
      end
    else
      bprintf b "\n"
  end

  
let cu_to_smt b cu =
  let aw = get_addr_width cu in 
  let state = { mem_idx = 0; sp_idx = 0; fu = None; blk = None; preds = None; cu = cu; addr_width = aw; retval = None; } in 
    Prelude.print_prelude b aw;
    declare_globals b state;
    bprintf b "\n";
    List.iter (fun f -> (fun_to_smt b f state)) cu.cfuns
