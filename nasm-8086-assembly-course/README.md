# Course of NASM Assembly

## Some commands

```bash
# Install NASM
sudo apt install nasm

# Compile a assembly code with nasm
nasm -f elf64 hello.asm

# Linked object file to create a executable
ld -s -o hello hello.o

# Run the makefile
make
```

## References

- [Assembly na Prática by Fernando Anselmo](https://www.youtube.com/playlist?list=PLxTkH01AauxRm0LFLlOA9RR5O6hBLqBtC)