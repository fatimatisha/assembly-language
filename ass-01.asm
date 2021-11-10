;1.	Write a program that prompts the user to enter a letter and
; displays the letter in opposite case.
                                          
                                        
 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  "Enter the the letter : $"
    PROMPT_2  DB 0Dh,0Ah, "Converted Letter is : $"

 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX

     LEA DX, PROMPT_1             
     MOV AH, 9
     INT 21H

     MOV AH, 1                    
     INT 21H

     MOV BL, AL                   
         
     
     CMP BL,60h
     JLE L1
     
        
     CMP BL,60h
     JG L2
      
    
     L1:
   
     MOV AH, 2                    
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  
     INT 21H                  
     
     LEA DX, PROMPT_2             
     MOV AH, 9
     INT 21H

     OR BL, 20H                   
                                   

     MOV AH, 2                    
     MOV DL, BL
     INT 21H 
      
    
     JMP L3   
     
     
     L2:
     MOV AH, 2                   
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  
     INT 21H

     LEA DX, PROMPT_2             
     MOV AH, 9
     INT 21H

     SUB BL, 20H                  

     MOV AH, 2                    
     MOV DL, BL
     INT 21H   
     
     L3:

     MOV AH, 4CH                
     INT 21H 
     
   MAIN ENDP 
 END MAIN
 
 