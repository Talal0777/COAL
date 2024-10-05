.MODEL SMALL
.STACK 100H
.DATA
    ; Define the three numbers
    numA DW 10        ; First number
    numB DW 20        ; Second number
    numC DW 30        ; Third number

.CODE
START:
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Load the numbers into registers
    MOV SI, numA      ; Load first number into SI
    MOV BP, numB      ; Load second number into BP
    MOV BX, numC      ; Load third number into BX

    ; Push the numbers onto the stack
    PUSH SI           ; Push first number
    PUSH BP           ; Push second number
    PUSH BX           ; Push third number

    ; Start adding by popping values
    POP AX            ; Pop third number into AX
    POP CX            ; Pop second number into CX
    ADD AX, CX        ; Add third and second numbers

    POP DX            ; Pop first number into DX
    ADD AX, DX        ; Add first number to result

    ; Push the result back onto the stack
    PUSH AX           ; Push result onto stack

    ; Exit program
    MOV AH, 4CH
    INT 21H

END START
