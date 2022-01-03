%include 'libe.inc'

section .text

global _start

_start:
    ; LEA = Load Effective Address
    lea esi, [buffer] ; pointer to begin do buffer
    add esi, 0x09 ; move pointer to end of buffer
    mov byte[esi], LF ; add \n to buffer
    dec esi ; decrement index o buffer

    ; Convert 2 do '2' (int to string)
    mov dl, 0x02
    add dl, '0'
    mov [esi], dl

    call saidaResultado ; print data

    ; finish program
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL