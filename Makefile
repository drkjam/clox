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

chunk.o: chunk.c chunk.h common.h memory.o
	$(CC) -c $(CFLAGS) chunk.c

clox: memory.o chunk.o common.h main.c
	$(CC) $(CFLAGS) memory.o chunk.o main.c -o clox

.PHONY: all
all: clox
