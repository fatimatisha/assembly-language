;9.	Write a program to read a string and copy it into another string in reverse order.


 print macro m
mov ah,09h
mov dx,offset m
int 21h
endm

.model small


 .data

empty db 10,13, "   $"
str1 db 25,?,25 dup('$')
str2 db 25,?,25 dup('$')
mstring db 10,13, "Enter the string: $"
mstring2 db 10,13, "Enter second string: $"
mreverse db 10,13, "Reversed string: $"

 
.code

main proc
mov ax,@data
mov ds,ax

        print mstring
        call accept_string
        

        mov si,offset str1       
        mov di,offset str2      



        mov al,[si]         
        mov [di],al        
        inc si              
        inc di


        mov al,[si]
        mov [di],al
        inc si
        inc di

        mov cl,str1+1 ;       
       
         add si,cx            
        dec si           
        
move_more: 
           mov al,[si]        
           mov [di],al      
           dec si            
           inc di
           dec cl
           jnz move_more

        print mreverse
        print str2+2      
		print empty 
		   
		
        exit:
        mov ah,4ch        
        int 21h

       main endp






accept_string proc 

mov ah,0ah          ;accept string from user function
mov dx,offset str1  ; store the string in memory pointed by "DX"
int 21h
ret
accept_string endp
 

end main