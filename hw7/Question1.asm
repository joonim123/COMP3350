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
index1 DWORD 0
index2 DWORD 0
value DWORD ?
pass DWORD ?


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
		inc index1
		pop value
		mov eax, value
        xor edx, edx
        mov ebx, eax
        mov ecx, 2
        div ecx 
		.IF edx == 1
			mov ebx, index1
			mov index2, ebx
			mov pass, 1
			jmp Check
		.ELSE
			jmp Check
		.ENDIF

		Check:                          ; Checks if all 5 elements in array has been checked
			cmp index1, 4
			jle Search
			jg Path
	
	Path:
		cmp pass, 0
		je Output2
		jne Output1

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
		sub eax, index2
        mov edx, OFFSET index2      ; index
        call WriteInt
        INVOKE ExitProcess, 0

    Output2:
        mov edx, OFFSET Output2Str ; "No odd integer found."
        call WriteString

	INVOKE ExitProcess, 0
main ENDP
END

