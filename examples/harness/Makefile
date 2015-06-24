LLVM = ${HOME}/LLVM/llvm-3.5-install/bin
#LLVM = ${HOME}/LLVM-3.5.0/build/Debug+Asserts/bin

all: harness 

harness:
	clang -S -emit-llvm harness.c -o harness.ll

check:
	${LLVM}/lli harness.ll 2 8	

clean:
	rm -f *.bc *.ll *.log  *.dot *.png
