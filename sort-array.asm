

;10.Write a program to sort an array of N elements 

 
 .MODEL SMALL 
  .STACK 100H
  .DATA 4.
   MSG1 DB 'enter elements: $' 
   
    MSG2 DB 'AFTER SORTING: $'
      ARR DB 100 dup (0)  
      .CODE 
       MAIN PROC  
         MOV AX,@DATA
         MOV DS,AX
            MOV AH,9 
          lea DX,MSG1 ;DISPLAY MSG1 13.
           INT 21H ;Code
 XOR CX, CX ;clear CX 15
MOV AH,1 
INT 21H ;first input 17.
XOR SI,SI 
WHILE_: 
CMP AL, 0dH ;compare input with CR 20.
 JE END_WHILE 
  MOV ARR[SI],AL ;move input into array 22. 
 INC SI ;SI+1 23. 
 INC CX 
  MOV AH,2 
   MOV DL,' ' ;display space 26. 
   INT 21h  
   MOV AH,1  
    INT 21H 
    JMP WHILE_

END_WHILE: . 
MOV AH,2 
 MOV DL,0DH  
 INT 21H  
  MOV DL,0AH 
  INT 21H  
   JCXZ EXIT 
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
 
  MOV AH,4CH ;54. 
 INT 21H   ; 55.
  MAIN ENDP
 BUBBLE_SORT PROC 2. ; this procedure will sort the array in ascending order 3. 
    ; input : SI=offset address of the array 4. ; : BX=array size 5. 
    ; output : Sorted Array 6. 
    PUSH AX ; push AX onto the STACK 7. 
    PUSH BX ; push BX onto the STACK 8. 
    PUSH CX ; push CX onto the STACK 9. 
    PUSH DX ; push DX onto the STACK 10.
     PUSH DI ; push DI onto the STACK 11.
      MOV AX, SI ; set AX=SI 12.
       MOV CX, BX ; set        CX=BX  
    DEC CX ; set CX=CX-1
 @OUTER_LOOP: ; loop label 15. 
 MOV BX, CX ; set BX=CX 16.
 MOV SI, AX ; set SI=AX 17.
  MOV DI, AX ; set DI=AX 18. 
  INC DI ; set DI=DI+1 19.
  @INNER_LOOP: ; loop label 20. 
  MOV DL, [SI] ; set DL=[SI] 21.
   CMP DL, [DI] ; compare DL with [DI] 22.
    JNG @SKIP_EXCHANGE ; jump to label @SKIP_EXCHANGE if DL<[DI] 23. 
    XCHG DL, [DI] ; set DL=[DI], [DI]=DL 24. 
    MOV [SI], DL ; set [SI]=DL 25.
     @SKIP_EXCHANGE: ; jump label 26. 
     INC SI ; set SI=SI+1 27. 
     INC DI ; set DI=DI+1 28. 
     DEC BX ; set BX=BX-1 29. 
     JNZ @INNER_LOOP ; jump @INNER_LOOP if BX!=0 30. 
     LOOP @OUTER_LOOP ; jump @OUTER_LOOP while
 POP DI ; pop a value from STACK into DI 32.
 POP DX ; pop a value from STACK into DX 33.
  POP CX ; pop a value from STACK into CX 34.
   POP BX ; pop a value from STACK into BX 35. 
   POP AX ; pop a value from STACK into AX 36.
   RET ; return control to the calling procedure 37.
    BUBBLE_SORT ENDP 
 
 END MAIN

Output












