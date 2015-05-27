SHELL=/bin/sh

LIBS=nums.cmxa unix.cmxa str.cmxa

BITCODE=../bitcode

EXES=rawparse parse dltest llvm2smt

CORE=util.cmx llvm.cmx llvm_pp.cmx dl.cmx bc.cmx bc_manip.cmx bc_pp.cmx llparse.cmx lllex.cmx

TESTS=https_examples.darwin http_examples.i386 yices_main minigzip-3.5 minisat.darwin

PKGS= -package ocamlgraph -package extlib

all: ${EXES}

llvm2smt: ${CORE} llvm_parser.cmx prelude.cmx cycles.cmx smt.cmx llvm2smt.cmx
	ocamlfind ocamlopt $(LIBS) $^ -linkpkg ${PKGS} -o $@

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

primes:  llvm2smt
	./llvm2smt ${BITCODE}/primes_opt_auto2.ll > ${BITCODE}/primes_opt_auto2.smt
#	./llvm2smt ${BITCODE}/primes_opt_auto3.ll > ${BITCODE}/primes_opt_auto3.smt
#	./llvm2smt ${BITCODE}/primes_opt_auto4.ll > ${BITCODE}/primes_opt_auto4.smt

clean:
	$(RM) *~ *.cmx *.cmi *.cmo *.o llparse.ml llparse.mli llparse.mli lllex.ml ${EXES}

%.cmi: %.mli
	ocamlfind ocamlc -c $< ${PKGS}

%.cmx: %.ml
	ocamlfind ocamlopt -c $< -o $@ ${PKGS}

%.ml: %.mll
	ocamllex $< -o $@

%.ml: %.mly
	ocamlyacc $<

%.mli: %.mly
	ocamlyacc $<

include .depend
.depend: lllex.ml llparse.ml llparse.mli
	ocamldep -native *.ml *.mli > $@


