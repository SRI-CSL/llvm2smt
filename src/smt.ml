(*
 * Convert our LLVM abstract syntax to SMT2 bitvector constraints/expressions.
 *
 * Values of type Integer 1  are converted to Boolean expressions in SMT
 * Values of type (Integer n) where n>1 are converted to SMT expressions of type (_ BitVec n)
 * Values of vector type <n x tau> are converted to arrays.
 *)

open Printf
open Llvm
open Dl
open Bc   
open Util
open Big_int
   
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


let global_function_prefix = "-@"   (* the prefix that replaces @ in SMT function symbols *)
let global_register_prefix = "-@"   (* the prefix that replaces @ in SMT register symbols *)
			     
let local_function_prefix = "%" 	(* the prefix that replaces % in SMT function symbols IAM: DO THESE EXIST? *)
let local_register_prefix = "%" 	(* the prefix that replaces % in SMT register symbols *)

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
 * NOTE: If we wanted to be extra careful, we could compute all sizes
 * as big_int. Integer overflows are not very likely for sizes or alloca 
 * so we keep ordinary integers for now.
 *)

(*
 * Compute padding in bits NOT bytes
 *)
let bit_padding bit_align offset =
  let tail = offset mod bit_align in
    if tail = 0 then 0 else (bit_align - tail)

	
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
      | Vectortyp(len,element_ty) -> byte_align64 st element_ty
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
      | Vectortyp(len,element_ty) -> byte_align32 st element_ty
      | _ -> 4) (* just a guess *)

let byte_align st t  =
  assert((st.addr_width  = 64) || (st.addr_width = 32));
  if st.addr_width = 64
  then byte_align64 st t
  else byte_align32 st t

let bit_align st t =
  8 * (byte_align st t)

let rec bitwidth st t =
  let list_bitwidth typs = List.map (bitwidth st) typs in
    match t with
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
      | Structtyp(true, tys) -> (* packed *)
	  List.fold_left (fun x y -> x+y) 0 (list_bitwidth tys)
      | Structtyp(false, tys) -> (* unpacked  *)
	  bitwidth_of_struct st (bit_align st t) tys
      | Vectortyp(len,element_ty) -> len*(bitwidth st element_ty)
      | _ -> 
	  Util.nfailwith ("can't convert type: " ^ (Llvm_pp.string_of_typ t));
	  0

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
let mem_ref_idx id = "memory" ^ (string_of_int id)

let mem_ref st = mem_ref_idx st.mem_idx
      
      
(*
 * Same thing for the stack pointer
 *)
let sp_ref st = 
  "rsp" ^ (string_of_int st.sp_idx) 
      
let function_name_to_smt_string v =
  Util.spr (fun b ->
	      (fun v ->
		 (match v with
		    | Id(true, i)       -> bprintf b "%s%d"  global_function_prefix i
		    | Id(false, i)      -> bprintf b "%s%d" local_function_prefix i
		    | Name(true, name)  -> bprintf b "%s%s"  global_function_prefix name
		    | Name(false, name) -> bprintf b "%s%s" local_function_prefix name))) v

(*
 * SMT name: b = buffer, argument = var
 * - for locals, we add the function name as a suffix
 *)
let name_to_smt b st var =
  let f = st.fu in
  let fu_name = 
    (match f with 
       | Some fi -> (function_name_to_smt_string fi.fname)
       | None -> "")
  in
    (match var with
      | Id(true, i) -> bprintf b "|%s%d|" global_register_prefix i
      | Id(false, i) -> bprintf b "|%s%d%s|" local_register_prefix i fu_name
      | Name(true, name)  -> bprintf b "|%s%s|" global_register_prefix name
      | Name(false, name) -> bprintf b "|%s%s%s|" local_register_prefix name fu_name)

(*
 * SMT name string: argument = var
 *)
let name_to_smt_string st v =
  Util.spr (fun b -> name_to_smt b st) v


