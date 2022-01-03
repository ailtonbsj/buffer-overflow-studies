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
    x dd 5 ; dd means 'define double (4 bytes)'
    y dd 10
    msg1 db 'X maior que Y', LF, CR ; db means 'define byte'
    tam1 equ $ - msg1
    msg2 db 'Y maior que X', LF, CR
    tam2 equ $ - msg2
    ; dw means 'define word (2 bytes)'

section .text

global _start

_start:
    mov eax, dword[x]
    mov ebx, dword[y]
    cmp eax, ebx ; compare two bytes
    jge maior ; jump if greater than or equal
    mov ecx, msg2
    mov edx, tam2
    jmp saida
maior:
    mov ecx, msg1
    mov edx, tam1
saida:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    int SYS_CALL

    ; finish program
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL