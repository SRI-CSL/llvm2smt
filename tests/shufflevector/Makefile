
all: shufflevector 2smt check

shufflevector:
	${LLVM_HOME}/bin/lli shufflevector.ll 2 8	


2smt:
	../../src/llvm2smt shufflevector.ll > shufflevector_raw.smt

check:
#	yices-smt2 shufflevector.smt
	yices-smt2 shufflevector_raw.smt
