TITLE Homework #7

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO dwExitCode : DWORD

.data
nameStr BYTE "Joo Oh", 0
studentId = 54

.code
cipher PROC
	mov ecx, SIZEOF nameStr
	xor esi, esi

	xorLoop: XOR nameStr[esi], studentId
	inc esi
	loop xorLoop

	ret
cipher ENDP

main PROC
	mov edx, OFFSET nameStr
	call WriteString
	call crlf
	call cipher 

	mov edx, OFFSET nameStr
	call WriteString
	call crlf
	call cipher 

	mov edx, OFFSET nameStr
	call WriteString
	call crlf

	INVOKE ExitProcess, 0

main ENDP

END