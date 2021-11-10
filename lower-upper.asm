 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  "Enter the the letter : $"
    PROMPT_2  DB 0Dh,0Ah, "Converted Letter is : $"

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and print PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; read a letter
     INT 21H

     MOV BL, AL                   ; save the letter in BL 
         
     
      cmp BL,60h
     jle L1
     
        
     cmp BL,60h
     jg L2
      
    
     L1:
   
     MOV AH, 2                    ; return carriage 
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  ; line feed
     INT 21H
     LEA DX, PROMPT_2             ; load and print PROMPT_2
     MOV AH, 9
     INT 21H

     OR BL, 20H                   ; convert a upper case letter to lower
                                  ; case letter

     MOV AH, 2                    ; print the Lower case letter
     MOV DL, BL
     INT 21H 
      
     ;add al,20h
    ; mov dl,al
    
     ;mov ah, 2
     ;int 21h 
    
     jmp L3   
     
     
     L2:
     MOV AH, 2                    ; return carriage 
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  ; line feed
     INT 21H

     LEA DX, PROMPT_2             ; load and print PROMPT_2
     MOV AH, 9
     INT 21H

     SUB BL, 20H                  ; convert a lower case letter to upper case letter

     MOV AH, 2                    ; print the Upper case letter
     MOV DL, BL
     INT 21H   
     
     L3:

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP 
 END MAIN
 
 