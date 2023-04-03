.MODEL SMALL

.STACK 100H

.DATA 
    
    input_prompt db 'Enter number: $'
    newline db 10, 13, '$' 
    output_prompt db 'Result: $'
    

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
        
        ;JMP print_result
        
        print_result:  
        
                LEA DX, newline
                MOV AH, 9
                INT 21H  
                
                LEA DX, output_prompt
                MOV AH, 9
                INT 21H
                
                MOV AL, BL
                
                INC BL  
                
                MUL BL
                
                MOV BH, 2
                
                DIV BH    
                
                ADD AL, 48 
                
                
                
                MOV DL, AL
                MOV AH, 2
                INT 21H      
              
    
    MAIN ENDP
    
    END MAIN