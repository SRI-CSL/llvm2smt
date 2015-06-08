# LLVM = ${HOME}/LLVM/llvm-3.5-install/bin
LLVM = ${HOME}/LLVM-3.5.0/build/Debug+Asserts/bin

int2ptr:
	clang -S -emit-llvm int2ptr.c -o int2ptr.ll

clean:
	rm -f *.bc *.ll *.log  *.dot *.png
