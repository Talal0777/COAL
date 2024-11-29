;adding and subtracting using macro

.model small
.stack 100h
.data
result db 0
.code
add_val macro value
    mov al,value
    add result,al
endm

sub_val macro value
    mov al,value
    sub result,al
endm
main proc
    mov ax,@data
    mov ds,ax
    add_val 3
    add_val 5
    sub_val 2
    sub_val 1
    mov dl,result
    add dl,48
    mov ah,2
    int 21h
    mov ah,4ch
    int 21h
endp
end main
