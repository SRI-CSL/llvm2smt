
all: rot13 copy

rot13:
	${LLVM_HOME}/bin/clang -S -emit-llvm rot13.c -o rot13.ll

copy:
	cp *.ll ../../bitcode


clean:
	rm -f *.bc *.ll *.log  *.dot *.png
