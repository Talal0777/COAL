.model small
.stack 100h
.data
array db 'abcdefgh$' ; Array of characters with $ as the end marker
input db ?            ; Variable to store user input
found1 db 'Character is found$'  ; Message when character is found
not_found1 db 'Character is not found$' ; Message when character is not found

code segment
assume cs:code, ds:data

start:
    ; Initialize data segment
    mov ax, data
    mov ds, ax

    ; Take input from the user
    mov ah, 01h        ; Function to read a character
    int 21h            ; Call DOS interrupt
    mov input, al      ; Store the input character

    ; Set up for searching the array
    lea si, array      ; Load address of the array into SI
    mov cx, 8          ; Set CX to number of characters in the array

search_loop:
    mov al, input      ; Load the input character
    cmp al, [si]      ; Compare with current array element
    je found           ; If equal, jump to found
    inc si             ; Move to next character in the array
    loop search_loop    ; Decrement CX and loop if not zero

not_found:
    mov ah, 09h        ; Function to display a string
    lea dx, not_found1 ; Load address of not found message
    int 21h            ; Call DOS interrupt
    jmp end_prog       ; Jump to program end

found:
    mov ah, 09h        ; Function to display a string
    lea dx, found1     ; Load address of found message
    int 21h            ; Call DOS interrupt

end_prog:
    mov ah, 4Ch        ; Terminate program
    int 21h            ; Call DOS interrupt

code ends
end start
