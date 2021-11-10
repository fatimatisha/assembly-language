.model small
.stack 100h
.data



.code
main proc
    mov ax,@data
    mov ds,ax 
           
    mov cx,10       
    L1:      
    mov dl,"t"  
    mov ah,2
    int 21h
    LOOP L1  
    
    
    mov ah,1
    int 21h
    
    and al,0DFh
                 
    mov dl,al             
    mov ah,2
    int 21h  
                 
    mov ah,1
    int 21h
    
    or al,21h
                 
    mov dl,al             
    mov ah,2
    int 21h               
    
    main endp 
end main