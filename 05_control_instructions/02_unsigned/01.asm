; JA / JNBE → Jump if Above

section .data
    str_above db "AX > BX (Above) - Keittah Sewe, 151426",10,0
    len_above equ $ - str_above

    str_not_above db "AX <= BX (Not Above) - Keittah Sewe, 151426",10,0
    len_not_above equ $ - str_not_above

section .text
    global _start
_start:
    mov ax, 7
    mov bx, 3
    cmp ax, bx
    ja above

not_above:
    mov ecx, str_not_above
    mov edx, len_not_above
    jmp print

above:
    mov ecx, str_above
    mov edx, len_above

print:
    mov eax,4       ; syscall number for sys_write
    mov ebx,1       ; file descriptor (stdout)
    int 0x80

    mov eax,1       ; syscall number for sys_exit
    xor ebx,ebx
    int 0x80
