TITLE Homework #6

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO dwExitCode : DWORD

.data
num1 WORD 3h
num2 WORD 4h

.code

main PROC

	call AddTwo
	INVOKE ExitProcess, 0

AddTwo PROC

	mov bx, num1
	mov cx, num2
	add cx, bx
	mov ax, cx
	ret

AddTwo ENDP

main ENDP
END
