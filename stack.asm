.model small
.stack 100h
.data

a dw 0


.code
main proc
    mov ax,@data
    mov ds,ax    
            
    mov cx,0
    
    L2:
    mov ah,1
    int 21h
    
    cmp al,0DH
    je L1
    
    push ax
    inc cx
    jmp L2
    
    L1:
    mov dl,0AH
    mov ah,2
    int 21h
    
    L3:
    pop dx
    mov ah,2
    int 21h
    
    Loop L3 
    
    mov ah,4ch
    int 21h    
    
    main endp
end main 
    