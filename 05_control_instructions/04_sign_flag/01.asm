; JS → Jump if Sign

section .data
    msg_neg db "Number is Negative (SF=1) - Keittah Sewe, 151426",10,0
    len_neg equ $ - msg_neg

    msg_pos db "Number is Positive (SF=0) - Keittah Sewe, 151426",10,0
    len_pos equ $ - msg_pos

section .text
    global _start
_start:
    mov ax,-5
    test ax,ax
    js negative

positive:
    mov ecx, msg_pos
    mov edx, len_pos
    jmp print

negative:
    mov ecx, msg_neg
    mov edx, len_neg

print:
    mov eax,4       ; syscall: sys_write
    mov ebx,1       ; file descriptor: stdout
    int 0x80

    mov eax,1       ; syscall: sys_exit
    xor ebx,ebx
    int 0x80
