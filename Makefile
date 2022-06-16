CC=gcc

CFLAGS=-Wall

PROGS=Code2


Code2: Code2.o cube.a square.a
	$(CC) $^ -o $@

Code2.o: Code2.c cube.h square.h
	$(CC) -c $<

cube.a: cube.o
	ar cr $@ $^

square.a: square.o
	ar cr $@ $^
	
cube.o: cube.c
	$(CC) -fPIC -c $<

square.o: square.c
	$(CC) -fPIC -c $<

clean:
	rm -rf *.o *.a *.so $(PROGS)
