# Course of GNU Assembly

## Some commands

```bash
# Install assembler, linker and utils
sudo apt install binutils

# Compile a assembly code with as
as -o hello64.o hello64.s

# Display information from object files
objdump -d hello64.o
objdump -dM intel hello64.o

# Linked object file to create a executable
ld -s -o hello64 hello64.o

# Run the makefile
make

# Install assembler, linked and utils for ARM64
sudo apt install binutils-aarch64-linux-gnu

# Show all syscalls execve called by gcc and children processes
strace -fe execve gcc -o hello hello.s

# Generate assembly code from C file
gcc -o asm.s -S hello.c

# Show info about ELF
readelf -S a.out
readelf -h a.out
```

## References

- [Assembly na Prática by Fernando Anselmo](https://www.youtube.com/playlist?list=PLxTkH01AauxRm0LFLlOA9RR5O6hBLqBtC)

- [manpages by Papo Binário](https://www.youtube.com/playlist?list=PLIfZMtpPYFP6ODjFqtpeC1r1LdxsHh25t)