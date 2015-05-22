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
