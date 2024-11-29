;finding average of 4 numbers and displaying the result using macro

.model small
.stack 100h
.data
result db 0
.code
avg macro num1, num2, num3, num4
    mov al, num1
    add al, num2
    add al, num3
    add al, num4
    mov ah,0     ; clearing AH for removing overflow for divison
    mov cl, 4
    div cl
    mov result,al
endm

main proc
    mov ax,@data
    mov ds,ax
    avg 2,2,2,2
    mov dl,result
    add dl,48
    mov ah,2
    int 21h
    mov ah, 4ch
    int 21h
endp
end main