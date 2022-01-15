bits 64
extern number

global myVar

section .data
  myVar: dd 777

section .text

global assembly
assembly:
  add dword [myVar], 3
  call number
  add eax, 111
  ret
