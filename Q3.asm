.model small
.stack 100h
.data
.code
main proc
    ; Initialize the data segment
    mov ax, @data
    mov ds, ax

    ; Start with the ASCII value of 'z'
    mov cx, 26         ; Loop counter for 26 letters
    mov al, 'z'        ; Start with 'z'

print_loop:
    ; Display the character in AL
    mov ah, 0Eh        
    int 10h            

    
    dec al             ; Decrement AL to previous character
    loop print_loop    ; Decrement CX and loop if not zero

    ; Exit program
    mov ax, 4C00h      ; DOS terminate program
    int 21h
main endp
end main
