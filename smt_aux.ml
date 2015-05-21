(*
 * Used in map2smt
 *)

open Dl
open Llvm
open Bc

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
      

