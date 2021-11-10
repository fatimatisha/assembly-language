.model small
.stack 100h
.data


a db "enter a number:$" 
b db 3       
c db 4

.code
main proc
    mov ax,@data
    mov ds,ax   
    
    mov bl,b
    add bl,c  
    
    add bl,30h
    
    mov dl,bl
    mov ah,2
    int 21h
    
    add b,30h
    mov dl,b
    
    mov ah,2
    int 21h
    
    LEA DX,a
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h 
    
    mov dl,al    
    
    mov ah,2
    int 21h
              
              
    mov dl,"p"
    
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main