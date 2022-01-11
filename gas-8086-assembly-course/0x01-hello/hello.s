# Show text Hello World on Terminal
# as -o hello.o hello.s
# ld -o hello hello.o

.section .data
    msg: .string "Hello World!\n"
    len: .long .-msg

.section .bss

.section .text

.global _start

_start:
    # send data to standard output
    mov $4, %rax # Write data code
    mov $1, %rbx # On standard output
    lea msg, %rcx
    mov len, %rdx
    int $0x80 # call OS interrupt vector

    # Finish program correctly
    mov $1, %rax # had to finish program
    mov $0, %rbx # return value 0
    int $0x80 # call OS interrupt vector
    

    