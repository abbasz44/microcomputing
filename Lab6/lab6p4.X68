*-----------------------------------------------------------
* Title      :Lab 6
* Written by :Zachery Abbas
* Date       :2020-11-03
* Description:display remainder
*-----------------------------------------------------------
nOffset           EQU      8
quotientOffset    EQU     -2
remainderOffset   EQU     -4
    
        ORG    $8000
main    LEA     MSG,A1              ;initalize pointer to string
        MOVE    #14,D0              ;print string is task 14
        TRAP    #15                 ;system call
        MOVE    #4,D0               ;read integer from keyboard is task 4
        TRAP    #15                 ;get value of n
        MOVE.W  D1,-(A7)            ;pass n to the stack
        BSR     display
        LEA     2(A7),A7
        
 
* Put program code here
    SIMHALT             ; halt simulator

* Put variables and constants here
display
        LINK    A6, #-4
        CLR.L   D2
        MOVEM.L  D0/D2-D3,-(A7)    ;save working registers
        MOVE.W  8(A6),D2      
        
        CMP     #0,D2                ;if !n?
        BEQ     DONE                 ;no

        EXT.L   D2
        DIVS    #10, D2
        MOVE.W  D2,-4(A6)           ;store quotient
        SWAP    D2
        MOVE.W  D2,-2(A6)           ;store remainder
        MOVE.W -4(A6),-(A7)
        BSR     display
        LEA     2(A7),A7
        
        MOVE.W -2(A6),D3
        MOVE    #3,D0               ;display integer is task 3
        MOVE.L D3,D1
        TRAP    #15                 ;system call
        
DONE    MOVEM.L  (A7)+,D0/D2-D3     ;restore working register               
        UNLK    A6                  ;deallocate stack frame
        RTS                         ;return value of factorial(n) in D1


        ORG $9000
MSG     DC.B 'Enter n: ',0
    END    main        



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
