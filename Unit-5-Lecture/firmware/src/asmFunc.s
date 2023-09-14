/*** asmFunc.s   ***/

#include <xc.h>

/* Tell the assembler that what follows is in data memory    */
.data
.align
 
/* define and initialize global variables that C can access */

.global deposit,withdrawal,balance,eat_out,stay_in,eat_ice_cream,we_have_a_problem
.type deposit,%gnu_unique_object
.type withdrawal,%gnu_unique_object
.type balance,%gnu_unique_object
.type eat_out,%gnu_unique_object
.type stay_in,%gnu_unique_object
.type eat_ice_cream,%gnu_unique_object
.type we_have_a_problem,%gnu_unique_object

/* NOTE! These are only initialized ONCE, right before the program runs.
 * If you want these to be 0 every time asmFunc gets called, you must set
 * them to 0 at the start of your code!
 */
deposit:           .word     0  /* input value set by the C code */
withdrawal:        .word     0  /* input value set by the C code */
balance:           .word     0  /* input value set by the C code */
eat_out:           .word     0  /* set this to 0 at the start of your code! */
stay_in:           .word     0  /* set this to 0 at the start of your code! */
eat_ice_cream:     .word     0  /* set this to 0 at the start of your code! */
we_have_a_problem: .word     0  /* set this to 0 at the start of your code! */

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
    LDR r0,=balance
    LDR r1,[r0]
    LDR r2,=deposit
    STR r1,[r2]
    ADDS r3,r1,r1
    

       
    /* restore the caller's registers, as required by the 
     * ARM calling convention 
     */
    pop {r4-r11,LR}

    mov pc, lr	 /* asmFunc return to caller */
   

/**********************************************************************/   
.end  /* The assembler will not process anything after this directive!!! */
           




