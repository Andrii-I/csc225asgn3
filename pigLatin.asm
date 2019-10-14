# Andrii Ieroshenko, assignment 3
# List of vowels used: A, E, I, O, and U
# Program description?
# Registers:
#
# word = []
# print("English Word: ")
# for i in range(20):
#     word[i] = input()
#     if ord(word[i]) = 4
#         break
#
# 1.      Remove (do not print) the first letter of the word and put (print) it at the end of the word.
# 2.      Add "ay" to the word.
# 
# newline char is 10 / 0xa

.text
main:
    li a7, 4 # 
    la a0, InputMsg
    ecall



#
# load readchar opcode into a7 before calling ecall (always a7 for opcode), input value will be in a0
#
readchar:
    li a7, 12 
    ecall
    
printword:
    

# enter key/EOT value = x04

# create a label that would point to space reserved for 20 chars (20 bits total, 1 bit/8 byte per char)
.data 
chars: .space 20
InputMsg: .string "English Word: "
