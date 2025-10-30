; jump if equal 

section .data
    msg_equal db "AX == BX (Equal, ZF=1)",10,0
    len_equal equ $ - msg_equal 
    ;10 decimal / 0x0A hex - newline character to move cursor to the next line after printing
    ;0 - null terminator
    msg_not_equal db "AX != BX (Not Equal, ZF=0)",10,0
    len_not_equal equ $ - msg_not_equal

section .text
    global _start
_start:
    mov ax, 5
    mov bx, 5

    cmp ax, bx
    je equal

not_equal:
    mov ecx, msg_not_equal 
    mov edx, len_not_equal
    jmp print

equal:
    mov ecx, msg_equal 
    mov edx, len_equal

print:
    mov eax,4   ; syscall number for sys_write
    mov ebx,1   ; file descriptor (1 = stdout)
    int 0x80    ; interrupt to invoke the call

    mov eax,1   ; syscall number for sys_exit
    xor ebx,ebx
    int 0x80
