all:	name.o name

name.o:	name.asm
	nasm -f elf64 name.asm

name:	name.o
	gcc -o name name.o