(*
 * SMT type for tau
 *)
let rec typ_to_smt b st tau =
  match tau with
    | Vartyp(x) -> typ_to_smt b st (Bc_manip.typ_of_var st.cu (state_fu st) x)
    | Vectortyp(n, ty) ->
	let k = Util.log2ceil n in
	let n = bitwidth st ty in
	  if n = 1 then
	    bprintf b "(Array (_ BitVec %d) Bool)" k
	  else
	    bprintf b "(Array (_ BitVec %d) (_ BitVec %d))" k n
    | _ -> 
	let n = bitwidth st tau in
	  if n = 1 then
	    bprintf b "Bool"
	  else
	    bprintf b "(_ BitVec %d)" n


(*
 * Zero bitvector of n bits
 *)
let bzero_vector_n b n =
  bprintf b "(_ bv0 %d)" n

let zero_vector n =
  Util.spr bzero_vector_n n

let bzero_vector b st typ v =
  let cu = st.cu in
  let fu = (state_fu st) in 
    if (Bc_manip.is_vector_typ cu fu typ)
    then
      let (vi, vt) = Bc_manip.deconstruct_vector_typ cu fu typ in
	bprintf b "vzero_%d_%d"  vi (bitwidth st vt)
    else 
      match v with 
	| Null -> bzero_vector_n b st.addr_width     
	| Zero -> bzero_vector_n b (bitwidth st typ) 
	| _ -> failwith("bzero_vector: not a vector")



