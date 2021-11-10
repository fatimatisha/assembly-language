;10.	Write a program to sort an array of N elements  

.MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  'The contents of the array before sorting : $'
    PROMPT_2  DB  0DH,0AH,'The contents of the array after sorting : $'

    ARRAY   DB  5,3,9,0,2,6,1,7,8,4   

 .CODE
   MAIN PROC
     MOV AX, @DATA               
     MOV DS, AX

     MOV BX, 10                  

     LEA DX, PROMPT_1            
     MOV AH, 9
     INT 21H

     LEA SI, ARRAY                

     CALL PRINT_ARRAY         

     LEA SI, ARRAY                

     CALL BUBBLE_SORT          

     LEA DX, PROMPT_2            
     MOV AH, 9
     INT 21H

     LEA SI, ARRAY                

     CALL PRINT_ARRAY            

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP




 PRINT_ARRAY PROC

   PUSH AX                        ; push AX onto the STACK   
   PUSH CX                        ; push CX onto the STACK
   PUSH DX                        ; push DX onto the STACK

   MOV CX, BX                     ; set CX=BX

   @PRINT_ARRAY:                  ; loop label
     XOR AH, AH                   ; clear AH
     MOV AL, [SI]                 ; set AL=[SI]

     CALL OUTDEC                  ; call the procedure OUTDEC

     MOV AH, 2                    ; set output function
     MOV DL, 20H                  ; set DL=20H
     INT 21H                      ; print a character

     INC SI                       ; set SI=SI+1
   LOOP @PRINT_ARRAY              ; jump to label @PRINT_ARRAY while CX!=0

   POP DX                         ; pop a value from STACK into DX
   POP CX                         ; pop a value from STACK into CX
   POP AX                         ; pop a value from STACK into AX

   RET                            ; return control to the calling procedure
 PRINT_ARRAY ENDP




 BUBBLE_SORT PROC

   PUSH AX                        ; push AX onto the STACK  
   PUSH BX                        ; push BX onto the STACK
   PUSH CX                        ; push CX onto the STACK
   PUSH DX                        ; push DX onto the STACK
   PUSH DI                        ; push DI onto the STACK

   MOV AX, SI                     ; set AX=SI
   MOV CX, BX                     ; set CX=BX
   DEC CX                         ; set CX=CX-1

   @OUTER_LOOP:                   ; loop label
     MOV BX, CX                   ; set BX=CX

     MOV SI, AX                   ; set SI=AX
     MOV DI, AX                   ; set DI=AX
     INC DI                       ; set DI=DI+1

     @INNER_LOOP:                 ; loop label 
       MOV DL, [SI]               ; set DL=[SI]

       CMP DL, [DI]               ; compare DL with [DI]
       JNG @SKIP_EXCHANGE         ; jump to label @SKIP_EXCHANGE if DL<[DI]

       XCHG DL, [DI]              ; set DL=[DI], [DI]=DL
       MOV [SI], DL               ; set [SI]=DL

       @SKIP_EXCHANGE:            ; jump label
       INC SI                     ; set SI=SI+1
       INC DI                     ; set DI=DI+1

       DEC BX                     ; set BX=BX-1
     JNZ @INNER_LOOP              ; jump to label @INNER_LOOP if BX!=0
   LOOP @OUTER_LOOP               ; jump to label @OUTER_LOOP while CX!=0

   POP DI                         ; pop a value from STACK into DI
   POP DX                         ; pop a value from STACK into DX
   POP CX                         ; pop a value from STACK into CX
   POP BX                         ; pop a value from STACK into BX
   POP AX                         ; pop a value from STACK into AX

   RET                          
 BUBBLE_SORT ENDP




 OUTDEC PROC
   PUSH BX                     
   PUSH CX                       
   PUSH DX                      

   XOR CX, CX                  
   MOV BX, 10                   

   @OUTPUT:              
     XOR DX, DX                
     DIV BX                      
     PUSH DX                   
     INC CX                      
     OR AX, AX                   
   JNE @OUTPUT                   

   MOV AH, 2                    

   @DISPLAY:                      
     POP DX                       
     OR DL, 30H                
     INT 21H                     
   LOOP @DISPLAY                

   POP DX                       
   POP CX                         
   POP BX                      

   RET                            
 OUTDEC ENDP





 END MAIN