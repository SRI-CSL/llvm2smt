LLVM = ${HOME}/LLVM/llvm-3.5-install/bin
#LLVM = ${HOME}/LLVM-3.5.0/build/Debug+Asserts/bin

all: shufflevector

shufflevector:
	${LLVM}/lli shufflevector.ll 2 8	


2smt:
	../../src/llvm2smt shufflevector.ll > shufflevector_raw.smt

check:
	yices-smt2 shufflevector.smt
