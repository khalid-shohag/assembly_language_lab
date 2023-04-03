                .MODEL SMALL

.STACK 100H

.DATA 

    input_prompt db 'Enter characters: $'
    output_prompt db 'Sorted order: $'
    newline db 10, 13, '$'
    numbers db 48 dup('$')

.CODE
    
    MAIN PROC     
        
        MOV AX, DATA
        MOV DS, AX
        
        LEA DX, input_prompt
        MOV AH, 9
        INT 21H    
        
        LEA SI, numbers 
        MOV BH, 0
        
        read_numbers:
                
                MOV AH, 1
                INT 21H
                
                CMP AL, 13
                JE find_sorted_order
                
                MOV [SI], AL
                INC SI   
                INC BH
                
                JMP read_numbers
                
        find_sorted_order:    
        
                  LEA DX, newline
                  MOV AH, 9
                  INT 21H
                    
                  LEA DX, output_prompt
                  MOV AH, 9
                  INT 21H     
                  
                  MOV CL, BH
                  
                  ;LEA SI, numbers 
                  
                  outer_loop:
                        
                        MOV CH, CL
                        DEC CH
                        LEA SI, numbers 
                        MOV DI, SI 
                        INC DI  
                        
                        inner_loop:
                            
                                 
                            
                            MOV AH, [DI]
                            
                            CMP [SI], AH
                            JG EXCHANGE 
                            
                            INC SI
                            INC DI
                            DEC CH
                            CMP CH, 0
                            JG inner_loop 
                            
                            CMP CH, 0
                            JE check
                        
                            EXCHANGE:
                                
                                MOV AL, [SI]
                                MOV [SI], AH
                                MOV AH, AL
                                MOV [DI], AH 
                                INC SI
                                INC DI
                                DEC CH
                                CMP CH, 0
                                JG inner_loop 
                                CMP CH, 0
                                JE check
                             
                        ;INC SI 
                        check: 
                            DEC CL
                            CMP CL, 1
                            JG outer_loop 
                  
                  LEA SI, numbers   
                  MOV CL, BH
                  
                  print_numbers:
                            
                            MOV DL, [SI]
                            MOV AH, 2
                            INT 21H
                            
                            INC SI
                            DEC CL
                            CMP CL, 0
                            JG print_numbers
                            
                            MOV AH, 4CH
                            INT 21H
        
        
                
    MAIN ENDP 
    
    END MAIN