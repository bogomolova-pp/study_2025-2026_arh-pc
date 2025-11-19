%include "in_out.asm"

section .data
    a dd 94
    b dd 5
    c dd 58
    msg db "Наименьшее число: ", 0

section .bss
    min resd 1

section .text
global _start

_start:
    mov eax, [a]
    mov [min], eax

    mov eax, [b]
    cmp eax, [min]
    jge check_c
    mov [min], eax

check_c:
    mov eax, [c]
    cmp eax, [min]
    jge print_result
    mov [min], eax

print_result:
    mov eax, msg
    call sprint

    mov eax, [min]
    call iprintLF

    call quit
