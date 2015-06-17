LLVM = ${HOME}/LLVM/llvm-3.5-install/bin
# LLVM = ${HOME}/LLVM-3.5.0/build/Debug+Asserts/bin

all: exponentiation unfold3 copy

exponentiation:
	clang -S -emit-llvm exponentiation.c -o exponentiation.ll

copy:
	cp *.ll ../../bitcode

unfold3:
	${LLVM}/opt -debug -loop-rotate  -loop-unroll -unroll-count=3 exponentiation.ll  -o exponentiation_auto3.bc 2> exponentiation_auto3.log
	${LLVM}/llvm-dis exponentiation_auto3.bc

clean:
	rm -f *.bc *.ll *.log  *.dot *.png
