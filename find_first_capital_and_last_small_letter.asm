
.MODEL SMALL

.DATA
    
   newline db 0AH, 0DH, '$'
   input_prompt db 'Enter new string: $'
   output_prompt_first db 'First capital letter: $'
   output_prompt_second db 'Second capital letter: $'
   string db 128 dup('$')

.CODE                    

    MAIN PROC
         
         MOV AX, DATA
         MOV DS, AX
         
         MOV SI, OFFSET string
         
         LEA DX, input_prompt
         MOV AH, 9
         INT 21H   
         
         MOV BL, 91
         MOV BH, 64
         
         read_string: 
         
                 MOV AH, 1
                 INT 21H
                 
                 CMP AL, 13
                 JE print_string 
                 
                 CMP AL, 'A'
                 JL read_string
                 
                 CMP AL, 'Z'
                 JG read_string
                 
                 ;JMP check
                 
            
                 
                 ;JMP read_string      
                 
                 
                 ;check:
;                     
;                     CMP AL, 'Z'
;                     JLE b_value
                 
                 b_value:
                        
                        CMP BL, AL
                        JG swap_BL
                        
                        CMP BH, AL
                        JL swap_BH 
                        
                        JMP read_string   
                        
                 
                 swap_BL:
                     
                     MOV BL, AL  
                     
                     ;MOV DL, bL
;                     MOV ah, 2
;                     int 21h
                     
                     CMP BH, AL
                     JB swap_BH
                     JMP read_string  
                     
                 
                 swap_BH: 
                     
                     MOV BH, AL
                 
                 ;store:
;                    MOV [SI], AL
;                    INC SI
                 
                 
                 JMP read_string
                 
                 
         print_string:
                    
                  LEA DX, newline
                  MOV AH, 9
                  INT 21H  
                  
                   
                  
                  LEA DX, string
                  MOV AH, 9
                  INT 21H  
                  
                  LEA DX, newline
                  MOV AH, 9
                  INT 21H 
                  
                  LEA DX, output_prompt_first
                  MOV AH, 9
                  INT 21H
                  
                  MOV DL, BL
                  MOV AH, 2
                  INT 21H  
                  
                  LEA DX, newline
                  MOV AH, 9
                  INT 21H  
                  
                  LEA DX, output_prompt_second
                  MOV AH, 9
                  INT 21H
                  
                  MOV DL, BH
                  MOV AH, 2
                  INT 21H
                  
                  
                  
                    
         
    MAIN ENDP
    
    
    END MAIN

