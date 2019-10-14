#
# Program to count occurrences of a character in a file.
# Character to be input from the keyboard.
# tesult to be displayed on the monitor.
# Program only works if no more than 9 occurrences are found.
# 
#
# Initialization
#
.text
main:
	andi	t2, t2, 0	# t2 is counter, initially 0
#	lw	t3, ptr		# t3 is pointer to characters
	la	t3, datafile	# t3 is pointer to characters
	li	a7, 12		# put readchar op into a7 
	ecall			# a0 gets character input
	add	t0, a0, zero	

	lbu	t1, (t3) 	# t1 gets first character
#
# Test character for end of file
#
test:	addi	t4, t1, -4	# Test for EOT (ASCII x04)
	beq	t4, zero, output # If done, prepare the output

#
# Test character for match.  If a match, increment count.
#
	bne	t0, t1, getchar	# If no match, do not increment
	addi	t2, t2, 1
#
# Get next character from file.
#
getchar:
	addi	t3, t3, 1	# Point to next character.
	lbu	t1, (t3)	# t1 gets next char to test
	b	test
#
# Output the count.
#
output:	lw	t0, ascii	# Load the ASCII template,  why not use LI? magic#!!
	add	a0, t0, t2	# Covert binary count to ASCII
	li	a7, 11		# put printchar op into a7 
	ecall			# ASCII code in a0 is displayed
	# could replace previous 4 statements with PrintInt ecall
	
	la	a0, DoneMsg	# get start address of DoneMsg
	li	a7, 4		# put printstring op into a7 
	ecall			# ASCII code in a0 is displayed
	li	a7, 10		# put exit code into a7
	ecall			# Halt machine

#
# Storage for pointer and ASCII template
#
.data
ascii:		.word	0x30		#what is significant about x30?
DoneMsg:	.string "Done!"
#ptr:		.word	0x10011000	# pretend there is lot of text at this address



