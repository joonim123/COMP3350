TITLE Homework #6

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO dwExitCode : DWORD

.data
PromptUser BYTE "Please enter a value: ", 0
prompt BYTE "Please input a value: ", 0
spacing BYTE ", ", 0
String1 BYTE "The target value is ", 0
String2 BYTE "and is located at index: ", 0
NaN BYTE "-1", 0
value WORD ?
index WORD ?

.code
main PROC

	mov esi, 0

	Input:                                  ; User inputs 5 elements
		mov edx, OFFSET PromptUser
		call WriteString
		call ReadInt
		push ax
		inc esi
		cmp esi, 5
		jl Input

	Search:                                 ; User enters target value
		mov edx, OFFSET prompt
		call CrLf
		call WriteString
		call ReadInt
		push ax
		pop value
		mov index, 0
		mov bx, 5

		ScanLoop:                           ; Loop to compare target value to elements
			inc index
			pop ax
			cmp ax, value
			je Output                       ; If match, display the output strings
			jne Check                       ; If no match, jump to Check

			Check:
				cmp index, 5                ; Compare the incremented index to the maximum number of elements(5)
				jle ScanLoop                ; If less than or equal to 5 (there are still elements that needs to be checked), jump to ScanLoop
				jg Exception                ; If greater than 5(value does not exist in elements), display "-1"

		Output:
			mov edx, OFFSET String1
			call WriteString
			mov edx, OFFSET value
			call WriteInt
			mov edx, OFFSET spacing
			call WriteString
			mov edx, OFFSET String2
			call WriteString
			mov ax, 5
			sub ax, index
			push ax
			pop index
			call WriteInt
			INVOKE ExitProcess, 0

		Exception:
			mov edx, OFFSET NaN
			call WriteString

	INVOKE ExitProcess, 0

main ENDP
END

