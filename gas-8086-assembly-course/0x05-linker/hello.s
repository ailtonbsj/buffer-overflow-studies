.global _start

.text

_start:
    mov $1, %rax
    mov $1, %rdi
    mov $msg, %rsi
    mov $18, %rdx
    syscall

    mov $60, %rax
    mov %rdi, %rdi
    syscall

.data
    msg:
    .ascii "Hello\n"
