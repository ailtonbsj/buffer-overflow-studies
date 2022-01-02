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

segment .text

; Read data from stdin
; Params: ecx <-- pointer to buffer
; Return: edx <-- length of buffer
scan:
    mov eax, SYS_READ
    mov ebx, STD_IN
    int SYS_CALL
    ret

; Print string to stdout
; Params: ecx <-- pointer to string
print:
    call strlen
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    int SYS_CALL
    ret

; Get length of string
; Params: ecx <-- pointer to string
; Return: edx <-- length of string
strlen:
    mov edx, ecx
.nextChar:
    cmp byte[edx], NULL
    jz .finished
    inc edx
    jmp .nextChar
.finished:
    sub edx, ecx
    ret

; Exit with success
exit:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL