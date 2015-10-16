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
 * LLVM datalayout
 *)

type alignment = {
  size : int;
  abi: int;
  pref: int;
}

type datalayout  = {
  (* E indicates big endian; e indicates little endian *)
  mutable big_endian: bool;
  (* prior to 3.0 these looked like  ssize:abi:pref ; from 3.0 they are of the form Ssize *)
  mutable stack: int option;
  (* n<size1>:<size2>:<size3> ... *)
  mutable native: int list;
  (* these look like char<size>:<abi>:<pref>  for char in { i, f, v } integers, floats, vectors *)
  mutable integers: alignment list;
  mutable floats: alignment list;
  mutable vectors: alignment list;
  (* we ignore multiple address spaces untill forced otherwise ;  we parse: p:<size>:<abi>:<pref> *)
  mutable pointer: alignment option;
  (* prior to 3.0 these looked like asize:abi:pref ; from 3.0 they are of the form a:<abi>:<pref> *)
  mutable aggregate: alignment option;
  (* char in {e, m, o, w} ;  e = elf, m = mips, o = mach-o, w = windows *)
  mutable mangling: char option;
}

(* some default *)
val zero_datalayout: datalayout

(* fill in data layout structure from an LLVM string *)
val dl_parse: string -> datalayout -> unit
