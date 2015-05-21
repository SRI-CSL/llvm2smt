LIBS=nums.cmxa unix.cmxa str.cmxa

all: rawparse parse dltest

llvm2smt:  smt.cmx prelude.cmx dl.cmx bc.cmx bc_manip.cmx util.cmx bc_pp.cmx state.cmx smt_aux.cmx llparse.cmx lllex.cmx map2smt.cmx llvm_parser.cmx llvm2smt.cmx
	ocamlopt $(LIBS) $^ -o $@

rawparse: util.cmx llvm.cmx llvm_pp.cmx dl.cmx bc.cmx bc_pp.cmx llparse.cmx lllex.cmx rawparse.cmx
	ocamlopt $(LIBS) $^ -o $@

parse: util.cmx llvm.cmx llvm_pp.cmx dl.cmx bc.cmx bc_pp.cmx bc_manip.cmx llparse.cmx lllex.cmx llvm_parser.cmx  parse.cmx
	ocamlopt $(LIBS) $^ -o $@


dltest: dl.cmx dltest.cmx
	ocamlopt $(LIBS) $^ -o $@

test:
	./llvm2smt tests/int_powers.ll > tests/int_powers.smt
	./llvm2smt tests/structs.ll > tests/structs.smt
	./llvm2smt tests/structs.i386.ll > tests/structs.i386.smt

bug:
	./parse tests/int_powers.ll > tests/int_powers.out.ll
	diff -w tests/int_powers.ll  tests/int_powers.out.ll

translate:
	./parse ../llvmparser/tests/https_examples.darwin.ll > ../llvmparser/tests/https_examples.darwin.out.ll
	diff -w ../llvmparser/tests/https_examples.darwin.ll ../llvmparser/tests/https_examples.darwin.out.ll

variant:
	./llvm2smt variants/int_powers00.ll > variants/int_powers00.smt
	./llvm2smt variants/int_powers01.ll > variants/int_powers01.smt


clean:
	$(RM) *~ *.cmx *.cmi *.cmo *.o llparse.ml llparse.mli llparse.mli lllex.ml rawparse llvm2smt dltest

%.cmi: %.mli
	ocamlc -c $<

%.cmx: %.ml
	ocamlopt -c $< -o $@

%.ml: %.mll
	ocamllex $< -o $@

%.ml: %.mly
	ocamlyacc $<

%.mli: %.mly
	ocamlyacc $<

include .depend
.depend: lllex.ml llparse.ml llparse.mli
	ocamldep -native *.ml *.mli > $@


