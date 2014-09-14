%include "asm_io.inc"

segment .data
	equalNumbers db "*** STRINGS HAVE THE SAME AMOUNT OF 1 ***",10,0
	noEqualNumbers db "*** STRING NOT HAVE THE SAME AMOUNT OF 1 ***",10,0
	inFirstNumber db "ENTER THE STRING Nro 1",10,0
	inSecondNumber db "ENTER THE STRING Nro 2",10,0
	formatNumber db "%d",0
	counter dd 0
	numberOne dd 0
	numberTwo dd 0

segment .text
  extern clear					;clear screen
 	extern countOne				;count the one of number
	extern scanf, printf	;input and output
  global asm_main

asm_main:
	;-------BOOT ROUTINE-------
	enter 0,0

	;-------CODE OF PROGRAM-------
	call clear
	
	; begins loading data
	; load the first number
	push inFirstNumber
	call printf
	add esp, 4
	push numberOne
	push formatNumber
	call scanf
	add esp, 8
	; load the second number
	push inSecondNumber
	call printf
	add esp, 4
	push numberTwo
	push formatNumber
	call scanf
	add esp, 8 
	; loading data ends
	
	; count ones of first number	
	push dword[numberOne]
	push dword[counter]
	call countOne
	mov eax, 0
	pop dword eax 							; the counter is in esp, then assign eax = esp and (esp = esp + 4)
	add esp, 4
	add esp, 4
	mov dword[counter], 0
 
	; count ones of second number
	push dword[numberTwo]
	push dword[counter]
	call countOne
	mov ebx, 0
	pop dword ebx 							; the counter is in esp, then assign ebx = esp and (esp = esp + 4)
	add esp, 4
	
	; compare the counts (eax, ebx) --counter1, counter2
	cmp eax, ebx
	je equalOnes
	jmp endEqualOnes

	; if the number contain the same numbers of one, returns the string equalNumbers
equalOnes:
	push equalNumbers
	call printf
	add esp, 4
	jmp endNoEqualOnes
endEqualOnes:
	
	;	else returns the string noEqualNumbers
	push noEqualNumbers
	call printf
	add esp, 4
endNoEqualOnes:

;-------FINISH ROUTINE-------
	mov eax,0
	leave
	ret