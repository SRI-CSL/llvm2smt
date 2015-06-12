all: structs structs2

structs:
	${CC} -Wall structs.c -o structs
	${CC} -Wall -fpack-struct  structs.c -o packed_structs	
	clang -S -emit-llvm structs.c -o structs.ll	
	clang -S -fpack-struct -emit-llvm structs.c -o packed_structs.ll	

structs2:
	${CC} -Wall structs2.c -o structs2
	${CC} -Wall -fpack-struct  structs2.c -o packed_structs2	
	clang -S -emit-llvm structs2.c -o structs2.ll	
	clang -S -fpack-struct -emit-llvm structs2.c -o packed_structs2.ll	




clean:
	rm structs packed_structs structs2 packed_structs2  *.ll

