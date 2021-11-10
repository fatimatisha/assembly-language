;6.	Write a program to add two hexadecimal numbers.     

 .model small                                                         
 .data  
   PROMPT_1  DB  'Enter the first hexa decimal number : $'
   PROMPT_2  DB  0DH,0AH,'Enter the second hexa decimal number : $'
   PROMPT_3  DB  0DH,0AH,'Summation of the numbers : $' 

 .code  
 
 main proc
    
      mov      ax, @data      
      mov      ds, ax 
      
      LEA DX, PROMPT_1                
      MOV AH, 9
      INT 21H              
      
      mov ah,1
      int 21h
      
      mov bl, al         
      cmp bl,39H
      jbe digit2 
        
      
      letter:  
      sub bl,07
      
      digit2:
      sub bl,30H  
       
       LEA DX, PROMPT_2                
      MOV AH, 9
      INT 21H
         
      mov ah,1
      int 21h
      
      cmp al,39H
      jbe digit3 
        
      
      letter2:  
      sub al,07
      
      digit3:
      sub al,30H 
      
  
      add      al, bl       
      mov      ch, 02h         
      mov      cl, 04h       
      mov      bl, al        
      
      LEA DX, PROMPT_3                
      MOV AH, 9
      INT 21H   
       
addhexa:     
      rol      bl, cl        
      mov      dl, bl         
      and      dl, 0fH        
      cmp      dl, 09          
      jbe      digit  
      add      dl, 07        
      
 digit:    
      add      dl, 30H  
      mov      ah, 02        
      int      21H  
      dec      ch             
      jnz      addhexa  
      mov      ah, 4cH        
      int      21H  
 
  main endp
 
end main 










