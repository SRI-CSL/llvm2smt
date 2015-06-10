all:
	${CC} -Wall structs.c -o structs
	clang -S -emit-llvm structs.c -o structs.ll	

clean:
	rm structs
