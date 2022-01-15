# nasm assembly.asm -f elf64
# gcc -c main.c -o main.o
# gcc assembly.o main.o -o test -no-pie
# ./test

all:
	nasm *.asm -felf64
	gcc -c *.c
	gcc -no-pie *.o -o test
	rm -rf *.o
