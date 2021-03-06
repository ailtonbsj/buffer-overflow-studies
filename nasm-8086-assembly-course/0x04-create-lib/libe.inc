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

    TAM_BUFF equ 0x0a

segment .bss
    buffer resb 0x0a

segment .text

saidaResultado:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, buffer
    mov edx, TAM_BUFF
    int SYS_CALL
    ret