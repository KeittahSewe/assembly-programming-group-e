section .text
    global factorial

; unsigned long factorial(int n)
; input: edi = n
; output: rax = factorial result

factorial:
    mov rax, 1            ; result = 1
    cmp edi, 1            ; if n <= 1, return 1
    jle .done

.loop:
    imul rax, rdi         ; rax *= n
    dec edi               ; n--
    cmp edi, 1
    jge .loop

.done:
    ret
