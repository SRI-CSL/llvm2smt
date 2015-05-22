(*
 * Pretty printing of LLVM compilation units
 *)

(*
 * All these print to a buffer
 *)
val bpr_cu: Buffer.t -> Bc.cunit -> unit


(*
 * These functions produce a string
 *)
val string_of_fparams: Bc.function_parameters -> string
