%include 'in_out.asm'

section .data
msg_x db 'Введите x: ',0h
msg_a db 'Введите a: ',0h
msg_res db 'f(x) = ',0h

section .bss
x resb 10
a resb 10
res resb 10

section .text
global _start

_start:
mov eax, msg_x
call sprint
mov ecx, x
mov edx, 10
call sread
mov eax, x
call atoi
mov [x], eax

mov eax, msg_a
call sprint
mov ecx, a
mov edx, 10
call sread
mov eax, a
call atoi
mov [a], eax

mov eax, [x]
cmp eax, 3
jne x_ne_ravno3
imul eax, eax, 3
jmp zapis_resultata

x_ne_ravno3:
mov eax, [a]
add eax, 1

zapis_resultata:
mov [res], eax
mov eax, msg_res
call sprint
mov eax, [res]
call iprintLF
call quit
