*-----------------------------------------------------------
* Title      : Lab1b 
* Written by : Your name goes here
* Date       : dd/mm/yyyy
* Description: Loads, Stores, and Arithmetic
*-----------------------------------------------------------

* Put program instructions into memory here
    
        ORG      $8000
START   MOVE.B   NUM1,D0             ;load first byte
        MOVE.B   NUM2,D1             ;load second byte
        ADD.B    D0,D1               ;add bytes 
        MOVE.B   D1,SUM              ;store sum        
        SIMHALT                      ;halt simulator

* Put variables and constants into memory here

        ORG     $9000
NUM1    DC.B     10                  ;byte 1
NUM2    DC.B     52                  ;byte 2
SUM     DC.B    128                  ;byte 3

        END    START                 ;last line of source
