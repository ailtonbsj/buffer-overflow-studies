section .data
    msg db 'Hello World!', 0xa
    tam equ $- msg ; Count length of bytes in msg

section .text

global _start

_start:
    ; send data to standard output
    mov eax, 0x4 ; Write data code
    mov ebx, 0x1 ; On standard output
    mov ecx, msg
    mov edx, tam
    int 0x80 ; call OS interrupt vector

    ; Finish program correctly
    mov eax, 0x1 ; had to finish program
    mov ebx, 0x0 ; return value 0
    int 0x80 ; call OS interrupt vector