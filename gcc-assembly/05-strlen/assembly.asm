bits 64

section .text

global my_strlen

my_strlen:
  xor eax, eax ; eax = '\0'
  mov ecx, -1
  repne ; do { cx-- , run_next_instr } while (zf != 0 || cx != 0) else { jump_next_instr }
  scasb ; zf = [rdi] == '\0' , rdi++
  mov eax, -2
  sub eax, ecx
  ret
  