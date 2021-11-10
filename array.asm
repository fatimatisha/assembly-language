  
  ;write a program that display a array
  
  
  .model small    
  .stack 100h
  .data  
  
    a db 2,1,3,6,4
  
  .code
  
  main proc
    mov ax,@data
    mov ds,ax
    
    lea si,a
    mov cx,5 
    
    L1:
    
    mov dl,[si]
    add dl,30h
    mov ah,2
    int 21h
    add si,1    ;for byte address
    
           
    mov ah,4ch
    int 21h
    
    main endp
end main
  
  
  
  
  
  