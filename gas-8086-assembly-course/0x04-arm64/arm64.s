# Compile:
# aarch64-linux-gnu-as -o arm64 arm64.s
# Dumping:
# aarch64-linux-gnu-objdump -d arm64

.globl _start
.text

_start:
    mov x0, #0
    mov w8, #93
    svc #0
