SHELL = /bin/bash
CC = gcc
CFLAGS = -g -Wall

.PHONY: default
default: all

.PHONY: clean
clean:
	rm -f *.o
	rm -f clox
	rm -rf clox.dSYM/

memory.o: memory.c memory.h
	$(CC) -c $(CFLAGS) memory.c

value.o: value.c value.h
	$(CC) -c $(CFLAGS) value.c

chunk.o: chunk.c chunk.h
	$(CC) -c $(CFLAGS) chunk.c

scanner.o: scanner.c scanner.h
	$(CC) -c $(CFLAGS) scanner.c

compiler.o: compiler.c compiler.h
	$(CC) -c $(CFLAGS) compiler.c

debug.o: debug.c debug.h
	$(CC) -c $(CFLAGS) debug.c

object.o: object.c object.h
	$(CC) -c $(CFLAGS) object.c

table.o: table.c table.h
	$(CC) -c $(CFLAGS) table.c

vm.o: vm.c vm.h
	$(CC) -c $(CFLAGS) vm.c

clox: memory.o value.o chunk.o scanner.o compiler.o debug.o object.o table.o vm.o common.h main.c
	$(CC) $(CFLAGS) memory.o value.o chunk.o scanner.o compiler.o debug.o object.o table.o vm.o main.c -o clox

.PHONY: all
all: clox
