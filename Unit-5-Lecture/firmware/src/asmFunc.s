/*** asmFunc.s   ***/

#include <xc.h>

/* Tell the assembler that what follows is in data memory    */
.data
.align
 
/* define and initialize global variables that C can access */

.global bagels,donuts,snacks
.type bagels,%gnu_unique_object
.type donuts,%gnu_unique_object
.type snacks,%gnu_unique_object

bagels:  .word     0  /* input value set by the C code */
donuts:  .word     0  /* input value set by the C code */
snacks:  .word     0  /* output value calc'd by assembly code */

 /* Tell the assembler that what follows is in instruction memory    */
.text
.align

/* Tell the assembler to allow both 16b and 32b extended Thumb instructions */
.syntax unified

    
/********************************************************************
function name: asmFunc
function description:
     output = asmFunc ()
     
where:
     output: the integer value returned to the C function
     
     function description: The C call ..........
     
     notes:
        None
          
********************************************************************/    
.global asmFunc
.type asmFunc,%function
asmFunc:   

    /* save the caller's registers, as required by the ARM calling convention */
    push {r4-r11,LR}
    
    /* Lets study these lines in class. */
    LDR r4,=snacks
    LDR r5,=0
    STR r5,[r4]
    LDR r0,=bagels
    LDR r1,[r0]
    LDR r2,=donuts
    LDR r3,[r2]
    /* r4 still has the address of "snacks" in it */
    ADDS r5,r1,r3
    STR r5,[r4]
    

       
    /* restore the caller's registers, as required by the 
     * ARM calling convention 
     */
    pop {r4-r11,LR}

    mov pc, lr	 /* asmFunc return to caller */
   

/**********************************************************************/   
.end  /* The assembler will not process anything after this directive!!! */
           




