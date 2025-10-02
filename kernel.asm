[bits 16]
[org 0x8000]

mov si, kernel_msg
call print_string

loop:
	jmp loop

print_string:
    pusha
.next:
    lodsb
    test al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp .next
.done:
    popa
    ret

kernel_msg db "Hello from the kernel!", 0
