NAME = template

all: $(NAME).o
	ld -m elf_x86_64 -o $(NAME) $(NAME).o
	rm -rf *.o

%.o: %.asm
	nasm -f elf64 $<
