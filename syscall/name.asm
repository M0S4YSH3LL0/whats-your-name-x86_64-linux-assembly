SYS_WRITE  equ 1
SYS_READ   equ 0
SYS_EXIT   equ 60

STD_IN     equ 0
STD_OUT    equ 1

EXIT_CODE  equ 0

section .data
    prompt:         db  "What is your name? ",0, 0
    prompt_len:     equ $ - prompt
    greeting:       db  "Hello, ", 0, 0
    greeting_len:    equ $ - greeting

section .bss
    name:         resb  0x10

section .text
    global _start

_start:
    call _printPrompt
    call _getName
    call _printGreeting
    call _printName
    call _exit

_exit:
    mov rax, SYS_EXIT
    mov rdx, EXIT_CODE
    syscall

_printPrompt:
    mov rax, SYS_WRITE
    mov rdi, STD_OUT
    mov rsi, prompt
    mov rdx, prompt_len
    syscall
    ret

_printName:
    mov rax, SYS_WRITE
    mov rdi, STD_OUT
    mov rsi, name
    mov rdx, 0x10
    syscall
    ret

_printGreeting:
    mov rax, SYS_WRITE
    mov rdi, STD_OUT
    mov rsi, greeting
    mov rdx, greeting_len
    syscall
    ret

_getName:
    mov rax, SYS_READ
    mov rdi, STD_IN
    mov rsi, name
    mov rdx, 0x10
    syscall
    ret
