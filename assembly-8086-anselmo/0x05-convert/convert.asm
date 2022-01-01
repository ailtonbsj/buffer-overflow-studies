%include 'lib.inc'

section .data
    v1 dw '105', LF, NULL

section .text

global _start

_start:
    call convert_val
    call show_val

    ; finish program
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL

convert_val:
    lea esi, [v1]
    mov ecx, 0x03
    call string_to_int
    add eax, 0x02 ; 105 + 2 = 107
    ret

show_val:
    call int_to_string
    call saidaResultado
    ret

; string to int
; param:  esi <-- pointer to string
; param:  ecx <-- length
; return: eax <-- integer value
string_to_int:
    xor ebx, ebx ; set eax to 0
.next_str_dig:
    movzx eax, byte[esi]
    inc esi
    sub al, '0'
    imul ebx, 0xa
    add ebx, eax
    loop .next_str_dig ; Jump if ecx is not zero
    mov eax, ebx
    ret

; int to string
; param: eax <-- integer value
; return: buffer <--- string pointer
; return: tam_buf <-- length string 
int_to_string:
    lea esi, [buffer]
    add esi, TAM_BUFF-1
    mov byte[esi], LF
    mov ebx, 0x0a
.next_int_dig:
    xor edx, edx
    div ebx ; eax = eax // ebx , edx = eax % ebx
    add dl, '0'
    dec esi
    mov [esi], dl
    test eax, eax ; set ZF to 1 if eax == 0
    jnz .next_int_dig
    ret