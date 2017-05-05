
all: switch copy

switch:
	${LLVM_HOME}/bin/clang -S -emit-llvm switch.c -o switch.ll


copy:
	cp *.ll ../../bitcode


clean:
	rm -f *.bc *.ll *.log  *.dot *.png
