.MODEL SMALL
.STACK 100H
.DATA
num DB  0DH, 0AH, '$'
.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 1         ; Outer loop counter (row number)
    
OuterLoop:
    PUSH CX           ; Save the current row number for restoring after inner loop
    
    MOV BX, CX        ; Move row number to BX
    MOV DX, CX        ; Inner loop counter
 
 ; Print the current number   

InnerLoop:
    PUSH DX           ; Save the inner loop counter
    MOV DL, BL        ; Move the number to DL
    ADD DL, 48       
    MOV AH, 2       
    INT 21H

    POP DX            ; Restore the inner loop counter
    DEC DX            ; Decrease inner loop counter
    JNZ InnerLoop     ; Repeat inner loop if DX is not equal to 0

    
    LEA DX, num
    MOV AH, 09H       ; Print newline after each row
    INT 21H

    POP CX            ; Restore the outer loop counter
    INC CX            ; Move to the next row
    CMP CX, 6         ; Check if we have printed 5 rows
    JNE OuterLoop     ; If not, repeat the outer loop
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN