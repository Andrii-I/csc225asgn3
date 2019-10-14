.data # Tell the assembler we are defining data not code

  .word 0x00112233
str:  # Label this position in memory so it can be referred to in our code 
  .asciz "H"
  .byte 'z'
.text # Tell the assembler that we are writing code (text) now 
main: # Make a label to say where our program should start from

  la a0, str # la is similar to li, but works for loading addresses

  li a7, 4  # a7 is what determines which system call we are calling and we what to call write (64)
  ecall      # actually issue the call

  li a0, 0   # The exit code we will be returning is 0
  li a7, 93  # Again we need to indicate what system call we are making and this time we are calling exit(93)
  ecall 
