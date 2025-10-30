; JO → Jump if Overflow

section .data
    msg_ov db "Overflow occurred (OF=1) - Keittah Sewe, 151426",10,0
    len_ov equ $ - msg_ov

    msg_noov db "No overflow (OF=0) - Keittah Sewe, 151426",10,0
    len_noov equ $ - msg_noov

section .text
    global _start
_start:
    mov ax,7FFFh
    add ax,1       ; causes signed overflow
    jo overflow

no_overflow:
    mov ecx, msg_noov
    mov edx, len_noov
    jmp print

overflow:
    mov ecx, msg_ov
    mov edx, len_ov

print:
    mov eax,4       ; syscall: sys_write
    mov ebx,1       ; file descriptor: stdout
    int 0x80

    mov eax,1       ; syscall: sys_exit
    xor ebx,ebx
    int 0x80
