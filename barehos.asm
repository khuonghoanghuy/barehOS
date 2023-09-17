[bits 16]
[org 0x7C00]

section .data
section .text
global start

start:
    cli
    mov si, msg
    mov ah, 0x0E
    mov eax, 1
    mov ebx, 1
    int 80h

loop: lodsb
    or al, al
    jz halt
    int 0x10
    jmp loop

halt: hlt
msg: db "Hello, Welcome to BarehOS!", 0
times 510 - ($ - $$) db 0
dw 0xAA55