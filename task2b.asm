.model small
.stack 100h
.data
    num1 db 2
    num2 db 3
    num3 db 4
    result db 0

.code
main proc
    ; Load numbers into registers
    mov al, num1
    mov bl, num2
    mov cl, num3

    ; Add numbers
    add al, bl
    add al, cl

    ; Store result
    mov result, al

    ; Exit program
    mov ax, 4Ch
    int 21h
main endp

end main