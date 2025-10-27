SECTION .data
    msg db 'Введите строку:', 10
    msgLen equ $ - msg

SECTION .bss
    buf resb 80

SECTION .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msgLen
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, buf
    mov edx, 80
    int 80h

    mov edx, eax
    mov eax, 4
    mov ebx, 1
    mov ecx, buf
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
