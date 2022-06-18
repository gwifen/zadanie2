CC=gcc

CFLAGS=-Wall

PROGS=Code2

.PHONY: clean

.SUFFIXES: .c .o .a

obj=cube.o square.o

vpath %.c src
vpath %.h include
vpath %.a lib

%: %.o
	$(CC) -o $@ $^ -Wl,-rpath,.
	mv $@ /usr/bin
	
%.o: %.c
	$(CC) -fPIC -c $<

Code2: Code2.o cube.a square.a
Code2.o: Code2.c cube.h square.h

cube.a: cube.o
	ar cr $@ $^
	mv $@ /usr/lib
	
square.a: square.o
	ar cr $@ $^
	mv $@ /usr/lib
	
$(obj): %.o: %.c
	$(CC) -fPIC -c $< -o $@

clean:
	rm -rf *.o /usr/lib/*.a /usr/lib/*.so /usr/bin/$(PROGS)
