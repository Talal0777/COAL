.model small
.stack 100h
.data
Num dw 0,1,2,3,4,5,6,7,8,9
count db 10
sum db 0
avg db 0
.code
main proc
   mov ax, @Data
   mov ds,ax
   mov cx,10
   mov SI,offset Num
   mov bl,0
   mov dl,0
   ;loop for adding the number
   sum_loop:
   add dl,[SI]
   inc SI
   loop sum_loop
   mov sum,dl
   mov al,sum
   mov bl,count
   div bl        ; calculating average
   mov avg,al
   
   mov bl, avg   ; storing the average in base register
   
   mov ah,4ch
   int 21h 
    
    
    
    
    
   main endp
end main