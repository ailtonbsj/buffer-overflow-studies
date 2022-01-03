%include 'lib.inc'

section .data
    array dd 1, 2, 3, 4, 5

section .text

global _start

_start:
    mov eax, [array + 4 * 0]
    call itoa
    mov ecx, buffer
    call print

    mov eax, ' '
    call putchar

    mov eax, [array + 4 * 4]
    call itoa
    mov ecx, buffer
    call print

    mov eax, LF
    call putchar
    
    jmp exit