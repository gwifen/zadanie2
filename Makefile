CC=gcc

CFLAGS=-Wall

PROGS=Code2

.PHONY: clean

.SUFFIXES: .c .o .a

obj=cube.o square.o


%: %.o
	$(CC) -o $@ $^
	
%.o: %.c
	$(CC) -fPIC -c $<

Code2: Code2.o cube.a square.a
Code2.o: Code2.c cube.h square.h

cube.a: cube.o
	ar cr $@ $^

square.a: square.o
	ar cr $@ $^

$(obj): %.o: %.c
	$(CC) -fPIC -c $< -o $@

clean:
	rm -rf *.o *.a *.so $(PROGS)
