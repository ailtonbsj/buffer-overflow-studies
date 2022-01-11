.globl _start
.text

.macro exit, code
    mov $60, %rax
    xor \code, %rdi
    syscall
.endm

_start:
    exit $1
