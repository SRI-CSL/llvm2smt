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
 * Pretty printing of LLVM bitcode AST
 *)

(*
 * All these print to a buffer
 *)

val bpr_var: Buffer.t -> Llvm.var -> unit

val bpr_value: Buffer.t -> Llvm.value -> unit

val bpr_typ: Buffer.t -> Llvm.typ -> unit

val bpr_typ_value: Buffer.t -> (Llvm.typ * Llvm.value) -> unit

val bpr_typ_value_list: Buffer.t -> (Llvm.typ * Llvm.value) list -> unit

val bpr_instr: Buffer.t -> Llvm.var option * Llvm.instr -> unit

val bpr_formal: Buffer.t -> Llvm.typ * Llvm.param_attribute list * Llvm.var option -> unit

val bpr_callingconv: Buffer.t -> Llvm.callingconv -> unit

val bpr_attribute: Buffer.t -> Llvm.attribute -> unit    

val bpr_mdnodevector: Buffer.t -> (Llvm.typ * Llvm.value) option list -> unit

val bpr_attrgrp: Buffer.t -> int * Llvm.return_attribute list -> unit

(*
 * These functions produce a string
 *)
val string_of_var: Llvm.var -> string

val string_of_typ: Llvm.typ -> string

val string_of_typs: Llvm.typ list -> string

val string_of_value: Llvm.value -> string

val string_of_rhs: Llvm.instr -> string

val string_of_instr: (Llvm.var option *  Llvm.instr) -> string

