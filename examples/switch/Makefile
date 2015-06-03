# LLVM = ${HOME}/LLVM/llvm-3.5-install/bin
LLVM = ${HOME}/LLVM-3.5.0/build/Debug+Asserts/bin

switch:
	clang -S -emit-llvm switch.c -o switch.ll

clean:
	rm -f *.bc *.ll *.log  *.dot *.png
