.model small         
.stack 100h           
.data                   
.code                   
main proc              ; Start of the main procedure

    mov dl, '1'       ; Initialize DL with ASCII value of '1'
    mov bl, 0         ; Initialize BL to 0 (outer loop counter)

outer:                 ; Start of outer loop
    mov bh, 4         ; Initialize BH to 4 (inner loop counter)

inner:                 ; Start of inner loop
    mov ah, 2         ; Prepare for displaying character
    int 21h           ; Call DOS interrupt to display the character in DL

    inc dl            ; Increment DL (next character to display)
    dec bh            ; Decrement BH (count down for inner loop)
    cmp bh, 0         ; Check if inner loop has finished
    jne inner         ; If not zero, repeat inner loop

    mov cl, dl        ; Move the current value of DL (character) to CL
    mov dl, 10        ; Prepare DL with ASCII value for newline (LF)
    mov ah, 2         ; Prepare to display newline
    int 21h           ; Call DOS interrupt to display the newline

    mov dl, 13        ; Prepare DL with ASCII value for carriage return (CR)
    mov ah, 2         ; Prepare to display carriage return
    int 21h           ; Call DOS interrupt to display the carriage return

    mov dl, cl        ; Restore DL with the last displayed character
    
    inc bl            ; Increment outer loop counter (BL)
    cmp bl, 2         ; Check if outer loop has run 3 times (0, 1, 2)
    jne outer         ; If not equal to 2, repeat outer loop

    mov ah, 4Ch       ; Prepare to exit program
    int 21h           ; Call DOS interrupt to terminate program

main endp              
end main              
