.MODEL SMALL
.STACK 100H

.DATA
newline DB 0DH, 0AH, '$'  ; Newline characters

.CODE
START:
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 1         ; Row counter
    
OuterLoop:
    PUSH CX           ; Save row counter
    
    MOV BX, CX        ; Set number to print
    MOV DX, CX        ; Set inner loop counter

InnerLoop:
    ; Print number (BX)
    PUSH DX           ; Save inner loop counter
    MOV DL, BL        ; Move number to DL
    ADD DL, '0'       ; Convert to ASCII
    MOV AH, 02H       ; DOS interrupt to print character
    INT 21H

    POP DX            ; Restore inner loop counter
    DEC DX            ; Decrease counter
    JNZ InnerLoop     ; Repeat if DX != 0

    ; Print newline
    LEA DX, newline
    MOV AH, 09H       ; DOS interrupt to print string
    INT 21H

    POP CX            ; Restore row counter
    INC CX            ; Next row
    CMP CX, 6         ; Check if 5 rows printed
    JNE OuterLoop     ; Repeat if not

    ; Exit program
    MOV AH, 4CH
    INT 21H

END START
