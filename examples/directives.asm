.data
MEAT:	.word 0xDEADbeef	#will appear at start of data segment.
ARRAY:	.space 5			#5 bytes of 0's
STRG:	.string "test string!"	#the ascii codes for each char + null will be in memory. Is it word aligned?
ZERO:	.byte 'a'			#the ascii code for the char is embedded unaligned.
TEST1:	.word -1			#will appear at the next word aligned address.

