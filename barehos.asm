[bits 16]
[org 0x7C00]
start:
    cli
    mov si, msg
    mov ah, 0x0E

loop: lodsb
    or al, al
    jz halt
    int 0x10
    jmp loop

halt: hlt
msg: db "Hello, Welcome to BarehOS!", 0
times 510 - ($ - $$) db 0
dw 0xAA55