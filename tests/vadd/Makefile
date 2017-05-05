LLVM = ${HOME}/LLVM/llvm-3.5-install/bin
#LLVM = ${HOME}/LLVM-3.5.0/build/Debug+Asserts/bin

all: vadd

vadd:
	${LLVM_HOME}/bin/lli vadd.ll 2 8	


2smt:
	../../src/llvm2smt vadd.ll > vadd_raw.smt

check:
	yices-smt2 vadd.smt
