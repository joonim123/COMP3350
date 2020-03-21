; //Question2

TITLE Homework #6 (question2.asm)

INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO dwExitCode : DWORD

.data
; //PromptUser BYTE "Please enter a value:", 0
num BYTE "Test", 0
numLen = ($ - num) - 1

.code
main PROC

	mov ecx, numLen
	mov esi, 0

	PushLoop:
		movzx eax, num[esi]
		push eax
		inc esi
		loop PushLoop

	mov ecx, numLen
	mov esi, 0

	PopLoop:
		pop eax
		mov num[esi], al
		inc esi
		loop PopLoop

	INVOKE ExitProcess, 0
main ENDP
END

	
