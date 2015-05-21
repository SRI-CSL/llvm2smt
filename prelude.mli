(*
 * Prints a set of SMT definitions (prelude) into a buffer.
 * These define address types + a bunch of SMT helpers.
 *)

(*
 * Prelude: the parameter is the size of the address space
 * (i.e., the number of bits needed).
 *)
val print_prelude: Buffer.t -> int -> unit
