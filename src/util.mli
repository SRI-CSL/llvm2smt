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

val between: string ->  (Buffer.t -> 'a -> unit) -> Buffer.t -> 'a list -> unit

val before: string ->  (Buffer.t -> 'a -> unit) -> Buffer.t -> 'a list -> unit

val after: string ->  (Buffer.t -> 'a -> unit) -> Buffer.t -> 'a list -> unit

val opt: (Buffer.t -> 'a -> unit) -> Buffer.t -> 'a option -> unit

val opt_before: string -> (Buffer.t -> 'a -> unit) -> Buffer.t -> 'a option -> unit

val opt_after: string -> (Buffer.t -> 'a -> unit) -> Buffer.t -> 'a option -> unit

val yes:  string -> Buffer.t -> bool -> unit

val yes:  string -> Buffer.t -> bool -> unit

val yesno:  string -> string -> Buffer.t -> bool -> unit
    
(*
 * String printer
 *)
val spr: (Buffer.t -> 'a -> unit) -> 'a -> string

(*
 * Prints a message if Util.debug is true/fails with an exception otherwise.
 *)
val nfailwith: string -> unit

(*
 * Compute the smallest k such that 2^k >= n
 * - n must be positive
 *)
val log2ceil: int -> int
