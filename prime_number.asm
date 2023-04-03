.MODEL SMALL

.STACK 100H

.DATA  
    input_prompt db 'Enter number: $'
    output_prompt db 'Is prime?  $'  
    newline db 10, 13, '$'
    yes db 'yes$'
    no db 'no$'

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
        
        CMP BL, 1
        JLE no_prime
          
        MOV BH, BL  
        DEC BH
        
        prime_check:  
             MOV AX, 0
             MOV AL, BL
             DIV BH
             CMP AH, 0
             JE no_prime
             DEC BH
             CMP BH, 2
             JGE prime_check     
             
        LEA DX, newline
        MOV AH, 9
        INT 21H
        
        LEA DX, output_prompt
        MOV AH, 9
        INT 21H
        
        LEA DX, yes
        MOV AH, 9
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
        no_prime: 
        
             LEA DX, newline
             MOV AH, 9
             INT 21H
                  
             LEA DX, output_prompt
             MOV AH, 9
             INT 21H
            
             LEA DX, no
             MOV AH, 9
             INT 21H
            
             MOV AH, 4CH
             INT 21H   
        
        
        
    MAIN ENDP
    
    END MAIN