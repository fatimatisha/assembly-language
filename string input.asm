.MODEL SMALL
.STACK 100H
.DATA  
    STRING DB 100 DUP(?)
    MSG1 DB "ENTER A STRING: $"
    MSG2 DB 0DH, 0AH, "THE STRING : $"
    VOWELS DW 0     
.CODE
MAIN PROC
    
     MOV AX, @DATA
     MOV DS, AX
     MOV ES, AX
     
     MOV AH, 9
     LEA DX, MSG1
     INT 21H
     
     LEA SI, STRING 
     
     MOV CX,20
     
     READ:
     MOV AH, 1
     INT 21H
     CMP AL, 0DH
     JE ENDOFSTRING
     MOV [SI],AL  
     
     ADD SI,1  
     
     LOOP READ:
      
     
     ENDOFSTRING:
     MOV AL, "$"
     
     
     XOR BX, BX
     
     LEA SI,STRING
     MOV CX,20
     
     LEA DX,MSG2
     MOV AH,9
     INT 21H
     
     L3:
     MOV DL,[SI]
     MOV AH,2
     INT 21H
     ADD SI,1
     
      LOOP L3 
      
      
        
         
     EXIT:
     
     
     
     MOV AH,4CH
  
     INT 21H
     
    MAIN ENDP
END MAIN