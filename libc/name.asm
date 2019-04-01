extern     printf
extern     scanf

;SYS_WRITE  equ 1
;SYS_READ   equ 0
SYS_EXIT   equ 60

STD_IN     equ 0
STD_OUT    equ 1
;STD_ERR    equ 2

%macro print 2
    mov rdi, %2
    mov rsi, %1
    mov rax, 0
    call printf
%endmacro

%macro scan 2
    mov rsi, %1
    mov rdi, %2
    mov rax, 0
    call scanf
%endmacro

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
    print prompt, str_fmt
    scan name, input_fmt
    print name, name_fmt

    call exit

exit:
    mov rax, SYS_EXIT
    mov rdx, 0
    syscall
