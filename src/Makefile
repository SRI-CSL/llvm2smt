LIBS=nums.cmxa unix.cmxa str.cmxa

BITCODE=../bitcode

EXES=rawparse parse dltest llvm2smt

all: ${EXES}

llvm2smt:  util.cmx prelude.cmx llvm.cmx llvm_pp.cmx dl.cmx bc.cmx bc_manip.cmx util.cmx bc_pp.cmx  bc_manip.cmx smt.cmx llparse.cmx lllex.cmx smt.cmx llvm_parser.cmx llvm2smt.cmx
	ocamlopt $(LIBS) $^ -o $@

rawparse: util.cmx llvm.cmx llvm_pp.cmx dl.cmx bc.cmx bc_pp.cmx llparse.cmx lllex.cmx rawparse.cmx
	ocamlopt $(LIBS) $^ -o $@

parse: util.cmx llvm.cmx llvm_pp.cmx dl.cmx bc.cmx bc_pp.cmx bc_manip.cmx llparse.cmx lllex.cmx llvm_parser.cmx  parse.cmx
	ocamlopt $(LIBS) $^ -o $@


dltest: dl.cmx dltest.cmx
	ocamlopt $(LIBS) $^ -o $@

test:
	./llvm2smt ${BITCODE}/int_powers.ll > ${BITCODE}/int_powers.smt
	./llvm2smt ${BITCODE}/structs.ll > ${BITCODE}/structs.smt
	./llvm2smt ${BITCODE}/structs.i386.ll > ${BITCODE}/structs.i386.smt

bug:
	./parse ${BITCODE}/int_powers.ll > ${BITCODE}/int_powers.out.ll
	diff -w ${BITCODE}/int_powers.ll  ${BITCODE}/int_powers.out.ll

translate:
	./parse ${BITCODE}/https_examples.darwin.ll > ${BITCODE}/https_examples.darwin.out.ll
	diff -w -I ModuleID ${BITCODE}/https_examples.darwin.ll ${BITCODE}/https_examples.darwin.out.ll


clean:
	$(RM) *~ *.cmx *.cmi *.cmo *.o llparse.ml llparse.mli llparse.mli lllex.ml ${EXES}

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


