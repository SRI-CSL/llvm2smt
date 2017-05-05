all: harness 

harness:
	${LLVM_HOME}/bin/clang -S -emit-llvm harness.c -o harness.ll

check:
	${LLVM_HOME}/bin/lli harness.ll 2 8	

clean:
	rm -f *.bc *.ll *.log  *.dot *.png
