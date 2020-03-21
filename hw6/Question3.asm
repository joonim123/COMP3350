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

	Input:
		mov edx, OFFSET PromptUser
		call WriteString
		call ReadInt
		push ax
		inc esi
		cmp esi, 5
		jl Input

	Search:
		mov edx, OFFSET prompt
		call CrLf
		call WriteString
		call ReadInt
		push ax
		pop value
		mov index, 0
		mov bx, 5

		ScanLoop:
			inc index
			pop ax
			cmp ax, value
			je Output
			jne Check

			Check:
				cmp index, 5
				jle ScanLoop
				jg Exception

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


