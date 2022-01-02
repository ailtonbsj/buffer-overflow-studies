%include 'lib.inc'

section .data
    tempConst db 'TEMPLATE!',LF,NULL

section .bss
    tempVar resb 1

section .text

global _start

_start:
    mov ecx, tempConst
    call print
    
    jmp exit