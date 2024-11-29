;adding three numbers using macro

.model small
.stack 100h
.data
 result db 0
.code
 addition macro num1, num2, num3
mov al, num1
add al, num2
add al, num3
mov result,al
 endm
 
main proc
mov ax, @data
mov ds, ax
addition 2,3,4
mov dl,result
add dl,48
mov ah,2
int 21h
mov ah,4ch
int 21h    
    
    
endp
end main