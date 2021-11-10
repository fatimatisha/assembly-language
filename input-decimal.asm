 .MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  'Enter a Decimal number (-32767 to 32767) : $'
   PROMPT_2  DB  0DH,0AH,'The given Decimal number is : $'
   ILLEGAL   DB  0DH,0AH,'Illegal character. Try again : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA               
     MOV DS, AX

     LEA DX, PROMPT_1            
     
     MOV AH, 9
     INT 21H

     CALL DECIMAL_INPUT          

     LEA DX, PROMPT_2            
     MOV AH, 9 
     INT 21H

     CALL DECIMAL_OUTPUT        

     MOV AH, 4CH               
     INT 21H
   MAIN ENDP

 
 DECIMAL_INPUT PROC

   JMP @READ                     

   @ERROR:                     
   LEA DX, ILLEGAL              
   MOV AH, 9                        
   INT 21H

   @READ:                        
   XOR BX, BX                    
   XOR CX, CX                    

   MOV AH, 1                   
   INT 21H                       

   CMP AL, "-"                   
   JE @MINUS                      

   CMP AL, "+"                   
   JE @PLUS                      
   JMP @INPUT                   

   @MINUS:                       
   MOV CX, 1                     

   @PLUS:                       
   INT 21H                     
   CMP AL, 0DH                   
   JE @END                      

   @INPUT:                        
     CMP AL, 30H                  
     JL @ERROR                    

     CMP AL, 39H                  
     JG @ERROR                    

     AND AX, 000FH                

     PUSH AX                      

     MOV AX, 10                  
     MUL BX                
     MOV BX, AX              

     POP AX                      

     ADD BX, AX                   

     MOV AH, 1                   
     INT 21H                    

     CMP AL, 0DH             
     JNE @INPUT                  
                                   
   @END:                       

   OR CX, CX                     
   JE @EXIT                   
   NEG BX                      

   @EXIT:                        

   RET                           
 DECIMAL_INPUT ENDP

 
 DECIMAL_OUTPUT PROC

   CMP BX, 0                    
   JGE @START                     
   MOV AH, 2                   
   MOV DL, "-"                    
   INT 21H                

   NEG BX                       

   @START:                     

   MOV AX, BX                   
   XOR CX, CX                
   MOV BX, 10                   

   @REPEAT:                     
     XOR DX, DX                  
     DIV BX                       
     PUSH DX                
     INC CX                       
     OR AX, AX                   
   JNE @REPEAT                  

   MOV AH, 2                   

   @DISPLAY:                   
     POP DX                    
     OR DL, 30H                   
     INT 21H                     
   LOOP @DISPLAY                  

   RET                          
 DECIMAL_OUTPUT ENDP

 
 END MAIN