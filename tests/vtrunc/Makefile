LLVM = ${HOME}/LLVM/llvm-3.5-install/bin
#LLVM = ${HOME}/LLVM-3.5.0/build/Debug+Asserts/bin

all: vtrunc

vtrunc:
	${LLVM}/lli vtrunc.ll 299 8	


2smt:
	../../src/llvm2smt vtrunc.ll > vtrunc_raw.smt

check:
	yices-smt2 vtrunc.smt
