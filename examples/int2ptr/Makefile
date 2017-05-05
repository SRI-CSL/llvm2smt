
all: int2ptr copy

int2ptr:
	${LLVM_HOME}/bin/clang -S -emit-llvm int2ptr.c -o int2ptr.ll

copy:
	cp *.ll ../../bitcode


clean:
	rm -f *.bc *.ll *.log  *.dot *.png
