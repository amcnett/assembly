; Gets characters from a string one at a time
; Prints each character

section .data	; section to define and intialize data
	msg db "hi", 0

section .bss
	letter resb 1

section .text

global _start ; directive will tell where to start running code (for linker)

_start: 
	mov eax, msg		; store address of msg in eax
	
	mov bl, byte[eax]	; move byte pointed to at eax into bl (gets one character)
	mov [letter], bl	; move character to letter

	push eax		; store this on the stack

	;print
	mov edx, 1	; length of output
	mov ecx, letter
	mov ebx, 1	; standout out
	mov eax, 4	; sys call number for sys_write
	int 0x80

	pop eax			; get this back off the stack

	inc eax			; increment so that we can get the next letter
	mov bl, byte[eax]	; move byte pointed to at eax into bl (gets one character)
	mov [letter], bl	; move character to letter	

	;print
	mov edx, 1	; length of output
	mov ecx, letter
	mov ebx, 1	; standout out
	mov eax, 4	; sys call number for sys_write
	int 0x80
	
	mov eax, 1	; sys call for exit
	int 0x80
