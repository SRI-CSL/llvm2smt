(*
 * Prints a set of SMT definitions (prelude) into a buffer.
 * These define address types + a bunch of SMT helpers.
 *)

(*
 * The prelude requirements object. This specifies what we need in our prelude.
 * It is filled in while translating the cu.
 * It to limit the prelude definitions to those that are necessary.
*)

type prelude = {
  address_width: int;
  mutable vundef: (int * int) list;
  mutable vmake:  (int * int) list;
  mutable vzero:  (int * int) list;
  mutable vbinop: (int * int) list;  (* could include the actual operator *)
  mutable trunc:  (int * int) list;
  mutable vtrunc: (int * int * int) list;
  mutable cast: bool;
  mutable vector_width: int list;   (* the bit widths of the beasts found in vectors *)
  mutable vector_length: int list;  (* the LOGARITHMS of the lengths of the vectors *)
}

(* construct an empty prelude object *)
val make_prelude: int -> prelude

(* dump prelude out to standard error *)
val dump_prelude: prelude  -> unit

val cast_add: prelude -> unit
    
(* add a vundef requirement to a prelude object *)
val vundef_add:  prelude -> (int * int) -> unit

(* fetch the vundef requirements  from a prelude object *)
val vundef_fetch:  prelude -> (int * int) list

(* add a vmake requirement to a prelude object *)
val vmake_add:  prelude -> (int * int) -> unit

(* fetch the vmake requirements  from a prelude object *)
val vmake_fetch:  prelude -> (int * int) list

(* add a vzero requirement to a prelude object *)
val vzero_add:  prelude -> (int * int) -> unit

(* fetch the vzero requirements  from a prelude object *)
val vzero_fetch:  prelude -> (int * int) list

(* add a vbinop requirement to a prelude object *)
val vbinop_add:  prelude -> (int * int) -> unit

(* fetch the vbinop requirements  from a prelude object *)
val vbinop_fetch:  prelude -> (int * int) list

(* add a trunc requirement to a prelude object *)
val trunc_add:  prelude -> (int * int) -> unit

(* fetch the trunc requirements  from a prelude object *)
val trunc_fetch:  prelude -> (int * int) list

(* add a vtrunc requirement to a prelude object *)
val vtrunc_add:  prelude -> (int * int * int) -> unit

(* fetch the vtrunc requirements  from a prelude object *)
val vtrunc_fetch:  prelude -> (int * int * int) list


(*
 * Prelude the required prelude to the buffer:
 * parameters are
 *  - the buffer
 *  - the size of the address space (i.e., the number of bits needed).
 *  - the requirements
 *
 *)
val print_prelude: Buffer.t -> prelude -> unit

val addr_type: int -> string

val zero_address: int -> string

    
