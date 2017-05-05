all: hello copy

hello:
	${LLVM_HOME}/bin/clang -S -emit-llvm hello.c -o hello.ll

copy:
	cp *.ll ../../bitcode

clean:
	rm -f *.bc *.ll *.log  *.dot *.png
