.globl _start
.text

.macro exit, code
    mov $60, %rax
    mov \code, %rdi
    syscall
.endm

_start:
    .incbin "shellcode.bin"
    exit $0
