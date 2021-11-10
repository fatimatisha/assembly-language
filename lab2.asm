.model small
.stack 100h
.data



.code
main proc
    mov ax,@data
    mov ds,ax
                
    mov ah,1
    int 21h
    
    cmp al,"1"
    je L1  
    
    cmp al,"2"
    je L2 
    
    jmp L3
    
    L1:
    mov dl,"O"
    mov ah,2
    int 21h 
    
    jmp L3
    
    L2:
    mov dl,"E"
    
    mov ah,2
    int 21h    
    
    L3:
    
             
    main endp
end main
        