# Andrii Ieroshenko, assignment 3
# List of vowels checked: a, e, i, o, and u
#  
# Only use t0-t6
# Registers used: t0: pointer to memory location where next character to save/load is located 
#                 t1: logistical use (to check if character is Enter key (0xa), if 1st letter is a vowel)
#                 t2: logistical use (2nd register used to check if 1st letter is a vowel)
#
# Program description/pseudocode:
# while True:
#     word = []
#     print("Please enter the word to be translated and press Enter: ")
#     while ord(word[i]) != 4
#         word[i] = input()
#         new_word = word
#
#         if ord(word[0]) == lowercase vowel:
#             new_word.append('way')
#         else:
#             new_word.append(word[0])
#             new_word.append('ay')
#             new_word.remove(0)
#  
#         print('English Word: ' + ''.join(word))
#         print('Pig-Latin Word: ' + ''.join(new_word))
#        
# newline char is 10 / 0xa

.text 

main:
# set character pointer t0 to the start of chars (memory space of 20 bit for input characters) 
    la t0, chars
        
# print input prompt message to the user
    li a7, 4 
    la a0, InputMsg
    ecall
    
# read input character from the user (input will be in a0)
readchar:
    li a7, 12 
    ecall   
# save input character into M[a1/character pointer], increment character pointer by 1
    sb a0, (t0)
    addi t0, t0, 1

# start word manipulation if input character is Enter key or read another input character from user
    addi t1, a0, -10
    beqz t1, manipulate
    b readchar

manipulate:
# check if 1st letter of the word is wovel (a/e/i/o/u), goto appending "way" if yes (vowel label)
    lbu t1, chars 
    addi t2, t1, -97
    beqz t2, vowel 
    addi t2, t1, -101
    beqz t2, vowel 
    addi t2, t1, -105
    beqz t2, vowel 
    addi t2, t1, -111
    beqz t2, vowel 
    addi t2, t1, -117
    beqz t2, vowel 

# else start printing from second character until <enter> key symbol is found, then print 1st character, new line, and goto end
#    la t0, chars
#nonvowel_loop:
#    addi t0, t0, 1
#    lbu a0, (t0)
#    addi t2, a0, -10
#    beqz t2, nonvowel_loop_end
#    li a7, 11 
#    ecall
#    b nonvowel_loop
#nonvowel_loop_end:
#    la a0, chars
#    li a7, 11 
#    ecall
#    li a7, 11 
#    li a0, 10
#    ecall
#    b end


vowel:
# print output msg1 ("English Word: ") to the user
    li a7, 4 
    la a0, OutputMsg1
    ecall
    
# print original word to the user
    la t0, chars
original_word:
    lbu t2, (t0)
    addi t2, t2, -10
    beqz t2, original_word_end

    li a7, 11
    lbu a0, (t0)
    addi t0, t0, 1 
    ecall
    b original_word
original_word_end:
    li a7, 11 
    li a0, 10
    ecall
    
# print output msg2 ("Pig-Latin Word: ") to the user
    li a7, 4 
    la a0, OutputMsg2
    ecall
# print next character until <enter> key symbol is found, then print "way", new line, and goto end
    la t0, chars
vowel_loop:
    lbu t2, (t0)
    addi t2, t2, -10
    beqz t2, vowel_loop_end
    
    li a7, 11
    lbu a0, (t0)
    addi t0, t0, 1 
    ecall
    b vowel_loop
    
#    addi t0, t0, 1
#    lbu a0, (t0)
#    addi t2, a0, -10
#    beqz t2, vowel_loop_end
#    li a7, 11 
#    ecall
#    b vowel_loop
vowel_loop_end:
    li a7, 4 
    la a0, way
    ecall

    li a7, 11 
    li a0, 10
    ecall
    
    b end

# in the end, loop back to the beginning to request new word
end: 
    b main



# create data: a label pointing to space reserved for 20 chars (20 bits total, 1 bit/8 byte per char)
.data 
InputMsg: .string "Please enter the word to be translated and press Enter: "
OutputMsg1: .string "English Word: "
OutputMsg2: .string "Pig-Latin Word: "
way: .string "way"
chars: .space 20
