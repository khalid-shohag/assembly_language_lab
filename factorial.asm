.MODEL SMALL

.STACK 100H


.DATA       
    
    input_prompt db 'Enter number: $'
    output_prompt db 'Result: $'
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
        
        MOV BH, 1
        
        CMP BL, 2
        JL  print_result   
         
        ;JMP find_factorial
        
        
        find_factorial: 
                MOV CL, BL         
                DEC CL  
                MOV AL, 1  
                
                ;MUL BL   
;                ADD AX, 48
;                MOV BX, AX
                
                
                count:
                    MUL BL
                    DEC BL
                    DEC CL   
                    CMP CL, 0
                    JNE count  
                    
                 MOV BL, AL  
                 ADD BL, 48
                    
                 LEA DX, newline
                 MOV AH, 9
                 INT 21H  
                 
                 LEA DX, output_prompt
                 MOV AH, 9
                 INT 21H  
                 
                 
                 mov dL,BL
                 mov ah,02h
                 int 21h   
                 
                 MOV AH, 4CH
                 INT 21H       
                 
          print_result:   
        
                LEA DX, newline
                MOV AH, 9
                INT 21H
            
                LEA DX, output_prompt
                MOV AH, 9
                INT 21H  
                
                ADD BH, 48
                
                MOV DL, BH
                MOV AH, 2
                INT 21H   
                
                MOV AH, 4CH
                INT 21H
                 
        
    MAIN ENDP
    
    
    END MAIN
