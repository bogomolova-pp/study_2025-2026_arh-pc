SECTION .data
    zapros db "Как Вас зовут?", 10
    zapros_len equ $-zapros
    msg db "Меня зовут ", 0
    msg_len equ $-msg
    filename db "name.txt", 0

SECTION .bss
    buffer resb 100

SECTION .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, zapros
    mov edx, zapros_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 100
    int 0x80
    mov esi, eax

    dec esi
    mov al, [buffer + esi]
    cmp al, 10
    je done_lf
    mov byte [buffer + esi + 1], 10
    inc esi
done_lf:
    inc esi

    mov eax, 5
    mov ebx, filename
    mov ecx, 0101o
    mov edx, 0644o
    int 0x80
    mov edi, eax

    mov eax, 4
    mov ebx, edi
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    mov eax, 4
    mov ebx, edi
    mov ecx, buffer
    mov edx, esi
    int 0x80

    mov eax, 6
    mov ebx, edi
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
