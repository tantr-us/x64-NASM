# Makefile for HelloWorld.asm
HelloWorld.out: HelloWorld.o
	gcc -o HelloWorld.out HelloWorld.o -no-pie
HelloWorld.o: HelloWorld.asm
	nasm -f elf64 -g -F dwarf HelloWorld.asm -l HelloWorld.lst
# -f elf64 	- Specifies the output format as ELF64 (Executable and Linkable Format for 64-bit systems).
# -g 		- Generate debug information in the output file.
# -F dwarf 	- Specifies the format of the debugging information as DWARF
# -l HelloWorld.lst  - generates a listing file. The listing file contains a detailed breakdown of the assembly process, 
#		showing the source code alongside the corresponding machine code and addresses.