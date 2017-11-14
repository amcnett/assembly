; this number takes two digits from the user and adds them together
; it only works for values 0-9 and the result cannot exceed 9

SYS_EXIT  equ 1		; these are your constants
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .data 		; this is where you declare and init data

   msg1 db "Enter a digit ", 0xA, 0 	; adds a newline at the end of the string, is also zero delimated
   len1 equ $- msg1 	; gets the length by subtracing the current location from the location of msg

   msg2 db "Please enter a second digit", 0xA,0
   len2 equ $- msg2 

   msg3 db "The sum is: "
   len3 equ $- msg3

   newline db 0xA, 0	; just a newline sequence for printing at the end
   len4 equ $- newline

segment .bss		; this is where you only declare data (no init)

   num1 resb 2 		; to hold first number entered and carriage return
   num2 resb 2 		; to hold second number entered and carriage return
   res resb 1    	; to hold the result and a newline

section	.text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point
   mov eax, SYS_WRITE     ; do first prompt    
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                

   mov eax, SYS_READ 	; get first number (remember that this is in ascii)
   mov ebx, STDIN  
   mov ecx, num1 
   mov edx, 2
   int 0x80           

   mov eax, SYS_WRITE	; do second prompt
   mov ebx, STDOUT         
   mov ecx, msg2          
   mov edx, len2         
   int 0x80

   mov eax, SYS_READ  	; get second number (remember that this is in ascii)
   mov ebx, STDIN  
   mov ecx, num2 
   mov edx, 2
   int 0x80        

   mov eax, SYS_WRITE   ; print last message without sum (answer)
   mov ebx, STDOUT         
   mov ecx, msg3          
   mov edx, len3         
   int 0x80

   ; moving the first number to eax register and second number to ebx
   ; and subtracting ascii '0' to convert it into a decimal number
	
   mov al, [num1]	; only bringing first byte in (the number and not the return)
   sub al, '0'
	
   mov bl, [num2]	; only brining the second byte in (the number and not the return)
   sub bl, '0'

   ; add eax and ebx
   add al, bl

   ; add '0' to to convert the sum from decimal to ASCII
   add al, '0'

   ; storing the sum in memory location res
   mov [res], al		; moves the answer(sum) into the result

   ; print the sum 
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, res         
   mov edx, 1        
   int 0x80

   ; print the sum 
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, newline         
   mov edx, 1        
   int 0x80

exit:    		; properly exit the program
   
   mov eax, SYS_EXIT   
   xor ebx, ebx 
   int 0x80
