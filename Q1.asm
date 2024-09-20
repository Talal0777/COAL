.model small
.stack 100h
.data
.code
main proc
    ; Initialize 
    mov ax, @data
    mov ds, ax

    ; Start with the ASCII value of 'A'
    mov cx, 26         ; Loop counter for 26 letters
    mov al, 'A'       ; Start with 'A'

print_loop:
    ; Display the character in AL
    mov ah, 0Eh       ; BIOS teletype function
    int 10h           ; Call BIOS to print the character

    ; Move to the next character
    inc al            ; Increment AL to next character
    loop print_loop   ; Decrement CX and loop if not zero

    ; Exit program
    mov ax, 4C00h     ; DOS terminate program
    int 21h
main endp
end main
