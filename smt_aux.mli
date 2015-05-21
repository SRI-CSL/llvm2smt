(*
 * HELPERS FOR CONVERSION TO SMT
 *)

(* size of the address space in bits. Use a default of 64 if we can't
 * get the address size from the compile unit datalayout string.
 *)
val get_addr_width: Bc.cunit -> int


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

(* get the function unit from state or fails with an exception if it's None *)
val state_fu: state -> Bc.finfo

(* number of bits in a type *)
val bitwidth: state -> Llvm.typ -> int

(* number of bytes in a type *)
val bytewidth: state -> Llvm.typ -> int

(* check whether type is Bool *)
val is_bool: state -> Llvm.typ -> bool

(* symbol for memory in a state *)
val mem_ref: state -> string

(* symbol for stack pointer *)
val sp_ref: state -> string

