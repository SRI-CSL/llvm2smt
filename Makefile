SRC=./src


all: src 

src: clean
	make -C ${SRC}

clean:
	make -C ${SRC} clean


check: 
	make -C ${SRC} stress

