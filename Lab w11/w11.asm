.model small
.stack 100h
.data
msg db "Please select the proper number from the following:", 10, 13, "$" 
option1 db "1. Addition", 10, 13, "$"
option2 db "2. Subtraction", 10, 13, "$"
option3 db "3. Division", 10, 13, "$"
prompt db "Enter your choice (1-3): ",10,13, "$"
num1Msg db "Enter first number : ",10,13, "$"
num2Msg db "Enter second number : ",10,13, "$"
resultMsg db "Result: ", "$"
result db 0

.code
addition macro num1, num2
    mov al, num1
    add al, num2
    mov result, al
endm

subt macro num1, num2
    mov al, num1
    sub al, num2
    mov result, al
endm

divi macro num1, num2
    mov al, num1
    mov bl, num2
    xor ah, ah         
    div bl
    mov result, al
endm

main proc 
    mov ax, @data
    mov ds, ax

    
    mov dx, offset msg
    mov ah, 9
    int 21h 

    mov dx, offset option1
    mov ah, 9
    int 21h 

    mov dx, offset option2
    mov ah, 9
    int 21h

    mov dx, offset option3
    mov ah, 9
    int 21h

    
    mov dx, offset prompt
    mov ah, 9
    int 21h

   
    mov ah, 1
    int 21h
    sub al, '0'          
    mov bl, al          

    
    mov dx, offset num1Msg
    mov ah, 9
    int 21h

    
    mov ah, 1
    int 21h
    sub al, '0'         
    mov cl, al          

    
    mov dx, offset num2Msg
    mov ah, 9
    int 21h

   
    mov ah, 1
    int 21h
    sub al, '0'          
    mov dh, al          
    cmp bl, 1
    je addition_op
    cmp bl, 2
    je subtraction_op
    cmp bl, 3
    je division_op
    jmp end_program      

addition_op:
    addition cl, dh
    jmp display_result

subtraction_op:
    subt cl, dh
    jmp display_result

division_op:
    cmp dh, 0
    je division_by_zero   
    divi cl, dh
    jmp display_result

division_by_zero:
    
    mov result, 0
    jmp display_result

display_result:
    
    mov dx, offset resultMsg
    mov ah, 9
    int 21h

   
    mov al, result
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h

end_program:
    mov ah, 4ch
    int 21h
endp