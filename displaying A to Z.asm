.model small
.stack 100h
.data
msg db "ABCDEFGHIJKLMNOPQRSTUVWXYZ$"
.code
main proc
   mov al,msg
   mov ds,ax
   mov cx,26  ;number of characters from A to Z
   mov SI,0   ;index for the message
   display_loop:
   
   mov dl,msg[si]
   add dl,65
   mov ah,02h ;displaying characters
   int 21h
   inc [si]
   loop display_loop
   
   mov ah,4ch
   int 21h 
    
    
    
    
    
   main endp
end main