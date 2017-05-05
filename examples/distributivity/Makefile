
all: distrib copy

distrib:
	${LLVM_HOME}/bin/clang -S -emit-llvm distrib.c	

copy:
	cp *.ll ../../bitcode


clean:
	rm -f distrib.ll
