
.MODEL SMALL

.STACK 100H

.DATA   

    string db 64 dup('$')
    input_prompt db 'Enter a string: $'
    output_prompt db 'After conversion: $'   
    newline db 0AH, 0DH, '$'

.CODE

    MAIN PROC                             
        
        MOV AX, DATA
        MOV DS, AX     
        
        LEA DX, input_prompt
        MOV AH, 9
        INT 21H
        
        MOV SI, OFFSET string 
        
        read_string:
                
                MOV AH, 1
                INT 21H
                
                CMP AL, 13
                JE print_string
                
                CMP AL, 'A'
                JL store
                
                CMP AL, 'z'
                JG store
                
                JMP check
                
                check:
                    
                    CMP AL, 'Z'
                    JLE convertOne   
                    
                    CMP AL, 'a'
                    JGE convertTwo
                    
                convertOne:
                    ADD AL, 32
                    JMP store     
                
                convertTwo:
                    SUB AL, 32
                    JMP store
                     
                store:
                    
                    MOV [SI], AL
                    INC SI
                
                loop read_string
                
            
            print_string:
            
            LEA DX, newline
            MOV AH, 9
            INT 21H  
                
            
            LEA DX, output_prompt     
            MOV AH, 9
            INT 21H        
            
            LEA DX, string
            MOV AH, 9
            INT 21H
        
        
    
    MAIN ENDP
    
   END MAIN