.MODEL SMALL

.STACK 100H

.DATA  

    input_prompt db 'Enter numbers: $'
    output_prompt db 'Largest number: $' 
    newline db 10, 13, '$'
    numbers db 15 dup('$')
    

.CODE

    MAIN PROC
        
        MOV AX, DATA
        MOV DS, AX    
        
        LEA DX, input_prompt
        MOV AH, 9
        INT 21H
        
        LEA SI, numbers    
        MOV CL, 0
        
        input_number:
                
                MOV AH, 1
                INT 21H  
                
                CMP AL, 13
                JE FIND
                
                MOV [SI], AL
                INC SI
                INC CL
                
                JMP input_number
        FIND:
            
            LEA SI, numbers    
            
            MOV BL, [SI]
            INC SI
            DEC CL
            
            count:
                
                CMP BL, [SI]
                JL COPY      
                
                
                INC SI
                DEC CL
                CMP CL, 0
                JLE print 
                JMP count
                
                COPY:
                    MOV BL, [SI]
                    INC SI
                    DEC CL
                    CMP CL, 0
                    JLE print  
                    JMP count
                    
                
            print:
                LEA DX, newline
                MOV AH, 9
                INT 21H
                
                LEA DX, output_prompt
                MOV AH, 9
                INT 21H
                
                MOV DL, BL
                MOV AH, 2
                INT 21H
                  
                
                MOV AH, 4CH
                INT 21H
                    
           
               
         
        
    MAIN ENDP
    
    END MAIN