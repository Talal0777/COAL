.model small
.stack 100h
.data
msg db "abcdefghijklmnopqrstuvwxyz$"
.code
main proc
   mov al,msg
   mov ds,ax
   mov cx,26  ;number of characters from z to a
   mov SI,25   ;index for the message
   display_loop:
   
   mov dl,msg[si]
   add dl,122
   mov ah,02h ;displaying characters
   int 21h
   dec [si]
   loop display_loop
   
   mov ah,4ch
   int 21h 
    
    
    
    
    
   main endp
end main