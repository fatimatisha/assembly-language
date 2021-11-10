;7.	Write a program that prompts the user to enter a line of 25 characters and prints the last 10 characters in reverse order. 


.model small
.stack 100h
.data 

    PROMPT_1  DB  "Enter the at most 25 characters : $"
    PROMPT_2  DB  0DH,0AH,"The last 10 reversed characters : $"
                                                 
a db ?


.code
main proc
    mov ax,@data
    mov ds,ax 
    

    
    lea dx,PROMPT_1
    mov ah,9
    int 21h   
            
    mov cx,0
    
    L2:
    mov ah,1
    int 21h
    
    cmp al,0DH
    je L1
    
    push ax
    inc cx 
    
    cmp cx,25
    je L4
    
    cmp cx,25
    jne L2
    
    L1:
    mov dl,0AH
    mov ah,2
    int 21h 
    
     
    L4:
     
    lea dx,PROMPT_2
    mov ah,9
    int 21h 
    
    cmp cx,10
    jge L5
    
    cmp cx,10
    jl L3
           
    L5:       
    mov cx,10
    jmp L3
    
       
    L3:
    
    
    pop dx
    mov ah,2
    int 21h 
    
   
    
    cmp cx,0
    je exit
    
    Loop L3
    
    exit: 
    
    mov ah,4ch
    int 21h    
    
    main endp
end main 
    