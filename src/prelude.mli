(*
 * Prints a set of SMT definitions (prelude) into a buffer.
 * These define address types + a bunch of SMT helpers.
 *)

(*
 * The prelude requirements object. This specifies what we need in our prelude.
 * It is filled in while translating the cu.
 * It is designed to limit the prelude definitions to those that are necessary.
*)
 
type prelude = {
  address_width: int;
  (* binary prelude parametric operations *)
  twos_keys: string list;
  twos_table:  (string, (int * int) list) Hashtbl.t;
  (* ternary prelude parametric operations *)
  threes_keys: string list;
  threes_table:  (string, (int * int * int) list) Hashtbl.t;
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

(* add a vmake requirement to a prelude object *)
val vmake_add:  prelude -> (int * int) -> unit

(* add a vzero requirement to a prelude object *)
val vzero_add:  prelude -> (int * int) -> unit

(* add a vbinop requirement to a prelude object *)
val vbinop_add:  prelude -> (int * int) -> unit

(* add a trunc requirement to a prelude object *)
val trunc_add:  prelude -> (int * int) -> unit

(* add a vtrunc requirement to a prelude object *)
val vtrunc_add:  prelude -> (int * int * int) -> unit

(* add a zext requirement to a prelude object *)
val zext_add:  prelude -> (int * int) -> unit

(* add a vzext requirement to a prelude object *)
val vzext_add:  prelude -> (int * int * int) -> unit

(* add a sext requirement to a prelude object *)
val sext_add:  prelude -> (int * int) -> unit

(* add a vsext requirement to a prelude object *)
val vsext_add:  prelude -> (int * int * int) -> unit

(* add a int_ptr requirement to a prelude object *)
val int_ptr_add:  prelude -> (int * int) -> unit

(* add a vint_ptr requirement to a prelude object *)
val vint_ptr_add:  prelude -> (int * int * int) -> unit

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

    
