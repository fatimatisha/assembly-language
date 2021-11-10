  
  ;write a program that display a array
  
  
  .model small    
  .stack 100h
  .data  
  
    a db 10 dup(?)
  
  .code
  
  main proc
    mov ax,@data
    mov ds,ax
    
    lea si,a
    mov cx,5 
    
    
    L1: 
    
    mov ah,1
    int 21h
      
    
    mov [si],al     
    add dl,30h
    add si,1    ;for byte address
    loop L1  
     
     
    lea si,a
    mov cx,5
    
    L2:
    mov dl,[si]
    mov ah,2
    int 21h
    add si,1
    
    mov dl,0Ah 
    mov ah,2
    
    mov dl,0Dh
    mov ah,2
    
    loop L2
    
    mov ah,4ch
    int 21h
    
    main endp
end main
  