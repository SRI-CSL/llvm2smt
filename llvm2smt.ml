(*
 * The current main. llexes the input, parses it into the
 * internal representation, and then processes the representation
 * according to the state module, then pretty prints the output to
 * standard out (errors go to standard error).
 *
 * Usage:
 *
 *  llvm-to-smt llvm_bitcode > smt-output
 *)

let ch, module_id =
  if Array.length Sys.argv > 1 then
    open_in Sys.argv.(1), Sys.argv.(1)
  else
    stdin, "<stdin>"
;;

(*
let cu = Lllex.parse ch in
  State.process_params cu;
  State.number_cu cu;
  State.assign_vartyps cu;
*)

let cu = Llvm_parser.parse ch in
  let b = (Buffer.create 100) in
    Smt.cu_to_smt b cu;
    Printf.printf "%s\n" (Buffer.contents b)
;;
