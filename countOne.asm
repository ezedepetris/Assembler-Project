%include "asm_io.inc"
segment .text
	global countOne

countOne:
	push ebp 								; save the value the original ebp in the stack
	mov ebp, esp						; new EBP = ESP
	sub esp, 4							; reserve a local variable
	mov dword[ebp - 4], 0		;	initialize whit 0, cause is a counter between 0  32

shiftBin:
 	SHR dword[ebp + 12], 1 	; string number from the stack
 	JC addCount
midShiftBin:
 	cmp dword[ebp - 4], 32	; compare the counter [ebp - 4] whit 32
 	je endAddCount
 	inc dword[ebp - 4]
 	;inc dword [count]
 	jmp shiftBin
endShiftBin:

addCount:
 	add dword[ebp + 8], 1 	; counter from the stack (is counter in equalBinList)
 	jmp midShiftBin
endAddCount:
 		
 	mov esp, ebp 						;
	pop ebp      						; restore the original values of ebp
  ret