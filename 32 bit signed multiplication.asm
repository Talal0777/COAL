INCLUDE Irvine32.inc

.data
    num1 BYTE 4          
    num2 BYTE 7          
    result DWORD 0

.code
main PROC

	movsx eax, num1		; load num1 into eax with sign-extension
	movsx ebx, num2		; load num2 into ebx with sign-extension
 	mov ecx, 0		; clear ecx to accumulate result
	mov edx, 0		; edx will hold the final sign bit

    	test eax, eax        	; test if num1 is negative
    	jge skip1     		; if non-negative, skip
    	neg eax              	; if negative, make eax positive
    	inc edx              	
skip1:

    test ebx, ebx        ; test if num2 is negative
    jge skip2     	 ; if non-negative, skip
    neg ebx              ; if negative, make ebx positive
    inc edx              
skip2:

multiply:
    test ebx, 1          ; check if LSB of EBX is 1
    jz addition          ; if 0, skip addition
    add ecx, eax         ; if 1, add EAX to result in ECX
addition:
    shr ebx, 1           ; shift EBX right by 1 (divide by 2)
    shl eax, 1           ; shift EAX left by 1 (multiply by 2)
    jnz multiply    ; repeat until EBX is zero
    test edx, 1          ; check the sign flag in edx
    jz done              ; if sign flag is 0, result is positive
    neg ecx              ; if sign flag is 1, negate the result

done:
    mov result, ecx      ; store final result in memory
    mov eax, result      ; move the result to eax for output
    call WriteDec        ; display the result as a signed decimal
    exit
main ENDP
END main