%include "in_out.asm"

SECTION .data
msg1 db "Функция: f(x)=10*x-5", 10, 0
msg2 db "Результат: ", 0

SECTION .text
global _start

f_calc:
    imul eax, eax, 10
    sub eax, 5
    ret

_start:
    pop ecx
    pop edx
    sub ecx, 1

    mov esi, 0
    mov eax, msg1
    call sprint

next:
    cmp ecx, 0
    jz _end

    pop eax
    call atoi
    call f_calc

    add esi, eax
    loop next

_end:
    mov eax, msg2
    call sprint
    mov eax, esi
    call iprintLF
    call quit
