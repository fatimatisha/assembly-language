.model small
.stack 100h
.data


a db "enter a number:$" 
.code
main proc
    mov ax,@data
    mov ds,ax 
    
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