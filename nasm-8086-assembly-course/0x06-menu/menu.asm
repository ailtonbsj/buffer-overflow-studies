%include 'lib.inc'

section .data
    bar db '+-------------+',LF,NULL
    tit db '| Calculadora |',LF,NULL
    obVal1 db 'Valor 1: ',NULL
    obVal2 db 'Valor 2: ',NULL
    opc1 db LF,'1. Adicionar',LF,NULL
    opc2 db '2. Subtrair',LF,NULL
    opc3 db '3. Multiplicar',LF,NULL
    opc4 db '4. Dividir',LF,NULL
    msgOpc db LF,'Deseja realizar? ',NULL
    msgErr db LF,'Valor de opção Inválido!',LF, NULL
    equal db ' = ',NULL
    _plus db ' + ',NULL
    _minus db ' - ',NULL
    _times db ' * ',NULL
    _slash db ' // ',NULL
    vspace db LF,LF,NULL

section .bss
    opc     resb 2
    num1Str resb 8
    num2Str resb 8
    num1Int resd 1
    num2Int resd 1
    resInt  resd 1

section .text

global _start

_start:
    ; Print initial banner
    mov ecx, bar
    call print
    mov ecx, tit
    call print
    mov ecx, bar
    call print

    ; Show options
    mov ecx, opc1
    call print
    mov ecx, opc2
    call print
    mov ecx, opc3
    call print
    mov ecx, opc4
    call print

    ; Get option
    mov ecx, msgOpc
    call print
    mov ecx, opc
    mov edx, 0x02
    call scan

    ; Convert option to int and check
    mov ah, [opc]
    sub ah, '0'
    cmp ah, 4
    jg error
    cmp ah, 1
    jl error
    
    ; Get value 1
    mov ecx, obVal1
    call print
    mov ecx, num1Str
    mov edx, 0x08
    call scan
    lea esi, [num1Str]
    call atoi
    mov [num1Int], eax

    ; Get value 2
    mov ecx, obVal2
    call print
    mov ecx, num2Str
    mov edx, 0x08
    call scan
    lea esi, [num2Str]
    call atoi
    mov [num2Int], eax

    mov ecx, vspace
    call print

    ; show first operand
    mov eax, [num1Int]
    call itoa
    mov ecx, buffer
    call print

    ; Convert option to int
    mov ah, [opc]
    sub ah, '0'

    ; switch to operation
    cmp ah, 1
    je add
    cmp ah, 2
    je subtract
    cmp ah, 3
    je multiply
    cmp ah, 4
    je divide
    
add:
    ; show +
    mov ecx, _plus
    call print

    mov eax, [num1Int]
    add eax, [num2Int]
    mov [resInt], eax
    jmp show_result

subtract:
    ; show -
    mov ecx, _minus
    call print

    mov eax, [num1Int]
    mov ebx, [num2Int]
    cmp ebx, eax
    jg error
    sub eax, ebx
    mov [resInt], eax
    
    jmp show_result

multiply:
    ; show +
    mov ecx, _times
    call print

    mov eax, [num1Int]
    imul eax, [num2Int]
    mov [resInt], eax
    jmp show_result

divide:
    ; show /
    mov ecx, _slash
    call print

    mov eax, [num1Int]
    mov ebx, [num2Int]
    test ebx, ebx
    jz error
    xor edx, edx ; edx need to be 0 for div work
    div ebx ; eax = eax // ebx , edx = eax % ebx
    mov [resInt], eax
    jmp show_result

error:
    mov ecx, msgErr
    call print
    jmp exit

show_result:
    ; show second operand
    mov eax, [num2Int]
    call itoa
    mov ecx, buffer
    call print
    ; Show =
    mov ecx, equal
    call print
    ; Result
    mov eax, [resInt]
    call itoa
    mov ecx, buffer
    call print

    mov ecx, vspace
    call print

    jmp exit