%include "asm_io.inc"

segment .text
	global equalBinList


countOne:
	push ebp      ; guarda el valor original de EBP en la pila
	mov ebp, esp ; nuevo EBP = ESP
	sub esp, 4
	;-------------


	shiftBin:
 	SHR [esp + 8], 1
 	JC addCount
 	midShiftBin:
 	cmp [esp - 4], 32 ; contador tiene que ser un registro parametro local
 	je endAddCount
 	inc [esp - 4]
 	jmp shiftBin
 	endShiftBin:

 	addCount:
 	add [esp + 4], 1 ; viene dado por la pila
 	jmp midShiftBin
 	endAddCount


 	;--------------
 	mov esp, ebp
	pop ebp      ; restaura el valor original de EBP
  ret