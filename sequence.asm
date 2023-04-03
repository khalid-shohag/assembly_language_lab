.MODEL SMALL

.STACK 100H

.DATA 
    
    input_prompt db 'Enter a string: $'
    output_prompt db 'Sequence: $'
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
        MOV BH, AL
        MOV DH, AL
        MOV CL, 1
        MOV CH, 1
        
        input_char:
            INT 21H
            
            CMP AL, 13
            JE print
            
            INC BL
            CMP BL, AL
            JNE shift
            
            INC CL   
            JMP input_char
            
            shift:
                
                CMP CL, CH
                JLE skip_sequence
                
                MOV CH, CL
                MOV DH, BH
                ;JMP input_char
            
            skip_sequence:
                
                 
                MOV BL, AL
                MOV BH, AL 
                MOV CL, 1    
                JMP input_char
            
            print:  
            
                CMP CL, CH
                JLE skip   
                
                MOV CH, CL
                MOV DH, BH
                
                skip:
                     
            
                MOV BL, DH
            
                LEA DX, newline
                MOV AH, 9
                INT 21H
                
                LEA DX, output_prompt
                MOV AH, 9
                INT 21H    
                
                
                
                ;MOV DH, BH
;                add dl, 48
;                mov ah, 2
;                int 21h
                  
                
                SQ:
                  
                  MOV DL, BL
                  MOV AH, 2
                  INT 21H
                  INC BL
                  DEC CH
                  CMP CH, 0
                  JG SQ
                  
                 MOV AH, 4CH
                 INT 21H
                
                
        
    MAIN ENDP 
    
    END MAIN