
*-----------------------------------------------------------
* Title      : CLOCK
* Written by : Zachery Abbas
* Date       : 18/11/2020
* Description:  auto-vector interrupt-driven 24-hour digital clock.
*-----------------------------------------------------------
;FIRST I WILL SET UP HARDWARE VARIABLES 
HARDWARE EQU $E00000
HARDWARE2 EQU HARDWARE+2
HARDWARE4 EQU HARDWARE+4
HARDWARE6 EQU HARDWARE+6
HARDWARE8 EQU HARDWARE+8
HARDWARE10 EQU HARDWARE+10
HARDWARE12 EQU HARDWARE+12
HARDWARE14 EQU HARDWARE+14


     ORG   $8000
START: BRA  main
;Make sure all the segments ligts are off

main MOVE.L  #ISR6,$78          ;exception handler, tried to do clear one didnt finish
     MOVE.L  #00, HARDWARE
     MOVE.L  #00,HARDWARE4  
     MOVE.L  #00,HARDWARE8
     MOVE.L #00, HARDWARE12
     MOVE.L #32,D0
     CLR.B  D1
     TRAP   #15
*-----------------------------------------------------------
*pooling loop here 
* display the current time on the 7-segment interface
*read the values of the global three variables HH, MM, and SS. It should then convert
*each of these (binary) integer values into two binary-coded decimal digits (each
*between 0 and 9) for displaying on the 7-segment display
*-----------------------------------------------------------                  
polling 

;LOGIC for all these functions to get the first and second part is 
;to divides what I want it by 10 then the remainder and quoitent
      
      MOVE.B #$40,HARDWARE4
      MOVE.B #$40,HARDWARE10
      MOVE.L HH,D1              ;hours
      DIVU   #10,D1
      LEA   NUMBER,A1
      ADDA.W D1,A1
      MOVE.B (A1),HARDWARE
      SWAP    D1
      LEA   NUMBER,A1
      ADDA.W D1,A1
      MOVE.B (A1),HARDWARE2 
      MOVE.L MM,D1              ;miniutes
      DIVU  #10,D1
      LEA   NUMBER ,A1
      ADDA.W  D1,A1
      MOVE.B (A1),HARDWARE6
      SWAP    D1
      LEA   NUMBER,A1
      ADDA.W D1,A1
      MOVE.B (A1),HARDWARE8
      MOVE.L  SS,D1             ;seconds
      DIVU  #10,D1
      LEA   NUMBER,A1
      ADDA.W  D1,A1
      MOVE.B  (A1),HARDWARE12
      SWAP     D1
      LEA   NUMBER,A1
      ADDA.W  D1,A1
      MOVE.B  (A1),HARDWARE14
      
      
      BRA   polling 
     
      SIMHALT
*-----------------------------------------------------------
*decrement a counter (that is initially set to 60) 
*check to see if the counter is zero. 
*If the value of the counter is not zero, the counter should be decremented by 1
*----------------------------------------------------------- 

ISR6  ORI.W #$600,SR
      SUB.L  #1,count      
      CMPI.L  #0,count    
      BEQ    mili   ;branch to mili 
      BRA    EXIT            
mili MOVE.L #40,count
        ADD.L  #01,SS
        CMP.L  #60,SS 
        BEQ    sec   ;branch to second 
        BRA    EXIT
sec MOVE.L #00,SS
        ADD.L  #01,MM
        CMP.L #60,MM
        BEQ   min     ;branch to min 
        BRA   EXIT
min MOVE.L #00,MM
        ADD.L #01,HH
        CMP.L #24,HH
        BEQ hrs       ;branch to hours 
        BRA  EXIT
hrs  MOVE.L #0,HH
EXIT   RTE

;Problems with code I was unable to put the reset factor my logic was incorrect 
;everything else should work 


HH    DC.L  11
MM    DC.L  37
SS    DC.L  27
count DC.L  $3C

    ORG   $9000
NUMBER  DC.B $3F,$06,$5B,$4F,$66,$6D,$7D,$07,$7F,$6F  

    END    START        
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
