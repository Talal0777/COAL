.model small
.stack 100h
.data
result db 0
.code
main proc
    ; Initialize result to 0
    mov result, 0

    ; Add 3 to result
    mov al, 3
    add result, al

    ; Add 5 to result
    mov al, 5
    add result, al

    ; Subtract 2 from result
    mov al, 2
    sub result, al

    ; Subtract 1 from result
    mov al, 1
    sub result, al

    ; Display result on screen
   
    mov al, result 
    add al, 48
    mov dl, al
    mov ah, 2h   
     int 21h
    
    mov ah, 4ch
    int 21h
    
    main endp
     
end main