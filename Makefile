CC=gcc

CFLAGS=-Wall

PROGS=Code2


Code2: Code2.o cube.a square.a
	$(CC) Code2.o cube.a square.a -o Code2

Code2.o: Code2.c cube.h square.h
	$(CC) -c Code2.c

cube.a: cube.o
	ar cr cube.a cube.o

square.a: square.o
	ar cr square.a square.o
	
cube.o: cube.c
	$(CC) -fPIC -c cube.c

square.o: square.c
	$(CC) -fPIC -c square.c

clean:
	rm -rf *.o *.a *.so $(PROGS)
