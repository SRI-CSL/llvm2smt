(*
 *
 * Usage:
 *
 *  rawparse llvm_bitcode > llvm_bitcode.out
 *
 * no post processing of the parse AST.
 *)
  

let ch, module_id =
  if Array.length Sys.argv > 1 then
    open_in Sys.argv.(1), Sys.argv.(1)
  else
    stdin, "<stdin>"
;;

let cu = Lllex.parse ch in
  Printf.printf "; ModuleID = '%s'\n%s" module_id (Util.spr Bc_pp.bpr_cu cu);;
