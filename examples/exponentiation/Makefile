all: exponentiation unfold3 copy

exponentiation:
	${LLVM_HOME}/bin/clang -S -emit-llvm exponentiation.c -o exponentiation.ll

copy:
	cp *.ll ../../bitcode

check:
	${LLVM_HOME}/bin/lli exponentiation.ll 2 8	

unfold3:
	${LLVM_HOME}/bin/opt -debug -loop-rotate  -loop-unroll -unroll-count=3 exponentiation.ll  -o exponentiation_auto3.bc 2> exponentiation_auto3.log
	${LLVM_HOME}/bin/llvm-dis exponentiation_auto3.bc

clean:
	rm -f *.bc *.ll *.log  *.dot *.png
