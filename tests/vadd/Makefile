all: vadd 2smt check

vadd:
	${LLVM_HOME}/bin/lli vadd.ll 2 8	


2smt:
	../../src/llvm2smt vadd.ll > vadd_raw.smt

check:
#	yices-smt2 vadd.smt
	yices-smt2 vadd_raw.smt
