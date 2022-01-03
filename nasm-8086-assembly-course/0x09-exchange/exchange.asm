section .text

global GetValueASM

GetValueASM:
    mov eax, edi ; External params come from EDI
    add eax, 1
    ret