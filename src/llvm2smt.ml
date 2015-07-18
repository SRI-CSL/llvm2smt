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
let b_cu = (Buffer.create 1024) in
let b_prelude = (Buffer.create 1024) in
let aw = Smt.get_addr_width cu in
let preqs = Prelude.make_prelude aw in
  Smt.cu_to_smt b_cu cu preqs;
  Prelude.print_prelude b_prelude preqs;
  Printf.printf "%s\n" (Buffer.contents b_prelude);
  Printf.printf "%s\n" (Buffer.contents b_cu)
  ; Prelude.dump_prelude preqs   (*  *)
;;
