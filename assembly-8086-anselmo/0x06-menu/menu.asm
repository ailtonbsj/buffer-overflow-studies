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
    p1 db 'Processo de Adição',LF,NULL
    p2 db 'Processo de Subtração',LF,NULL
    p3 db 'Processo de Multiplicação',LF,NULL
    p4 db 'Processo de Divisão',LF,NULL

section .bss
    opc resb 2
    num1 resb 4
    num2 resb 4

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
    mov ecx, num1
    mov edx, 0x04
    call scan

    ; Get value 2
    mov ecx, obVal2
    call print
    mov ecx, num2
    mov edx, 0x04
    call scan

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
    mov ecx, p1
    call print
    jmp exit

subtract:
    mov ecx, p2
    call print
    jmp exit

multiply:
    mov ecx, p3
    call print
    jmp exit

divide:
    mov ecx, p4
    call print
    jmp exit

error:
    mov ecx, msgErr
    call print
    jmp exit