### Makefile for Alive.asm
# Linker
Alive.out: Alive.o
	gcc -o Alive.out Alive.o -no-pie
# Compiler
Alive.o: Alive.asm
	nasm -f elf64 -g -F dwarf Alive.asm -l Alive.lst