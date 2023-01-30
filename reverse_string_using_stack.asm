
.MODEL SMALL
.STACK 100H

.DATA

    sentence DB 'Hello World'
    
 .CODE
 
    MAIN PROC
         
         MOV AX, @DATA ;Move data to Accumulator
         MOV DS, AX    ;Move Accumulator contents to data segment
         
         MOV SI, OFFSET sentence  ;Pass start address of the string to source index
         
         mov cx, 11
         
         loopOne:
            
            MOV BX, [SI] ;Copy source index character of the string to Base register
            PUSH BX
            inc si ;increment index value
            loop loopOne
            
         MOV CX, 11
         loopTwo:
            
            pop DX     
            
            MOV AH, 02H
            int 21H
            loop loopTwo
             
         
      
    MAIN ENDP  
    
 END MAIN