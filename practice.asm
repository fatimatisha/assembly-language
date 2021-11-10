;6.	Write a program to add two hexadecimal numbers.     

 .model small                                                         
 .data  
 a db 0AH  
 b db 0BH  
 .code  
      mov      ax, @data      ; Initialize data section  
      mov      ds, ax  
      mov      al, a          ; Load number1 in ax  
      mov      bl, b          ; Load number2 in bx  
      add      al, bl         ; add numbers. Result in ax  
      mov      ch, 02h        ; Count of digits to be displayed  
      mov      cl, 04h        ; Count to roll by 4 bits  
      mov      bl, al         ; Result in reg bh 
      
       
addhexa:     
      rol      bl, cl      ; roll bl so that msb comes to lsb   
      mov      dl, bl         ; load dl with data to be displayed  
      and      dl, 0fH        ; get only lsb  
      cmp      dl, 09         ; check if digit is 0-9 or letter A-F  
      jbe      digit  
      add      dl, 07         ; if letter add 37H else only add 30H  
      
 digit:    
      add      dl, 30H  
      mov      ah, 02         ; Function 2 under INT 21H (Display character)  
      int      21H  
      dec      ch             ; Decrement Count  
      jnz      addhexa  
      mov      ah, 4cH        ; Terminate Program  
      int      21H  
 end  










