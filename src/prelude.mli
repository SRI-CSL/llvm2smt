(*
 * Prints a set of SMT definitions (prelude) into a buffer.
 * These define address types + a bunch of SMT helpers.
 *)

(*
 * Ian thinking out loud here: this would spec out what we need in our prelude.
 * It would be filled in while translating the cu.
 * We would then use it to limit the prelude definitions to those that are
 * necessary.
*)

type prelude = {
  mutable vector: (int * int) list;
  mutable vundef: (int * int) list;
  mutable vmake:  (int * int) list;
  mutable vzero:  (int * int) list;
  mutable vbinop: (int * int) list;  (* could include the actual operator *)
  mutable trunc:  (int * int) list;
  mutable vtrunc: (int * int * int) list;
}


val make_prelude: prelude
		     
		   
(*
 * Prelude: the parameter is the size of the address space
 * (i.e., the number of bits needed).
 *)
val print_prelude: Buffer.t -> int -> prelude -> unit

val addr_type: int -> string

val zero_address: int -> string

    
