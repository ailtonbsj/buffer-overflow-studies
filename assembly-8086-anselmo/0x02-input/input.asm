segment .data
    LF        equ 0x0a ; Line feed
    CR        equ 0x0d ; Carriage return
    NULL      equ 0x00 ; NULL \0 character
    SYS_CALL  equ 0x80 ; OS interrupt vector
    
    ; On EAX
    SYS_EXIT  equ 0x01 ; Finish program code
    SYS_READ  equ 0x03 ; Read data code
    SYS_WRITE equ 0x04 ; Write data code

    ; On EBX
    RET_EXIT  equ 0x00 ; Finished without error
    STD_IN    equ 0x00 ; Standard input code
    STD_OUT   equ 0x01 ; Standard output code
    
section .data
    msg db "Entre com seu nome:", LF, CR
    tam equ $- msg

section .bss
    nome resb 1

section .text

global _start

_start:
    ; print text to stdout
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tam
    int SYS_CALL

    ; get text from stdin
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, nome
    mov edx, 0x0a ; length of input stream
    int SYS_CALL

    ; echo input to stdout
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, nome
    mov edx, 0x0a
    int SYS_CALL

    ; finish program
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL