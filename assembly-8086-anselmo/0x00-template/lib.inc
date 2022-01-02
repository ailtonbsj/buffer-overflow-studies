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

segment .bss
    buffer resb 255

segment .text

; String to integer
; param:  esi <-- pointer to string
; return: eax <-- integer value
atoi:
    ; get length to string
    mov ecx, esi
    call strlen
    mov ecx, edx
    dec ecx
    xor ebx, ebx ; set ebx to 0
.next_str_dig:
    movzx eax, byte[esi]
    inc esi
    sub al, '0'
    imul ebx, 0x0a
    add ebx, eax
    loop .next_str_dig ; Jump if ecx is not zero
    mov eax, ebx
    ret

; Integer to string
; Param: eax <-- integer value
; return: buffer <--- string pointer
itoa:
    lea esi, [buffer]
    mov [esi], eax ; store param save in esi
    mov ebx, 0x0a
    mov ecx, 0
.length_loop: ; loop for find length to int
    xor edx, edx
    div ebx
    inc ecx
    test eax, eax
    jnz .length_loop
    ; ecx now has length of int 
    mov eax, [esi] ; restore param from esi
    add esi, ecx ; offset buffer to convert
    mov byte[esi], NULL
    mov ebx, 0x0a
.next_int_dig:
    xor edx, edx ; edx need to be 0 for div work
    div ebx ; eax = eax // ebx , edx = eax % ebx
    add dl, '0'
    dec esi
    mov [esi], dl
    test eax, eax ; set ZF to 1 if eax == 0
    jnz .next_int_dig
    ret

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