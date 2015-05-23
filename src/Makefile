SHELL=/bin/sh

LIBS=nums.cmxa unix.cmxa str.cmxa
#/Users/iam/.opam/system/lib/ocamlgraph/graph.cmxa

BITCODE=../bitcode

EXES=rawparse parse dltest llvm2smt

CORE=util.cmx llvm.cmx llvm_pp.cmx dl.cmx bc.cmx bc_manip.cmx bc_pp.cmx llparse.cmx lllex.cmx

TESTS=https_examples.darwin http_examples.i386 yices_main minigzip-3.5 minisat.darwin

all: ${EXES}

llvm2smt: ${CORE} llvm_parser.cmx prelude.cmx cycles.cmx johnson.cmx smt.cmx llvm2smt.cmx
	ocamlfind ocamlopt $(LIBS) $^ -linkpkg -package ocamlgraph  -package extlib -o $@

rawparse: ${CORE} rawparse.cmx
	ocamlopt $(LIBS) $^ -o $@

parse: ${CORE} llvm_parser.cmx  parse.cmx
	ocamlopt $(LIBS) $^ -o $@


dltest: dl.cmx dltest.cmx
	ocamlopt $(LIBS) $^ -o $@

test: llvm2smt
	./llvm2smt ${BITCODE}/int_powers.ll > ${BITCODE}/int_powers.smt
	./llvm2smt ${BITCODE}/structs.ll > ${BITCODE}/structs.smt
	./llvm2smt ${BITCODE}/structs.i386.ll > ${BITCODE}/structs.i386.smt

bug: parse
	./parse ${BITCODE}/int_powers.ll > ${BITCODE}/int_powers.out.ll
	diff -w ${BITCODE}/int_powers.ll  ${BITCODE}/int_powers.out.ll

translate: parse
	./parse ${BITCODE}/https_examples.darwin.ll > ${BITCODE}/https_examples.darwin.out.ll
	diff -w -I ModuleID ${BITCODE}/https_examples.darwin.ll ${BITCODE}/https_examples.darwin.out.ll

stress: parse
	for sourcebits in ${TESTS} ; do \
	    ./parse ${BITCODE}/$${sourcebits}.ll > ${BITCODE}/$${sourcebits}.out.ll ; \
            diff -w -I ModuleID ${BITCODE}/$${sourcebits}.ll ${BITCODE}/$${sourcebits}.out.ll ; \
	    echo "Success for $${sourcebits}\n"; \
        done

smt:  llvm2smt
	./llvm2smt ${BITCODE}/sums_auto3.ll > ${BITCODE}/sums_auto3.smt

clean:
	$(RM) *~ *.cmx *.cmi *.cmo *.o llparse.ml llparse.mli llparse.mli lllex.ml ${EXES}


johnson.cmx: johnson.ml
	ocamlfind ocamlopt -c  johnson.ml -package ocamlgraph -package extlib  -o johnson.cmx

cycles.cmi: cycles.mli
	ocamlfind  ocamlc -c cycles.mli -linkpkg -package ocamlgraph

cycles.cmx: cycles.ml
	ocamlfind ocamlopt -c cycles.ml -o cycles.cmx -linkpkg -package ocamlgraph $@

%.cmi: %.mli
	ocamlc -c $<

%.cmx: %.ml
	ocamlfind ocamlopt -c $< -o $@

%.ml: %.mll
	ocamllex $< -o $@

%.ml: %.mly
	ocamlyacc $<

%.mli: %.mly
	ocamlyacc $<

include .depend
.depend: lllex.ml llparse.ml llparse.mli
	ocamldep -native *.ml *.mli > $@


