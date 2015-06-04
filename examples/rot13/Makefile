# LLVM = ${HOME}/LLVM/llvm-3.5-install/bin
LLVM = ${HOME}/LLVM-3.5.0/build/Debug+Asserts/bin

rot13:
	clang -S -emit-llvm rot13.c -o rot13.ll

clean:
	rm -f *.bc *.ll *.log  *.dot *.png
