.MODEL SMALL
.STACK 100H
.DATA
    originalString DB 'HELLO, WORLD!', '$'  ; Original string
    reversedString DB 14 DUP ('$')          ; Buffer for reversed string
    msgOriginal DB 'Original String: $'     ; Message for original string
    msgReversed DB 'Reversed String: $'     ; Message for reversed string

.CODE
START:
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX
    
    ; Print the original string message
    LEA DX, msgOriginal
    MOV AH, 09H          ; DOS function to print string
    INT 21H
    
    ; Print the original string
    LEA DX, originalString
    MOV AH, 09H
    INT 21H

    ; Reverse the string
    LEA SI, originalString  ; Load original string address
    LEA DI, reversedString  ; Load reversed string buffer address

    MOV CX, 0               ; Character counter

    ; Find the length of the original string
FindLength:
    MOV AL, [SI + CX]       ; Get a character from the string
    CMP AL, '$'             ; Check for end of string
    JE Reverse              ; If end, start reversing
    INC CX                  ; Increase counter
    JMP FindLength          ; Continue counting

Reverse:
    DEC CX                  ; CX holds string length - 1
    MOV BX, CX              ; Save length in BX

    ; Push characters onto the stack
PushLoop:
    MOV AL, [SI]            ; Load current character
    MOV AH, 0               ; Clear upper byte
    PUSH AX                 ; Push character onto stack
    INC SI                  ; Move to next character
    DEC CX                  ; Decrease counter
    JNZ PushLoop            ; Repeat until all characters are pushed

    ; Pop characters to form the reversed string
PopLoop:
    POP AX                  ; Pop character from stack
    MOV [DI], AL            ; Store in reversed string buffer
    INC DI                  ; Move to next buffer position
    DEC BX                  ; Decrease length counter
    JNZ PopLoop             ; Repeat until stack is empty

    ; Print the reversed string message
    LEA DX, msgReversed
    MOV AH, 09H
    INT 21H

    ; Print the reversed string
    LEA DX, reversedString
    MOV AH, 09H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

END START
