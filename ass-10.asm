;10.Write a program to sort an array of N elements 

 
.MODEL SMALL 
.STACK 100H
.DATA 

  MSG1 DB 'Enter elements: $' 
   
  MSG2 DB 'After sorting : $'
  ARR DB 100 dup (?)  
.CODE 
  MAIN PROC
      
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9 
    lea DX,MSG1      
    INT 21H   
    
    XOR CX, CX        
    
    MOV AH,1 
    INT 21H           
    XOR SI,SI 
    
    WHILE_: 
    CMP AL, 0dH  
    JE END_WHILE 
    MOV ARR[SI],AL  
    INC SI          
    INC CX     
    
    MOV AH,2 
    MOV DL,' ' 
    INT 21h        
    
    MOV AH,1  
    INT 21H 
    JMP WHILE_

    END_WHILE: 
    MOV AH,2 
    MOV DL,0DH  
    INT 21H  
    MOV DL,0AH 
    INT 21H  
    
    
    LEA SI,ARR  
    MOV BX,CX   
    CALL BUBBLE_SORT
 
    MOV AH,9  
    LEA DX,MSG2  
    INT 21H  
    XOR SI,SI 
     
    TOP:  
    MOV AH,2
    MOV DL,ARR[SI] 
    INT 21H 
    MOV DL,' ' 
    INT 21H 
    INC SI
    LOOP TOP 
     
    EXIT: 
    MOV AH,4CH  
    INT 21H    
  MAIN ENDP 
  
 BUBBLE_SORT PROC
    
     
  
    PUSH AX  
    PUSH BX  
    PUSH CX  
    PUSH DX  
    PUSH DI  
    MOV AX, SI 
    MOV CX, BX  
    DEC CX 
    
     @OUTER_LOOP:       
     MOV BX, CX     
     MOV SI, AX     
     MOV DI, AX     
     INC DI         
     
     @INNER_LOOP:   
     MOV DL, [SI]      
     CMP DL, [DI]      
     JNG @SKIP_EXCHANGE   
     XCHG DL, [DI]   
     MOV [SI], DL  
    
     @SKIP_EXCHANGE:  
     INC SI   
     INC DI 
     DEC BX  
     JNZ @INNER_LOOP  
     LOOP @OUTER_LOOP  
     
     
     POP DI  
     POP DX  
     POP CX 
     POP BX  
     POP AX  
     RET  
    BUBBLE_SORT ENDP 
 
 END MAIN
