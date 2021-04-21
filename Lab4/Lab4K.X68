*-----------------------------------------------------------
* Title      : Lab4K
* Written by : Zachery Abbas
* Date       : 21/10/2020
* Description: swap greater than
*-----------------------------------------------------------
        
START   MOVE.W  A,D0          
        CMP.W   #50,D0         
        BLO     LOW
        BRA     EXIT 

LOW    ADD.W   #1, A
       BRA     START 
                            ;keep hitting run till program is >50
                  

EXIT      SIMHALT

        ORG  $9000
A       DC.W 1          
         
        END  START 
       
 





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
