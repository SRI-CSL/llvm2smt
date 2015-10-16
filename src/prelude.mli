(* Copyright (c) 2015, SRI International

   Permission is hereby granted, free of charge, to any person
   obtaining a copy of this software and associated documentation files
   (the "Software"), to deal in the Software without restriction,
   including without limitation the rights to use, copy, modify, merge,
   publish, distribute, sublicense, and/or sell copies of the Software,
   and to permit persons to whom the Software is furnished to do so,
   subject to the following conditions:
   
   The above copyright notice and this permission notice shall be
   included in all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
   LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
   OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
   WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*)

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
  (* binary prelude parametric operations: vundef vmake vzero vbinop trunc zext sext int_ptr vite *)
  twos_keys: string list;
  twos_table:  (string, (int * int) list) Hashtbl.t;
  (* ternary prelude parametric operations: vtrunc vzext vsext vint_ptr *)
  threes_keys: string list;
  threes_table:  (string, (int * int * int) list) Hashtbl.t;
  mutable undef: int;               (* counter for gensym-ing undefs                 *)
  mutable cast: bool;               (* do we need casts: vectors <-> bitvectors      *) 
  mutable vector_width: int list;   (* the bit widths of the beasts found in vectors *)
  mutable vector_length: int list;  (* the LOGARITHMS of the lengths of the vectors  *)
}

(* construct an empty prelude object *)
val make_prelude: int -> prelude

(* dump prelude out to standard error *)
val dump_prelude: prelude  -> unit

(* cast should go away once the vcast stuff is hooked in *)
val cast_add: prelude -> unit
    
(* add a undef requirement to a prelude object *)
val undef_add:  prelude -> (int * int) -> unit

(* fetch an undef index from the prelude object *)
val undef_fetch:  prelude -> int

(* add a vmake requirement to a prelude object *)
val vmake_add:  prelude -> (int * int) -> unit

(* add a vzero requirement to a prelude object *)
val vzero_add:  prelude -> (int * int) -> unit

(* add a vbinop requirement to a prelude object *)
val vbinop_add:  prelude -> (int * int) -> unit

(* add a trunc requirement to a prelude object *)
val trunc_add:  prelude -> (int * int) -> unit

(* add a vundef requirement to a prelude object *)
val vundef_add:  prelude -> (int * int * int) -> unit

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

(* add a vite requirement to a prelude object *)
val vite_add:  prelude -> (int * int) -> unit

(* add a vcast requirement to a prelude object *)
val vcast_add:  prelude -> (int * int) -> unit


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

    
