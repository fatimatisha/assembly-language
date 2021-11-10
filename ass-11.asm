;11.	Write a program to search an element in an array.    

.model small    
  .stack 100h
  .data
  
    PROMPT_1  DB  0DH,0AH,"Enter the array : $"
    PROMPT_2  DB  0DH,0AH,"Enter the number you are looking for : $"  
    PROMPT_3  DB  0DH,0AH,"Number is found at index : $"  
    PROMPT_4  DB  0DH,0AH,"Number is not found $"  

    
    a db 10 dup(?)
  
  .code
  
  main proc
    mov ax,@data
    mov ds,ax 
    
     LEA DX, PROMPT_1             
     MOV AH, 9
     INT 21H

    
    lea si,a
    mov cx,5
    
    
    L1: 
    
    mov ah,1
    int 21h
      
    
    mov [si],al     
    add si,1         
    
    mov dl,' '
    mov ah,2
    int 21h
    
    loop L1  
    
   LEA DX, PROMPT_2           
     MOV AH, 9
     INT 21H

   
    
    mov ah,1
    int 21h
   
     
    lea si,a
    mov cx,5 
    mov bh,0
    
    L2:
    mov bl,[si]
    cmp al,bl
    je found
    
    add si,1 
    inc bh 
     
    
    loop L2  
    
    LEA DX, PROMPT_4            
     MOV AH, 9
     INT 21H
 
    jmp exit            
    
     found:
     LEA DX, PROMPT_3           
     MOV AH, 9
     INT 21H  
     
     
     add bh,30h
     mov dl,bh
     mov ah,2
     int 21h

    
    exit:
    
    mov ah,4ch
    int 21h
    
    main endp
end main
  