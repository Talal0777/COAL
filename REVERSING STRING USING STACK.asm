.MODEL SMALL
.STACK 100H
.DATA
    str1 DB 'HELLO, WORLD!', '$'
    str2 DB 14 DUP ('$')        
    msgO DB 'Original String: $'
    msgR DB 13, 10, 'Reversed String: $'

.CODE                           

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    LEA DX, msgO
    MOV AH, 09H           ; Print the original message
    INT 21H
    
    LEA DX, str1          ; Print the original string
    MOV AH, 09H   
    INT 21H

    LEA SI, str1          ; Load the address of the original string into SI
    LEA DI, str2          ; Load the address of the reversed string into DI

    MOV BX, 0             ; Clear character count
FindLength:
    MOV AL, [SI + BX]     ; Load a character from the original string
    
    CMP AL, '$'           ; Check if the end of the string is reached
    JE Reverse            ; If end of string, start reversing
    INC BX                ; Increase the character count
    JMP FindLength        ; Continue counting characters

Reverse:
    DEC BX                ; BX now contains the length of the string 
    MOV BP, BX            ; Copy the length to BX

PushLoop:
   
    MOV AL, [SI + BP]     ; Load the current character from the original string      
    SUB AL,16
    MOV [DI], AL         ; Store it in the reversed string buffer directly
    INC DI                ; Move to the next position in the reversed string buffer
    DEC BP                ; Decrease the counter
    JNZ PushLoop          ; Repeat until all characters are reversed

    LEA DX, msgR
    MOV AH, 09H           ; Print the reversed message
    INT 21H
    
    MOV DX, OFFSET str2
    MOV AH, 09H           ; Print the reversed string
    INT 21H 
   
    MOV AH, 4CH         
    INT 21H     
   
MAIN ENDP
END MAIN
