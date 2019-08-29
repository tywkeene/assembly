BITS 64

section .data
hello db "Hello, world!", 0x0A, 0x00

section .text

_start:
    mov r8, 3 ;how many times to print

    ;get the size
    mov rax, hello
    call strlen

_print_loop:
    dec r8

    mov rax, 1 ; write syscall
    mov rdi, 1
    mov rsi, hello
    syscall

    cmp r8, 0x00
    jnz _print_loop

    mov rax, 60 ;exit system call
    mov rdi, 0x00
    syscall
    ret

;rax: string pointer
;rdx: string length counter
strlen:
    inc rax
    inc rdx
    mov cl, [rax]
    cmp cl, 0x00
    jne strlen
    ret