(*
 * In several places, we may need to generate an arbitrary value of type ty
 * (e.g., that's how we deal with undef). For now, we just generate
 * a zero bitvector of the right size (or false).
 *
 * This is also used for phi instructions:`
 * It's possible for all pairs (value, label) to be forward edges.
 * This means that the current block can't be executed (its
 * entry condition is false).
 * Still we want a type-correct and syntactically correct smt
 * value for the assigments.
 *)
let bdefault_value b st ty =
  let cu = st.cu in
  let fu = (state_fu st) in 
    if (Bc_manip.is_vector_typ cu fu ty)
    then
      let (vi, vt) = Bc_manip.deconstruct_vector_typ cu fu ty in
	bprintf b "vzero_%d_%d"  vi (bitwidth st vt)
    else
      let k = bitwidth st ty in
	if k = 1 then bprintf b "false" else bzero_vector_n b k

let default_value st ty =
  let b = Buffer.create 64 in
    bdefault_value b st ty;	  
    Buffer.contents b



(*
 * In with the new ...
 *
 *)
let bbig_int_to_bv b n w =
  if (sign_big_int n) < 0
  then
    bprintf b "(bvneg (_ bv%s %d))" (string_of_big_int (minus_big_int n)) w
  else
    bprintf b "(_ bv%s %d)" (string_of_big_int n) w

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
    | Int x -> int_of_big_int x
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
       | Int(n)  -> ((int_of_big_int (mult_big_int (big_int_of_int sz)  n)), None) 
       | _ -> (sz, Some((ti, vi))))

let offset_in_packed_struct st typ_list i =
  let rec offset_in_struct_aux typ_list i sum =
    if i = 0
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
	   if i = 0
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
     | Vectortyp(length, etyp0) ->
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
     | And (x, y) -> binop_to_smt b st booltyp "and" x y
     | Or  (x, y) -> binop_to_smt b st booltyp "or" x y
     | Xor (x, y) -> binop_to_smt b st booltyp "xor" x y
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

(*
 * convert index vi of typ tyi to a bitvector of size n
 * n is the log of the number of elements in a vector type 
 *)
and vector_index_to_smt b st tyi vi n =
  let m = bitwidth st tyi in
    if m < n then
      begin
	bprintf b "((_ zero_extend %d) " (n - m);
	typ_val_to_smt b st (tyi, vi);
	bprintf b ")"
      end
    else 
      if n = m then
	typ_val_to_smt b st (tyi, vi)
      else
	begin
	  bprintf b "((_ extract %d 0) " (n - 1);
	  typ_val_to_smt b st (tyi, vi);
	  bprintf b ")"
	end



and vector_mask_select st tyM vM i =
  match vM with 
  | Zero -> 0
  | Vector(tvlist) -> 
      let (ty, vy) = List.nth tvlist i in
	(match vy with
	   | Int(n) ->  int_of_big_int n
	   | Undef -> -1
	   | _ -> failwith("Didn't expect this in a mask: "^(Llvm_pp.string_of_value vy)))
  | _ -> failwith("Didn't expect this in a mask: "^(Llvm_pp.string_of_value vM))

and shufflevector_to_smt_aux b st ty v0 v1 len tyM vM lenM =
  let cu = st.cu in
  let fu = (state_fu st) in
  let (ln, vt) = Bc_manip.deconstruct_vector_typ cu fu ty in 
  let (lm, mt) = Bc_manip.deconstruct_vector_typ cu fu tyM in
  (* routine to do the update to either v0 or v1, depending on the mask index *)
  let single_update i k vk jk =
    let kp =  k + 1 in
      bprintf b "(let ((x%d (store x%d " kp k;
      vector_index_to_smt b st mt (Int(big_int_of_int i)) lm;
      bprintf b  " (select ";
      typ_val_to_smt b st (ty, vk);
      bprintf b " ";
      vector_index_to_smt b st mt (Int(big_int_of_int jk)) ln;
      bprintf b "))))\n "
  in
  let rec close_paren k =
    if k > 0 then 
      begin
	bprintf b ")";
	close_paren (k - 1)
      end
  in
  (* loop through the mask *)
  let rec shufflevector_to_smt_loop k i =
    if lenM <= i then
      k
    else
      let mi = vector_mask_select st tyM vM i in
	if mi < 0
	then 
	  shufflevector_to_smt_loop k  (i + 1)
	else
	  begin 
	    if mi < len
	    then
	      single_update i k v0 mi
	    else
	      single_update i k v1 (mi - len);
	    shufflevector_to_smt_loop (k + 1) (i + 1)
	  end
  in
    bprintf b "\n(let ((x0 vundef_%d_%d))\n" lm (bitwidth st vt);
    let k = shufflevector_to_smt_loop 0 0 in
      bprintf b " x%d)" k;
      close_paren k
    
(*
 * Explanation: this code approximately does the loop below:
 *
   k = 0

   bprintf b "(let ( 
                 (x_0 vundef_%d_%d)" lm (bitwidth st vt)

   for(i = 0; i < lenM; i++)
     j = i-th element of vM
     if j != undef
     then if j < len
        then
            bprintf b " (x_{k+1} (store x_{k}"
            vector_index_to_smt b st mt i lm 
            bprintf b  "(select "
            typ_val_to_smt b st (ty, v0)
            vector_index_to_smt b st mt j ln 
            bprintf b "))) "
        else 
            bprintf b " (x_{k+1} (store x_{k}"
            vector_index_to_smt b st mt i lm 
            bprintf b  "(select "
            typ_val_to_smt b st  (ty, v1)
            #j - len#)))
     k += 1
	   

 *)


(*
 * The arguments should be a list of three Vector-type Vector-value pairs:
 *
 * x0 = Vectortyp(n, typ)  value0
 * x1 = Vectortyp(n, typ)  value1 
 * xM = Vectortyp(m, i32)  mask
 *
 * The mask integer values are either constant or undef. If undef the semantics is
 * "don't care"
 *
 * It will return a Vectortyp(m, typ) as described by the indexes in the mask.
 *
 * indexes from 0, ... n - 1 refer to the obvious elements of value0
 * indexes from n, ... 2n - 1 refer to the obvious elements of value1
 *
 * value1 can be undef, if we are really only shuffling the first vector.
 * mask can be "zeroinitializer"
 *
 * happy happy joy joy
 *
 *
 *)
and shufflevector_to_smt b st x0 x1 xM =
  let (ty0, v0) = x0 in
  let (ty1, v1) = x1 in
  let (tyM, vM) = xM in
      (match (ty0, ty1, tyM) with
	 | (Vectortyp(len0, etype0), Vectortyp(len1, etype1), Vectortyp(lenM, Integer(32))) ->
	     if (len0 <> len1) || (etype0 <> etype1)
	     then
	       failwith("Bad arguments to Shufflevector.")
	     else
	       shufflevector_to_smt_aux b st ty0 v0 v1 len0 tyM vM lenM
	 | _ -> failwith("Bad arguments to Shufflevector.")
      )

	
and val_to_smt b st (typ, v) =
  match v with
    | Var x             -> name_to_smt b st x
    | Null              -> bzero_vector b st typ v
    | Zero              -> bzero_vector b st typ v
    | Undef             -> bdefault_value b st typ               (* This is enough for now, but not quite what right *)
    | Int n             -> bbig_int_to_bv b n (bitwidth st typ)
    | Vector(l)         -> bvector_to_smt b st typ l
    | Trunc(x, ty)      -> trunc_to_smt b st x ty                (* VECTOR FIXME *)
    | Zext((tx, x), ty) -> zext_to_smt b st tx x ty              (* VECTOR FIXME *)
    | Sext((tx, x), ty) -> sext_to_smt b st tx x ty              (* VECTOR FIXME *)
    | Bitcast(x, ty)    -> typ_val_to_smt b st x  (* no op *)    (* VECTOR FIXME !!!!!???? %Z = bitcast <2 x int> %V to i64;   ; yields i64: %V *)
    | Inttoptr((tx, x), ty) -> int_ptr_to_smt b st tx x ty       (* VECTOR FIXME *)
    | Ptrtoint((tx, x), ty) -> int_ptr_to_smt b st tx x ty                (* VECTOR FIXME *)
    | Getelementptr(inbounds, (tx, x) :: z) -> gep_to_smt b st (tx, x) z  (* VECTOR FIXME ??? *)
    | Select([c;t;e]) -> ite_to_smt b st c t e                            (* VECTOR FIXME *)  
    | Select(_)       -> Util.nfailwith ("malformed Select: " ^ (Llvm_pp.string_of_value v))
    | Add(_, _, x, y) -> binop_to_smt b st typ "bvadd" x y
    | Sub(_, _, x, y) -> binop_to_smt b st typ "bvsub" x y
    | Mul(_, _, x, y) -> binop_to_smt b st typ "bvmul" x y
    | Shl(_, _, x, y) -> binop_to_smt b st typ "bvshl" x y
    | Sdiv(_, x, y)   -> binop_to_smt b st typ "bvsdiv" x y
    | Udiv(_, x, y)   -> binop_to_smt b st typ "bvudiv" x y
    | Lshr(_, x, y)   -> binop_to_smt b st typ "bvlshr" x y
    | Ashr(_, x, y)   -> binop_to_smt b st typ "bvashr" x y
    | Urem(x, y)      -> binop_to_smt b st typ "bvurem" x y
    | Srem(x, y)      -> binop_to_smt b st typ "bvsrem" x y
    | And (x, y)      -> binop_to_smt b st typ "bvand" x y
    | Or  (x, y)      -> binop_to_smt b st typ "bvor" x y
    | Xor (x, y)      -> binop_to_smt b st typ "bvxor" x y
    | Shufflevector([x0; x1; xM]) -> shufflevector_to_smt b st x0 x1 xM
    | _ -> 
	Util.nfailwith ("value not supported or wrong: " ^  (Llvm_pp.string_of_value v));
	bdefault_value b st typ
  
and binop_to_smt b st ty op left right =
  let cu = st.cu in
  let fu = (state_fu st) in
  let op_name =
    if (Bc_manip.is_vector_typ cu fu ty) then
      let (vi, vt) = Bc_manip.deconstruct_vector_typ cu fu ty in 
	"v" ^ op ^ "_" ^ (string_of_int vi) ^ "_" ^ (string_of_int (bitwidth st vt)) 
    else 
      op
  in
    bprintf b "(%s " op_name;
    typ_val_to_smt b st left;
    bprintf b " ";
    typ_val_to_smt b st right;
    bprintf b ")"

and ite_to_smt b st cond left right = (* if cond then left else right *)
  bprintf b "(ite ";
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

and bvector_to_smt b st typ l =
  let (k, tau) = Bc_manip.deconstruct_vector_typ st.cu (state_fu st) typ in
    bprintf b "(vmake_%d_%d " k (bitwidth st tau);
    List.iter (fun x -> typ_val_to_smt b st x; bprintf b " ") l;
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
    | Some(_, Int x) -> const_alloca_to_smt b st ty (int_of_big_int x)
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
	 let cu = st.cu in
	 let fu = state_fu st in
	   if Bc_manip.is_vector_typ cu fu t then
	     let (logn, ety) = Bc_manip.deconstruct_vector_typ cu fu t in
	       bprintf b "(cast_bits_to_vector_%d_%d (read%d %s " logn (bitwidth st ety) n (mem_ref st);
	       typ_val_to_smt b st (ty, v);
	       bprintf b "))" 
	   else
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
  let cu = st.cu in
  let fu = state_fu st in
    if Bc_manip.is_vector_typ cu fu ty then
      let (logn, ety) = Bc_manip.deconstruct_vector_typ cu fu ty in
	bprintf b "(define-fun memory%d () Mem (write%d memory%d " new_mem n old_mem;
	typ_val_to_smt b st p;
	bprintf b " ";
	bprintf b "(cast_vector_%d_%d_to_bits " logn (bitwidth st ety);
	typ_val_to_smt b st (ty, v);
	bprintf b ")))"
    else
      begin
	bprintf b "(define-fun memory%d () Mem (write%d memory%d " new_mem n old_mem;
	typ_val_to_smt b st p;
	bprintf b " ";
	typ_val_to_smt b st (ty, v);
	bprintf b "))"
      end;
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
  let fstr = function_name_to_smt_string fu.fname in
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
 * Filter out the forward edges from a list of pairs (value, label)
 * label is of the form (Basicblock xxx)
 *)
let get_backward_phi_nodes st incoming =
  let my_rank = (state_blk st).brank in
  let fu = (state_fu st) in
  let is_forward (v, label) =
    match label with 
      | Basicblock l -> (Bc_manip.lookup_block fu l).brank < my_rank
      | _ -> failwith "get_backward_phi_nodes: bad phi label\n"
  in
    List.filter is_forward incoming

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
      | [] -> bprintf b "%s" (default_value st ty)
  in
    phi_to_smt_aux (get_backward_phi_nodes st incoming)


(*
 * inserts xe into the xi-th position of the vector xv.
 *
 * xv  is a typ val pair of the form  (Vectortyp(n, ty), vv)
 * xe  is a typ val pair of the form  (ty, ve)
 * xi  is a typ val pair of the form  (Integer(m), vi)  vi may be a variable.
 *
 * if i >= n the result is undefined.
 *
 * (store xv xi xe) except that we need to turn xi into a bitvector.
 *)
let insertelement_to_smt b st xv xe xi =
  match xv, xe, xi with
    | (tyv, _), (tye, ve), (tyi, vi) ->
	let (xvi, xvt) = Bc_manip.deconstruct_vector_typ st.cu (state_fu st) tyv in
	  bprintf b "(store ";
	  typ_val_to_smt b st xv;  (* placeholders till the real thing comes along *)
	  bprintf b " ";
	  vector_index_to_smt b st tyi vi xvi;
	  bprintf b " ";
	  typ_val_to_smt b st xe;
	  bprintf b ")"
    
(*
 * extracts the *scalar* at the  xi-th position of the vector xv.
 *
 * xv  is a typ val pair of the form  (Vectortyp(n, ty), vv)
 * xi  is a typ val pair of the form  (Integer(m), vi)  vi may be a variable.
 *
 * if i >= n the result is undefined.
 *
 * Result: (select xv xi) with conversion of xi to a bitvector
 *)
let extractelement_to_smt b st xv xi =
  match xv, xi with
    | (tyv, _), (tyi, vi) ->
	let (xvi, xvt) = Bc_manip.deconstruct_vector_typ st.cu (state_fu st) tyv in
	  bprintf b "(select ";
	  typ_val_to_smt b st xv;
	  bprintf b " ";
	  vector_index_to_smt b st tyi vi xvi;
	  bprintf b ")"
    

	
(*
 * Right-hand side of an instruction
 *)
let rhs_to_smt b st ti i =
  let ti_is_bool = (is_bool st ti) in 
    match i with
      | Add(_, _, (ty, x), y, _) -> binop_to_smt b st ti "bvadd" (ty, x) (ty, y)
      | Sub(_, _, (ty, x), y, _) -> binop_to_smt b st ti "bvsub" (ty, x) (ty, y)
      | Mul(_, _, (ty, x), y, _) -> binop_to_smt b st ti "bvmul" (ty, x) (ty, y)
      | Shl(_, _, (ty, x), y, _) -> binop_to_smt b st ti "bvshl" (ty, x) (ty, y)
      | Sdiv(_, (ty, x), y, _)   -> binop_to_smt b st ti "bvsdiv" (ty, x) (ty, y)
      | Udiv(_, (ty, x), y, _)   -> binop_to_smt b st ti "bvudiv" (ty, x) (ty, y)
      | Lshr(_, (ty, x), y, _)   -> binop_to_smt b st ti "bvlshr" (ty, x) (ty, y)
      | Ashr(_, (ty, x), y, _)   -> binop_to_smt b st ti "bvashr" (ty, x) (ty, y)
      | Urem((ty, x), y, _)      -> binop_to_smt b st ti "bvurem" (ty, x) (ty, y)
      | Srem((ty, x), y, _)      -> binop_to_smt b st ti "bvsrem" (ty, x) (ty, y)
      | And ((ty, x), y, _)      -> binop_to_smt b st ti (if ti_is_bool then "and" else "bvand") (ty, x) (ty, y)
      | Or  ((ty, x), y, _)      -> binop_to_smt b st ti (if ti_is_bool then "or" else "bvor") (ty, x) (ty, y)
      | Xor ((ty, x), y, _)      -> binop_to_smt b st ti (if ti_is_bool then "xor" else "bvxor") (ty, x) (ty, y)
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
      | Insertelement([xv; xe; xi], _) ->  insertelement_to_smt b st xv xe xi
      | Extractelement([xv; xi], _) -> extractelement_to_smt b st xv xi
      | Shufflevector([x0; x1; xM], _) -> shufflevector_to_smt b st x0 x1 xM

      (*

	** Feasible

	| Addrspacecast(x, y, md)  ->
	
	--- Aggregate operations

	(N.B extractvalue seems to be used right after a landingpad)
	(N.B insertvalue seems to be used just prior to a resume)
	
	| Extractvalue(x, y, md) ->
	| Insertvalue(x, y, z, md) ->

	--- These are probably no-ops in SMT

	| Cmpxchg(x, y, z, w, v, u, t, md) ->
	| Atomicrmw(x, y, z, w, v, u, md) ->
	| Fence(x, y, md) ->

	Can't support
	| Va_arg(x, y, md)         ->
	| Landingpad(x, y, z, w, md) ->
	| Call(is_tail_call, callconv, retattrs, callee_ty, callee_name, operands, callattrs, md) ->

	Terminators (we don't deal with Resume/Invoke/Indirectbr/Unreachable)
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
  let typ = (Bc_manip.typ_of_var st.cu (state_fu st) n) in
    bprintf b "(define-fun ";
    name_to_smt b st n;
    bprintf b " () ";
    typ_to_smt b st typ;
    bprintf b " ";
    rhs_to_smt b st typ rhs;
    bprintf b ")"

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

(*
 * Functions may be used as pointers so we must declare them first
 *)
let declare_functions b st =
  let declare_function fu =
    bprintf b "(declare-fun %s" (function_name_to_smt_string fu.fname);
    bprintf b " () (_ BitVec %d))\n" (get_addr_width st.cu)
  in
    List.iter declare_function st.cu.cfuns


let smt_postcondition fu st cblk (v0, cond) =
  let fstr = function_name_to_smt_string fu.fname in
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



(*
 * Filters for the predecessors/successors of a block
 * - they remove the backward arrows
 *)
let get_backward_successor_list fu state binfo = 
  let my_rank = binfo.brank in
  let cfg_successors_list = Bc_manip.get_cfg_successors fu binfo.bname in
    List.filter (fun (bname, cond) -> (Bc_manip.lookup_block fu bname).brank < my_rank) cfg_successors_list
      
let filter_backward_predecessor_list fu binfo predlist = 
  let my_rank = binfo.brank in
    List.filter (fun (bname, cond) -> (Bc_manip.lookup_block fu bname).brank < my_rank) predlist
      
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
  let fstr = function_name_to_smt_string fu.fname in
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
 * Memory phi statement
 *)
let smt_block_entry_memory b fu state binfo =
  let cfg_pred_list = state_preds state in
  let back_pred_list = filter_backward_predecessor_list fu binfo cfg_pred_list in
  let rec phi_mem_to_smt list =
    match list with
      | [ (v, c) ] -> (* last block in an ite nest *)
	  let blk = Bc_manip.lookup_block fu v in
	    bprintf b "%s" (mem_ref_idx blk.bmem)
      | (v0, c0) :: tl ->
	  let blk = Bc_manip.lookup_block fu v0 in
	    bprintf b "\n    (ite %s %s " (smt_precondition fu state (v0, c0)) (mem_ref_idx blk.bmem);
	    phi_mem_to_smt tl;
	    bprintf b "\n    )"
      | _ -> failwith "Block entry memory failed: empty predecessor list"
  in
    if back_pred_list <> [] then
      let new_mem = state.mem_idx + 1 in
	bprintf b ";;Memory PHI\n";
	bprintf b "(define-fun memory%d () Mem " new_mem;
	phi_mem_to_smt back_pred_list;
	bprintf b ")\n";
	state.mem_idx <- new_mem

(*
 * Add a definition for the returned value (if any)
 *)
let declare_result b state =
  match state.retval with
    | None -> ()
    | Some(tau, v) ->
	let fu = state_fu state in 
	let fstr = function_name_to_smt_string fu.fname in 
	  bprintf b "(define-fun |%s_result| () " fstr;
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
	smt_block_entry_memory b fu state binfo;
	List.iter (fun instr -> (instr_to_smt b state instr)) binfo.binstrs;
	let backward_successor_list = get_backward_successor_list fu state binfo in 
	  smt_block_exit_comment b fu state binfo backward_successor_list; 
	  smt_block_exit_condition b fu state binfo backward_successor_list;
	  bprintf b "\n";
	  binfo.bseen <- true;
	  binfo.bmem <- state.mem_idx;
	  (*
	    eprintf "exit of block %d %s of %s: bmem = %d\n" binfo.bindex 
	    (Llvm_pp.string_of_var binfo.bname) (Llvm_pp.string_of_var fu.fname) binfo.bmem
	  *)
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
    declare_functions b state;
    bprintf b "\n";
    List.iter (fun f -> (fun_to_smt b f state)) cu.cfuns
