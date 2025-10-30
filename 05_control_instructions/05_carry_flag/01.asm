; JC → Jump if Carry

section .data
    msg_carry db "Carry occurred (CF=1) - Keittah Sewe, 151426",10,0
    len_carry equ $ - msg_carry

    msg_nocarry db "No carry (CF=0) - Keittah Sewe, 151426",10,0
    len_nocarry equ $ - msg_nocarry

section .text
    global _start
_start:
    mov ax,0FFFFh
    add ax,1       ; sets CF=1
    jc carry

no_carry:
    mov ecx, msg_nocarry
    mov edx, len_nocarry
    jmp print

carry:
    mov ecx, msg_carry
    mov edx, len_carry

print:
    mov eax,4       ; syscall: sys_write
    mov ebx,1       ; file descriptor: stdout
    int 0x80

    mov eax,1       ; syscall: sys_exit
    xor ebx,ebx
    int 0x80
