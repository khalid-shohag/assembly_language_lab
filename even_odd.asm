.MODEL SMALL

.STACK 100H

.DATA  

    input_prompt db 'Enter a number: $'
    output_prompt db 'Even or Odd: $'
    even_num db 'Even$'
    odd_num db 'Odd$'
    newline db 10, 13, '$'

.CODE

    MAIN PROC    
       
       MOV AX, DATA
       MOV DS, AX
       
       LEA DX, input_prompt
       MOV AH, 9
       INT 21H
       
       MOV AH, 1
       INT 21H
       
       MOV BL, AL 
       SUB BL, 48
       MOV AL, 1
       
       AND AL, BL
       CMP AL, 0
       JE even 
       
       JMP odd  
       
       odd:
            
          LEA DX, newline
          MOV AH, 9
          INT 21H
          
          LEA DX, output_prompt
          MOV AH, 9
          INT 21H
          
          LEA DX, odd_num
          MOV AH, 9       
          INT 21H         
          
          MOV AH, 4CH
          INT 21H
       
       even:  
            
          LEA DX, newline
          MOV AH, 9
          INT 21H  
          
          LEA DX, output_prompt
          MOV AH, 9
          INT 21H
          
          LEA DX, even_num
          MOV AH, 9       
          INT 21H         
          
          MOV AH, 4CH
          INT 21H
        
          
        
        
    MAIN ENDP
    
    
    END MAIN