
.data
    
.equ dozen, 12
 
numPies: .word 6
numDiners: .word 3
numBagels: .word dozen
 
.text
 
LDR r0,=numPies
LDR r1,[r0]
 
ADD r1,r1,#1
 mov r2,0xFF
 mov r2,#0xFF
 LDR r3,=22
 LDR r4,=#22
 
STR r1,[r0]
 
LDR r0,=dozen
STR r1,[r0]
 


