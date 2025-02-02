.MODEL SMALL
.STACK 100H
.DATA
    num1 DW 10       ; First number
    num2 DW 20       ; Second number
    num3 DW 30       ; Third number

.CODE
    MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, num1      ; Load first number into SI
    MOV BP, num2      ; Load second number into BP
    MOV BX, num3      ; Load third number into BX
    
    PUSH SI           ; Push the first number
    PUSH BP           ; Push the second number
    PUSH BX           ; Push the third number

    POP AX            ; Pop the third number into AX
    POP CX            ; Pop the second number into CX
    ADD AX, CX        ; Add the third and second numbers

    POP DX            ; Pop the first number into DX
    ADD AX, DX        ; Add the result of (3rd + 2nd) with the first

    PUSH AX           ; Push the result back onto the stack
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN