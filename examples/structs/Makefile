all:
	${CC} -Wall structs.c -o structs
	${CC} -Wall -fpack-struct  structs.c -o packed_structs	

	clang -S -emit-llvm structs.c -o structs.ll	
	clang -S -fpack-struct -emit-llvm structs.c -o packed_structs.ll	


clean:
	rm structs
