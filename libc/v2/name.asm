extern     printf
extern     scanf

SYS_EXIT   equ 60

STD_IN     equ 0
STD_OUT    equ 1

section .data
    prompt:      db  "What is your name? ",0, 0
    str_fmt:     db "%s", 10, 0
    input_fmt:   db "%s\n", 10, 0
    name_fmt:    db "Your name is: %s", 10, 0

section .bss
    name:        resd   1

section .text
    global main

main:
    mov rsi, prompt
    mov rdi, str_fmt
    call _print

    mov rsi, name
    mov rdi, input_fmt
    call _getInput

    mov rsi, name
    mov rdi, name_fmt
    call _print

    call exit

_getInput:
    mov rax, 0
    call scanf
    xor rdi, rdi
    xor rsi, rsi
    ret

_print:
    mov rax, 0
    call printf
    xor rdi, rdi
    xor rsi, rsi
    ret

exit:
    mov rax, SYS_EXIT
    mov rdx, 0
    syscall
