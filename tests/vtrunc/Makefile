all: vtrunc 2smt check

vtrunc:
	${LLVM_HOME}/bin/lli vtrunc.ll 299 8	


2smt:
	../../src/llvm2smt vtrunc.ll > vtrunc_raw.smt

check:
#	yices-smt2 vtrunc.smt
	yices-smt2 vtrunc_raw.smt
