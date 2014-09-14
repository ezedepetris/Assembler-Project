%include "asm_io.inc"
segment .data
	count dd 0
	message dd "",10,0

segment .text
	extern printf
	global clear


clear:
	enter 0,0
	; DO A CLEAR SCREEN
	doLoop:
		push message
		call printf
		add esp, 4
		cmp dword[count], 3200d
		je endDo
		inc dword[count]
		jmp doLoop
	endDo:
	
	leave
	ret