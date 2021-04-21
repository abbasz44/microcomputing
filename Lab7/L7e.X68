*-----------------------------------------------------------
* Title      :Lab 7e
* Written by :Zachery Abbas
* Date       :2020-11-10
* Description:Allowing user to change the operational Mode
*-----------------------------------------------------------
    ORG    $8000
main    TRAP    #0
        TRAP    #0
        TRAP    #0
        TRAP    #0

*main program given
    SIMHALT             ; halt simulator
*Update the Vector Table
    ORG     $80
    DC.L    STATECHANGE
    
    ORG     $800
*-----------------------------------------------------------
* STATE CHANGE:
*             Implement a TRAP #0 expectation that causes 
*             the opertional mode to flip which changes the state
* 
* *-----------------------------------------------------------
STATECHANGE
    MOVEM.L  A1/D0,-(SP)     ;save working register
    MOVE.W  8(SP),D0
    EOR     #$2000,D0
    MOVE.W  D0,8(SP)
    MOVEM.L (SP)+,A1/D0
    RTE                      ;return to  main

* Put variables and constants here

    END    main        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
