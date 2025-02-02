.model small
.stack 100h
.data
    num1 db 3
    num2 db 4
    num3 db 5
    num4 db 3
    num5 db 5
    result db 0
    message db 'The average of numbers: $'
.code
main proc
    ; Load numbers into registers
    mov al, num1
    mov bl, num2
    mov cl, num3
    mov dl, num4
    mov dh, num5

    ; Add numbers
    add al, bl
    add al, cl
    add al, dl
    add al, dh

    ; Divide by 5
    mov cl, 5
    div cl

    ; Store result
    mov result, al

    ; Display message
    mov ah, 09h
    lea dx, message
    int 21h

    ; Display result
    mov ah, 02h
    mov al, result
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

end main