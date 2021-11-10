;4.	Write a program to read two decimal digits whose sum is not greater than 9 and displays their sum
.model small    
.stack 100h
.data 


.code 

     prompt db  "Enter the first number :$" 
     num1 db ?
     prompt2 db  "Enter the second number :$" 
     num2 db ?
     
     prompt3 db  "Summation of two number :$"

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,prompt;
    mov ah,9
    int 21h   
     
    
    mov ah,1
    int 21h 
    mov num1,al 
    
   
    
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    
    lea dx,prompt2;
    mov ah,9
    int 21h 
    
    mov ah,1
    int 21h 
    mov num2,al  
    
        
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    mov dl, 0Dh
    mov ah, 02h
    int 21h        
    
    
    lea dx,prompt3;
    mov ah,9
    int 21h 
    
    mov bl,num1
    
    add bl,num2
    
    sub bl,30h  
    
    mov dl,bl
            
    mov ah,2
    int 21h 
    
    
    exit:
    mov ah,4ch
    int 21h 
    
    main endp
end main



