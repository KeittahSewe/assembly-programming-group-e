section .data
    result  db "Sum = %d", 10, 0      ; format string for printf
    sum     dq 0                      ; reserve 8 bytes for the result

section .text
    global main
    extern printf

main:
    mov rcx, 25        ; start = 25
    mov rax, 0         ; sum = 0

loop_down:
    add rax, rcx       ; sum += rcx
    dec rcx            ; rcx--
    cmp rcx, 14        ; stop when rcx == 14
    jne loop_down

    mov [sum], rax

    ; printf("Sum = %d", sum)
    lea rdi, [rel result] ; 1st argument → format string
    mov rsi, rax          ; 2nd argument → sum
    xor rax, rax          ; no FP args
    call printf

    ret
