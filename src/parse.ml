(*
 * The current main. llexes the input, parses it into the
 * internal representation, and then processes the representation
 * according to the state module, then pretty prints the output to
 * standard out (errors go to standard error).
 *
 * Usage:
 *
 *  parse llvm_bitcode > llvm_bitcode.out
 *
 *)
  

let ch, module_id =
  if Array.length Sys.argv > 1 then
    open_in Sys.argv.(1), Sys.argv.(1)
  else
    stdin, "<stdin>"
;;

let cu = Llvm_parser.parse ch in
  Printf.printf "; ModuleID = '%s'\n%s" module_id (Util.spr Bc_pp.bpr_cu cu);;
  
