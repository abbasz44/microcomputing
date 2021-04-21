*-----------------------------------------------------------
* Title      : Lab6
* Written by : Zachery Abbas 
* Date       : 2020-11-03
* Description: sum squared function 
*-----------------------------------------------------------

aOffset     EQU     14              ;displacement from frame pointer
bOffset     EQU     12              ;displacement from frame pointer
cOffset     EQU     8               ;displacement from frame pointer
xOffset     EQU     -4              ;displacement from frame pointer
yOffset     EQU     -8              ;displacement from frame pointer
zOffset     EQU     -12


        ORG     $8000

main    MOVE.W  #2,-(A7)            ;push a = 4         
        MOVE.W  #4,-(A7)            ;push b = 5 
        PEA     c                   ;push address of c 
        BSR     sumSquared           ;call subroutine
        LEA     8(A7),A7            ;remove parameters from stack
        
        SIMHALT
   
      
sumSquared   
        LINK    A6,#-8              ;allocate storage for two longwords
        MOVEM.L A0/D0,-(A7)         ;save working registers
        MOVE.W  aOffset(A6),D0      ;get a
        MULS    D0,D0               ;compute a * a
        MOVE.L  D0,xOffset(A6)      ;x = a * a   
        MOVE.W  bOffset(A6),D0      ;get b
        MULS    D0,D0               ;compute b * b
        MOVE.L  D0,yOffset(A6)      ;y = b * b 
        MOVE.W  aOffset(A6),D0      ;get x
        MULS    bOffset(A6),D0      ;multiply x * y
        MULS    #2,D0               ;multiply 2 * x * y
        MOVE.L  D0, zOffset(A6)
        MOVEA.L cOffset(A6),A0 
        MOVE.L  xOffset(A6),D0                     
        ADD.L   yOffset(A6),D0
        ADD.L   zOffset(A6),D0      
        MOVE.L  D0,(A0)             ;save in c
        MOVEM.L (A7)+,A0/D0         ;restore working registers
        UNLK    A6                  ;deallocate stack frame
        RTS                         ;return to caller

        ORG     $9000
c       DS.L    1                    ;variable c
       
        END     main
   






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
