*-----------------------------------------------------------
* Title      : Lab4J
* Written by : Zachery Abbas
* Date       : 21/10/2020
* Description: swap greater than
*-----------------------------------------------------------
        
START   MOVE.W  A,D0          
        CMP.W   #0,D0         
        BHS     GREATER
                  
GREATER CMP.W   #100,D0
        BLS     BOTH
        CMP.W   #800, D0
        BHS     NEXTGREAT
        BLO     LOW
          
NEXTGREAT CMP.W  #900,D0
          BLS    BOTH 
       
LOW     
        MOVE.W  #0,B
        MOVE.W  B,D1            
        BRA     EXIT 

BOTH      MOVE.W  #1,B
          MOVE.W  B,D1
EXIT      SIMHALT

        ORG  $9000
A       DC.W 101           
B       DS.W 0         
        END  START 
       
 



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
