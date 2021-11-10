;9.	Write a program to read a string and copy it into another string in reverse order.

.MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  0DH,0AH, 'STRING_1 : $ '
   PROMPT_2  DB  0DH,0AH, 'STRING_2 : $ '
   BEFORE    DB   ' * * * * *  Before Copying  * * * * *$ ' 
   AFTER     DB  0DH,0AH,0AH, ' * * * * *  After Copying  * * * * *$ '

   STRING_1  DB   ' Please visit : http://www.mts-home.cjb.net   '
   STRING_2  DB  45 DUP(?)

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS and ES
     MOV DS, AX
     MOV ES, AX

     MOV BX, 45                   ; set BX=45
     MOV AH, 9                    ; set string output function

     LEA DX, BEFORE               ; load and print the string BEFORE
     INT 21H

     LEA DX, PROMPT_1             ; load and print the string PROMPT_1
     INT 21H

     LEA SI, STRING_1             ; set SI=offset address of variable STRING_1

     CALL DISP_STR                ; call the procedure DISP_STR

     LEA DX, PROMPT_2             ; load and print the string PROMPT_2
     INT 21H

     LEA SI, STRING_2             ; set SI=offset address of variable STRING_2

     CALL DISP_STR                ; call the procedure DISP_STR

     LEA SI, STRING_1             ; set SI=offset address of variable STRING_1
     LEA DI, STRING_2             ; set DI=offset address of variable STRING_2

     CALL COPY_STR                ; call the procedure COPY_STR

     LEA DX, AFTER                ; load and print the string AFTER 
     INT 21H

     LEA DX, PROMPT_1             ; load and print the string PROMPT_1
     INT 21H

     LEA SI, STRING_1             ; set SI=offset address of variable STRING_1

     CALL DISP_STR                ; call the procedure DISP_STR

     LEA DX, PROMPT_2             ; load and print the string PROMPT_2
     INT 21H

     LEA SI, STRING_2             ; set SI=offset address of variable STRING_2

     CALL DISP_STR                ; call the procedure DISP_STR

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP



 ;-------------------------  Procedure Definitions  ------------------------;




 ;-------------------------------  COPY_STR  -------------------------------;


  COPY_STR PROC
    ; this procedure will copy the string2 into string1
    ; input : SI=offset address of the string1
    ;       : DI=offset address of the string2
    ;       : BX=number of characters in the string
    ; output : SI=offset address of the string1
    ;        : DI=offset address of the string2

    PUSH CX                       ; push CX onto the STACK
    PUSH SI                       ; push SI onto the STACK
    PUSH DI                       ; push DI onto the STACK

    CLD                           ; clear direction flag
    MOV CX, BX                    ; set CX=BX
    REP MOVSB                     ; set ES:[DI]=DS:[SI]

    POP DI                        ; pop a value from STACK into DI
    POP SI                        ; pop a value from STACK into SI
    POP CX                        ; pop a value from STACK into CX

    RET
  COPY_STR ENDP


 ;-------------------------------  DISP_STR  -------------------------------;


  DISP_STR PROC
    ; this procedure will display the given string 
    ; input : SI=offset address of the string
    ;       : BX=number of characters in the string
    ; output : none

    PUSH AX                       ; push AX onto the STACK
    PUSH BX                       ; push BX onto the STACK
    PUSH CX                       ; push CX onto the STACK
    PUSH DX                       ; push DX onto the STACK
    PUSH SI                       ; push SI onto the STACK

    CLD                           ; clear direction flag
    MOV CX, BX                    ; set CX=BX
    MOV AH, 2                     ; set output function

    JCXZ @SKIP_OUTPUT             ; jump to label @SKIP_OUTPUT if CX=0  

    @OUTPUT_LOOP:                 ; loop label
      LODSB                       ; set AL=DS:[SI]
      MOV DL, AL                  ; set DL=AL
      INT 21H                     ; print a character
    LOOP @OUTPUT_LOOP             ; jump to label @OUTPUT_LOOP while CX!=0

    @SKIP_OUTPUT:                 ; jump label 

    POP SI                        ; pop a value from STACK into SI
    POP DX                        ; pop a value from STACK into DX
    POP CX                        ; pop a value from STACK into CX
    POP BX                        ; pop a value from STACK into BX 
    POP AX                        ; pop a value from STACK into AX

    
    
    
    
    
    
    
    
    
    RET
  DISP_STR ENDP

 

 END MAIN


