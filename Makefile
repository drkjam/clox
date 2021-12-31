SHELL = /bin/bash
CC = gcc
CFLAGS = -g -Wall

.PHONY: default
default: all

.PHONY: clean
clean:
	rm -f *.o
	rm -f clox

memory.o: memory.c memory.h common.h
	$(CC) -c $(CFLAGS) memory.c

value.o: value.c value.h common.h memory.o
	$(CC) -c $(CFLAGS) value.c

chunk.o: chunk.c chunk.h common.h value.o memory.o
	$(CC) -c $(CFLAGS) chunk.c

scanner.o: scanner.c scanner.h common.h
	$(CC) -c $(CFLAGS) scanner.c

compiler.o: compiler.c compiler.h common.h scanner.o
	$(CC) -c $(CFLAGS) compiler.c

debug.o: debug.c debug.h chunk.o value.o
	$(CC) -c $(CFLAGS) debug.c

vm.o: vm.c vm.h common.h chunk.o value.o compiler.o debug.o
	$(CC) -c $(CFLAGS) vm.c

clox: memory.o value.o chunk.o scanner.o compiler.o debug.o vm.o common.h main.c
	$(CC) $(CFLAGS) memory.o value.o chunk.o scanner.o compiler.o debug.o vm.o main.c -o clox

.PHONY: all
all: clox
