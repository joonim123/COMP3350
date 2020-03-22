# Question 1:
Write a main program which sets the registers BX and CX and calls a procedure Add-Two.  The procedure Add-Two adds the values in registers BX and CX and returns the output (which is the sum) in AX. Single step through the program, displaying the value of the stack pointer so that you understand how the call and return are implemented.  
# Question 2:
Write a program that:

1)	Prompts the user for integer input 5 times
2)	Stores these inputs in a stack using the Push instruction 
3)	After the storing is complete in the Step 2, pop the stored values and display them on the screen using WriteInt (not DumpRegs).
# Question 3:
Write a procedure, Search which searches the stack for the value that you provide in register AX and returns its index, assuming the first value is stored in index 0.   Write a main program that fills the stack with positive values, sets AX and calls Search and prints the index at which the value was found.

For example, if the inputs are:  5, 6, 1, 10, 44, 79
and AX is set in the main to be 1, then the expected output of your code is:

The target value is 1, and is located at index:2
In cases where more than one element has the same value, you only have to output one of them. If the value is not found, print -1.
	
Use the following:

.data
prompt  	BYTE "Please input a value: ", 0
spacing 	BYTE ", ",0; 
String2	BYTE "The target value is,” 0
String2	BYTE “and is located at index: ",0
