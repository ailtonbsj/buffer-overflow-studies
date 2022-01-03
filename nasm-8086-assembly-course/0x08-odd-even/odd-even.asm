%include 'lib.inc'

section .data
    msg db 'Digite um número: ',NULL
    _even db 'O número é par!', LF, NULL
    _odd db 'O número é ímpar!', LF, NULL

section .bss
    num resb 10

section .text

global _start

_start:
    
    mov ecx, msg
    call print
    mov ecx, num
    mov edx, 10
    call scan
    lea esi, [num]
    call atoi
    mov ebx, 2
    mov edx, 0
    div ebx
    test edx, edx
    jz even
    mov ecx, _odd
    call print
    jmp exit    
even:
    mov ecx, _even
    call print
    jmp exit
