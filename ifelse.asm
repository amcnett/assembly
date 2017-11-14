; This program demonstration creating labels (pass and print below) needed to
; implement if/else logic. It also demonstrates jumps and comparisons.

section .data	; section to define and intialize data
	msg1 db 'pass', 0xA, 0
	msg2 db 'fail', 0xA, 0

global _start ; directive will tell where to start running code (for linker)

_start: 	; entry point

	mov edx, 70
	mov ecx, 65
	cmp ecx, edx	;compare these two registers
	jge pass	;jump to pass if ecx is greater than or equal to edx
	mov ecx, msg2	;message to print if failing
	jmp print	;jump to mesage print and skip over pass section
pass:
	mov ecx, msg1	;message to print if passing, will continue to next section
print:
	mov edx, 5	;length of output
	mov ebx, 1	;standout out
	mov eax, 4	;sys call number for sys_write
	int 0x80

	mov eax, 1	;sys call for exit
	int 0x80

