.globl  main

.macro exit
        li    a7,10
        ecall
.end_macro

.data
data: .word 10, 45, 0

.text
main:
        la    a0, data          	# address of data
        lw    a1, 4(a0)			# load the second integer from RAM in register a1 (b)
        lw    a0, 0(a0)			# load the first integer from RAM in register a0 (a)
        
gcd:
	jal   while_codition		# jump to the condition
while_loop:
	blt   a0, a1, else		# branch to "else" label if a < b
	sub   a0, a0, a1		# a = a - b
	jal   while_codition
	
else:
	sub   a1, a1, a0		# b = b - a
	
while_codition:
	bne   a0, a1 while_loop		# while(a != b), do the loob
	
	la    a1, data			# address of data
	sw    a0, 8(a1)			# store the final result in a0 to RAM (8 bytes offset)
        
        
        exit    
