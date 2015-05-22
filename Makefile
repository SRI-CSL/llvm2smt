LIBS=nums.cmxa unix.cmxa str.cmxa

TESTDIR=../llvmparser/tests

all: rawparse parse dltest llvm2smt

llvm2smt:  util.cmx prelude.cmx llvm.cmx llvm_pp.cmx dl.cmx bc.cmx bc_manip.cmx util.cmx bc_pp.cmx  bc_manip.cmx smt.cmx llparse.cmx lllex.cmx smt.cmx llvm_parser.cmx llvm2smt.cmx
	ocamlopt $(LIBS) $^ -o $@

rawparse: util.cmx llvm.cmx llvm_pp.cmx dl.cmx bc.cmx bc_pp.cmx llparse.cmx lllex.cmx rawparse.cmx
	ocamlopt $(LIBS) $^ -o $@

parse: util.cmx llvm.cmx llvm_pp.cmx dl.cmx bc.cmx bc_pp.cmx bc_manip.cmx llparse.cmx lllex.cmx llvm_parser.cmx  parse.cmx
	ocamlopt $(LIBS) $^ -o $@


dltest: dl.cmx dltest.cmx
	ocamlopt $(LIBS) $^ -o $@

test:
	./llvm2smt ${TESTDIR}/int_powers.ll > ${TESTDIR}/int_powers.smt
	./llvm2smt ${TESTDIR}/structs.ll > ${TESTDIR}/structs.smt
	./llvm2smt ${TESTDIR}/structs.i386.ll > ${TESTDIR}/structs.i386.smt

bug:
	./parse ${TESTDIR}/int_powers.ll > ${TESTDIR}/int_powers.out.ll
	diff -w ${TESTDIR}/int_powers.ll  ${TESTDIR}/int_powers.out.ll

translate:
	./parse ${TESTDIR}/https_examples.darwin.ll > ${TESTDIR}/https_examples.darwin.out.ll
	diff -w ${TESTDIR}/https_examples.darwin.ll ${TESTDIR}/https_examples.darwin.out.ll


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


