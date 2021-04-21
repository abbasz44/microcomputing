*-----------------------------------------------------------
* Title      : Lab4i
* Written by : Zachery Abbas
* Date       : 21/10/2020
* Description: swap greater than
*-----------------------------------------------------------
        
        ORG     $8000
START   MOVE.B  B,D0          
        CMP.B   A,D0          
        BHI     GREATER
        MOVE.B  A,D5       ;temp is in D5
        MOVE.B  B,A
        MOVE.B  D5,B
        MOVE.B  A, D0
        MOVE.B  B,D1            
        BRA     EXIT             
GREATER MOVE.B  C,D6
        MOVE.B  D6,A
        MOVE.B  D6,B
        MOVE.B  A, D0
        MOVE.B  B,D1 
        
                            ;showing A and B in register D0 and D1
            

EXIT    SIMHALT      

        ORG  $9000
A       DC.B 1           
B       DC.B 0
C       DC.B 1           
        END  START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
