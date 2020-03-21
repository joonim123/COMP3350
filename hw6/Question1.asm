TITLE Homework #6

INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO dwExitCode : DWORD

.data
num1 WORD 3h
num2 WORD 4h

.code
main PROC
mov	bx, num1
mov	cx, num2
add bx, cx
mov ax, bx

INVOKE ExitProcess, 0
main ENDP
END