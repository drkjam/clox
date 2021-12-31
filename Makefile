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

debug.o: debug.c debug.h
	$(CC) -c $(CFLAGS) debug.c

vm.o: vm.c vm.h chunk.o common.h debug.h
	$(CC) -c $(CFLAGS) vm.c

clox: memory.o chunk.o value.o vm.o debug.o common.h main.c
	$(CC) $(CFLAGS) memory.o chunk.o value.o vm.o debug.o main.c -o clox

.PHONY: all
all: clox
