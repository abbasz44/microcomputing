*-----------------------------------------------------------
* Title      :LAB 5
* Written by :ZACHERY ABBAS
* Date       :2020-10-27    
* Description:
*-----------------------------------------------------------
    ORG    $8000
main   LEA    MSG,A1
       MOVE   #14,D0
       TRAP   #15
       MOVE   #4, D0
       TRAP   #15
       MOVE.W  D1,-(A7)
     
       BSR     get_data
       
       
       SIMHALT
 
get_data   CMP     #10, D1
           BGT     main                 ;ERROR HANDILING
           CMP     #1, D1
           BLT     main
           MOVE.W  D1,D2                ;STORING USER INPUT INTO D2
           LEA     MSG2,A1                  
           MOVE   #14,D0
           TRAP   #15
           MOVE   #4, D0
           TRAP   #15
           MOVE.W  D1,-(A7)
           CMP     LENGTH, D2 
           ;BGE     get_data             ;LOOP TILL LENGTH IS LESS THAN OR EQUAL TOO
           
           BSR     Statistics           ;THEN BRANCH TOO NEXT FUNCTION 
           
Statistics                              ;next function 

            ;tried coding didnt work had to delete too many errors but I would like to explain my thought process 
            ;after this i would get the four members out od the structure 
            ;then once i get the four things I would branch too display
            
            BSR     display 

display    LEA     MSG3,A1                  
           MOVE   #14,D0
           TRAP   #15
           MOVE   #4, D0
           TRAP   #15
           LEA     MSG4,A1                  
           MOVE   #14,D0
           TRAP   #15
           MOVE   #4, D0
           TRAP   #15
           LEA     MSG5,A1                  
           MOVE   #14,D0
           TRAP   #15
           MOVE   #4, D0
           TRAP   #15
 
 ;this displays the information then not working







    ORG    $9000
MSG   DC.B 'Enter number of values in list(1-10): ',0
MSG2  DC.B  'Enter number: ', 0  
MSG3  DC.B  'Minimum: ',0
MSG4  DC.B  'Maxiumum: ',0
MSG5  DC.B  'Average: ',0
   
LIST  DC.W   10
LENGTH  EQU       (*-LIST)/2     


    END main


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
