section .data
    result  db "Sum = %d", 10, 0      ; format string for printf
    sum     dq 0                      ; 8-byte (64-bit) variable

section .text
    global main
    extern printf

main:
    mov rcx, 15        ; start = 15
    mov rax, 0         ; sum = 0

loop_up:
    add rax, rcx       ; sum += rcx
    inc rcx            ; rcx++
    cmp rcx, 26        ; stop when rcx == 26
    jne loop_up

    mov [sum], rax

    ; Calling printf in 64-bit Linux ABI
    lea rdi, [rel result] ; 1st argument (format string)
    mov rsi, rax          ; 2nd argument (sum value)
    xor rax, rax          ; 0 floating-point args
    call printf

    ret
