;Task-2 Write a program that prompts the user to enter two binary numbers and prints
;their sum.   


.MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  0DH,0AH,'Enter the first binary number   : $'
   PROMPT_2  DB  0DH,0AH,'Enter the second binary number   : $'
   PROMPT_3  DB  0DH,0AH,'The binary sum is : $' 
   PROMPT_4  DB  0DH,0AH,'The carry bit : $'

   ILLEGAL   DB  0DH,0AH,'Enter the inputs and try again:$' 
   ILLEGAL2   DB  0DH,0AH,'Enter binary digit and try again:$'

   
 .CODE
   MAIN PROC
     MOV AX, @DATA                 
     MOV DS, AX

     JMP START_2                 

     START_1:                     
       LEA DX, ILLEGAL            
       MOV AH, 9
       INT 21H

     START_2:                    
       XOR BX, BX                 

       LEA DX, PROMPT_1            
       MOV AH, 9
       INT 21H

       MOV CX, 8                   
                        

       LOOP_1: 
         MOV AH, 1                 
         INT 21H                  

         CMP AL, 0DH            
         JNE SKIP_1             
         
         CMP CX, 8               
         JE START_1             
         JMP EXIT_LOOP_1        

         SKIP_1:               
           AND AL, 0FH          
           SHL BL, 1              
           OR BL, AL             
       LOOP LOOP_1              

       EXIT_LOOP_1:            

       LEA DX, PROMPT_2          
       MOV AH, 9
       INT 21H

       MOV CX, 8                
       MOV AH, 1                

       LOOP_2:                  
         INT 21H                 

         CMP AL, 0DH            
         JNE SKIP_2             

         CMP CX, 8                
         JE START_2            
         JMP EXIT_LOOP_2        

         SKIP_2:                
           AND AL, 0FH           
           SHL BH, 1              
           OR BH, AL           
       LOOP LOOP_2               

       EXIT_LOOP_2:             

       LEA DX, PROMPT_4            
       MOV AH, 9
       INT 21H

       ADD BL, BH                 
       JNC carry0               
         MOV AH, 2                
         MOV DL, 31H
         INT 21H  
         
         JMP SKIP
         
       
       carry0:  
       MOV AH, 2                   
       MOV DL, 30H
       INT 21H

       SKIP:                   
      
       
       LEA DX, PROMPT_3        
       MOV AH, 9
       INT 21H 
       
       MOV CX, 8                
       MOV AH, 2                 

       LOOP_3:                    
         SHL BL, 1                
         JC ONE                  
         MOV DL, 30H              
         JMP DISPLAY             
               
         ONE:                    
           MOV DL, 31H          

         DISPLAY:                
           INT 21H            
       LOOP LOOP_3               

     MOV AH, 4CH                 
     INT 21H
   MAIN ENDP
 END MAIN


