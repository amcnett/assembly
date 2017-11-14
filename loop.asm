; simple loop demonstration 
; equates to
; while (x < = 20){x++; print *} 

section .data	; section to define and intialize data
	num dw 0	; remember that a word (w) is two bytes -- CMP requires minimum of 2 bytes
	star db "*", 0
	limit dw 20

global _start ; directive will tell where to start running code (for linker)

_start: 
	mov cx, [num]
	cmp cx, [limit] 	; compare to 20 
	jg end			; jump to end if num is greater than 20

beginning:
	push cx	; push onto stack -- we need ecx for system call

	;print
	mov edx, 1	; length of output
	mov ecx, star
	mov ebx, 1	; standout out
	mov eax, 4	; sys call number for sys_write
	int 0x80
	
	pop cx		; get back value on stack and put back in ecx to proceed
	inc cx
	cmp cx, [limit]
	jle beginning	; loop again by going back to the beginning

end:
	mov eax, 1	; sys call for exit
	int 0x80
