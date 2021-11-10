;3.	Write a program that prompts the user to enter a character 
;and displays its ASCII code in hexadecimal

 .MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  0DH,0AH,'Enter the character : $'
   PROMPT_2  DB  0DH,0AH,'The ASCII code in hexadecimal form is : $'

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

        
       LEA DX, PROMPT_2           
       MOV AH, 9
       INT 21H

       XOR DX, DX                
       MOV CX, 4                  
       
       MOV DL,0

       LOOP_1:                   
         SHL BL, 1                
         RCL DL, 1                 
                                 
         
                                  
       LOOP LOOP_1                

       MOV CX, 4                   

       LOOP_2:                  
         SHL BL, 1                
         RCL DH, 1                 
                                  
       LOOP LOOP_2               

       MOV BX, DX                 
       MOV CX, 2                   

       LOOP_3:                   
         CMP CX, 1              
         JE SECOND_DIGIT         
         MOV DL, BL              
         JMP NEXT                 

         SECOND_DIGIT:           
           MOV DL, BH            

         NEXT:                   

         CMP DL, 9                 
         JBE NUMERIC_DIGIT        
         SUB DL, 9                
         OR DL, 40H              
         JMP DISPLAY           

         NUMERIC_DIGIT:           
           OR DL, 30H             

         DISPLAY:                
           MOV AH, 2                
           INT 21H                
       LOOP LOOP_3                

 
     MOV AH, 4CH                   
     INT 21H
   MAIN ENDP
 END MAIN

















