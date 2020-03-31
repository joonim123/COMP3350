TITLE Homework #7

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO dwExitCode : DWORD

.data
PromptUser BYTE "Please enter a value: ", 0
Output1Str1 BYTE "Odd integer found.", 0
Output1Str2 BYTE "Value: ", 0
Output1Str3 BYTE "Index: ", 0
Output2Str BYTE "No odd integer found.", 0
num WORD 5 DUP (?)						; Declare 5 uninitialized values
index DWORD 0
value DWORD ?


.code
main PROC
	mov esi, 0							; Initialize counter

	Input:
		mov edx, OFFSET PromptUser
		call WriteString				; Display 'PromptUser'
		call ReadInt					; Listen for user input
		push eax						; Feed user input into stack
		inc esi							; Increment counter
		cmp esi, 5						; Check if all 5 elements are initialized
		jl Input						; If there is an element still unitialized, loop 

	mov esi, 0							; Initialize counter

	Search:
		inc index
		pop value
		mov eax, value
        xor edx, edx
        mov ebx, eax
        mov ecx, 2
        div ecx 
		cmp edx, 1
		je Output1
		jne Check

		Check:                          ; Checks if all 5 elements in array has been checked
			cmp index, 5
			jle Search
			jg Output2

	Output1:
        mov edx, OFFSET Output1Str1 ; "Odd integer found."
        call WriteString
        call CrLf                   ; \n

        mov edx, OFFSET Output1Str2 ; "Value: "
        call WriteString
		mov eax, value
		call WriteInt
        call CrLf                   ; \n

        mov edx, OFFSET Output1Str3 ; "Index: "
        call WriteString
		mov eax, 5
		sub eax, index
        mov edx, OFFSET index       ; index
        call WriteInt
        INVOKE ExitProcess, 0

    Output2:
        mov edx, OFFSET Output2Str ; "No odd integer found."
        call WriteString

	INVOKE ExitProcess, 0
main ENDP
END

