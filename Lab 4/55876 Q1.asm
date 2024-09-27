.model small            
.stack 100h            
.data                  
msg db "Enter a number between 0 and 9: $" 
even db " number is even$"         
odd db " number is odd$"           
.code                   
main proc              ; Start of the main procedure
    mov ax, @data     ; Load the data segment address into AX
    mov ds, ax        ; Move the address from AX to DS

    mov ah, 09h       ; Prepare for displaying string
    lea dx, msg       ; Load address of msg into DX
    int 21h           ; Call DOS interrupt to display the message

    mov ah, 01h       ; Prepare to read a character
    int 21h           ; Call DOS interrupt to read a character
    sub al, '0'       ; Convert ASCII character to integer (0-9)

    cmp al, 0         ; Check if the number is less than 0
    jl error          ; Jump to error if less than 0
    cmp al, 9         ; Check if the number is greater than 9
    jg error          ; Jump to error if greater than 9

    mov ah, 0         ; Clear AH for division
    mov bl, 2         ; Set divisor to 2 (for even/odd check)
    div bl             ; Divide AL by BL (2), result in AL, remainder in AH

    cmp ah, 0         ; Check if remainder is 0
    je even_num       ; If yes, it's even, jump to even_num
    jmp odd_num       ; Otherwise, jump to odd_num

even_num:
    mov ah, 09h       ; Prepare to display even message
    lea dx, even      ; Load address of even message into DX
    int 21h           ; Call DOS interrupt to display the message
    jmp exit          ; Jump to exit

odd_num:
    mov ah, 09h       ; Prepare to display odd message
    lea dx, odd       ; Load address of odd message into DX
    int 21h           ; Call DOS interrupt to display the message 

error:
    mov ah, 4ch       ; Prepare to exit program
    int 21h           ; Call DOS interrupt to exit

exit:
    mov ax, 4C00h     ; Prepare for program termination
    int 21h           ; Call DOS interrupt to terminate program
main endp              ; End of main procedure
end main               ; End of the program
