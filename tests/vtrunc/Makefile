all: vtrunc

vtrunc:
	${LLVM_HOME}/bin/lli vtrunc.ll 299 8	


2smt:
	../../src/llvm2smt vtrunc.ll > vtrunc_raw.smt

check:
	yices-smt2 vtrunc.smt
