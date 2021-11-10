;8.	Write a program to count the number of vowels and consonants in a string.

.MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  "Enter a string : $"
   PROMPT_2  DB  0DH,0AH,"Number of Vowels = $"
   PROMPT_3  DB  0DH,0AH,"Number of Consonants = $"

   STRING        DB  50 DUP (?)   
   C_VOWELS      DB  "AEIOU"
   S_VOWELS      DB  "aeiou"
   C_CONSONANTS  DB  "BCDFGHJKLMNPQRSTVWXYZ"
   S_CONSONANTS  DB  "bcdfghjklmnpqrstvwxyz"

 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX
     MOV ES, AX

     LEA DX, PROMPT_1            
     MOV AH, 9
     INT 21H

     LEA DI, STRING            

     CALL READ_STR               

     XOR DX, DX                  
     LEA SI, STRING                


     COUNT:                    
       LODSB                      

       LEA DI, C_VOWELS           
       MOV CX, 5                  

       REPNE SCASB               
       JE INCREMENT_VOWELS       
                                   

       LEA DI, S_VOWELS           
       MOV CX, 5                  

       REPNE SCASB               
       JE INCREMENT_VOWELS      
                                 

       LEA DI, C_CONSONANTS       
       MOV CX, 21                

       REPNE SCASB                 
       JE INCREMENT_CONSONANTS  
                                  

       LEA DI, S_CONSONANTS        
       MOV CX, 21                

       REPNE SCASB                
       JE INCREMENT_CONSONANTS  
                                  

       JMP NEXT                 

       INCREMENT_VOWELS:        
         INC DL                    
         JMP NEXT               

       INCREMENT_CONSONANTS:     
         INC DH                  

       NEXT:                     
         DEC BX                  
         JNE COUNT             
    
     EXIT:                     

     MOV CX, DX                 

     LEA DX, PROMPT_2             
     MOV AH, 9                     
     INT 21H                       

     XOR AX, AX                   
     MOV AL, CL                   

     CALL OUTDEC                 

     LEA DX, PROMPT_3             
     MOV AH, 9
     INT 21H

     XOR AX, AX                  
     MOV AL, CH                   

     CALL OUTDEC                  

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP



 

  READ_STR PROC

    PUSH AX                        
    PUSH DI                      

    CLD                          
    XOR BX, BX                     

    INPUT_LOOP:                 
      MOV AH, 1                    
      INT 21H                     

      CMP AL, 0DH                
      JE END_INPUT               
      
      STOSB                       
      INC BX                      
      JMP INPUT_LOOP             

 

    END_INPUT:                   

        POP DI                       
        POP AX                        
    
    RET
  READ_STR ENDP


 

 OUTDEC PROC
 
   PUSH BX                        
   PUSH CX                        
   PUSH DX                        

 
   START:                        

   XOR CX, CX                     
   MOV BX, 10                     

   OUTPUT:                        
     XOR DX, DX                   
     DIV BX                      
     PUSH DX                      
     INC CX                       
     OR AX, AX                    
   JNE OUTPUT                   

   MOV AH, 2                      

  DISPLAY:                      
     POP DX                      
     OR DL, 30H                 
     INT 21H                      
   LOOP DISPLAY                  

   POP DX                        
   POP CX                        
   POP BX                         

   RET                            
 OUTDEC ENDP


 END MAIN