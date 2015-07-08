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

let cu = Llvm_parser.parse ch in
let b_cu = (Buffer.create 100) in
let b_prelude = (Buffer.create 100) in
let aw = Smt.get_addr_width cu in 
  Smt.cu_to_smt b_cu cu aw;
  Prelude.print_prelude b_prelude aw;
  Printf.printf "%s\n" (Buffer.contents b_prelude);
  Printf.printf "%s\n" (Buffer.contents b_cu)
;;
