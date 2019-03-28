# whats-your-name-x86_64-linux-assembly
This is a simple program written in x86_64 assembly for linux. 
The program basically asks for your name, reads it in via scanf and prints it to screen via printf.
Since I'm currently learning assembly and want to escape the noobish level I'm on right now, feel free to create pull-request with optimization for the code.

# How to compile
nasm -f elf64 -o name.o name.asm

gcc -o name name.o

# Output
$ ./name

What is your name?

Moritz

Your name is: Moritz

$
