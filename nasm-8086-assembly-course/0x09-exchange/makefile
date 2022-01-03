NAME = exchange

all: $(NAME).cpp $(NAME).o
	g++ $(NAME).o $(NAME).cpp -o $(NAME)
	rm -rf *.o

%.o: %.asm
	nasm -f elf64 $<