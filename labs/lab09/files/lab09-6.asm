%include 'in_out.asm'
SECTION .data
msg db 'Результат: ',0
SECTION .text
global _start
_start:
    mov ebx,3
    mov eax,2
    add ebx,eax
    mov ecx,4
    mov eax,ebx
    mul ecx
    add eax,5
    mov edi,eax
    mov eax,msg
    call sprint
    mov eax,edi
    call iprintLF
    call quit
