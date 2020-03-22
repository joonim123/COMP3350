TITLE Homework #6

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO dwExitCode : DWORD

.data
PromptUser BYTE "Please enter a value: ", 0
num WORD 5 DUP (?)						; Declare 5 uninitialized values

.code
main PROC
	mov esi, 0							; Initialize counter

	pushLoop:
		mov edx, OFFSET PromptUser
		call WriteString				; Display 'PromptUser'
		call ReadInt					; Listen for user input
		push eax						; Feed user input into stack
		inc esi							; Increment counter
		cmp esi, 5						; Check if all 5 elements are initialized
		jl pushLoop						; If there is an element still unitialized, loop 

	mov esi, 0							; Initialize counter

	popLoop:
		pop eax							; Fetches value from the top of the stack
		call WriteInt					; Displays the value
		call CrLf						; Adds a new line
		inc esi							; Increment counter
		cmp esi, 5						; Check if all 5 elements are initialized
		jl popLoop						; If there is an element still unitialized, loop
		

	INVOKE ExitProcess, 0
main ENDP
END

