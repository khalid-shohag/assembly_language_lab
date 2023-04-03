
.MODEL SMALL

.STACK 100H

.DATA
    
    input_string_one db 'Enter First string: $'
    input_string_two db 'Enter second string: $'
    string_one db 128 db dup('$')
    string_two db 32 db dup('$')
    newline db 10, 13, '$'     
    
    yes db 'YES$'
    no db 'NO$'
    
.CODE
    
    MAIN PROC
        MOV AX, DATA
        MOV DS, AX
        
        LEA SI, string_one
        LEA DI, string_two 
        
        LEA DX, input_string_one
        MOV AH, 9
        INT 21H  
        
        MOV CH, 0
        MOV CL, 0
        
        read_string_one:
            
            MOV AH, 1
            INT 21H
            
            CMP AL, 13
            JE read_string_two
            
            MOV [SI], AL 
            INC SI 
            INC CH
            
            
            JMP read_string_one 
            
        ;LEA DX, input_string_one
;        MOV AH, 9
;        INT 21H
        
        
       
        read_string_two: 
            LEA DX, newline
            MOV AH, 9
            INT 21H   
            
            LEA DX, input_string_two
            MOV AH, 9
            INT 21H
            
            input:
            
            MOV AH, 1
            INT 21H
            
            CMP AL, 13
            JE find_substring
            
            MOV [DI], AL
            INC DI
            INC CL
            
            JMP input
            
            
          find_substring:       
          
                
                LEA SI, string_one
          
                outer_loop:
                 
                    CMP CH, 0
                    JE no_print
                    
                    MOV BL, CL
                    LEA DI, string_two
                    
                    inner_loop:   
                        
                        MOV DL, [SI]
                        DEC BL
                        INC SI
                        ;INC DI
                        DEC CH 
                        CMP DL, [DI]
                        JNE outer_loop
                        INC DI 
                        CMP BL, 0
                        JG inner_loop
                         
                        
                        CMP BL, 0
                        JE print 
                        
                        JMP no_print
                        
                    
                    
         print:
            LEA DX, newline
            MOV AH, 9
            INT 21H           
            
            LEA DX, yes
            MOV AH, 9
            INT 21H 
            MOV AH, 4CH
            INT 21H
             
             
         no_print:
            LEA DX, newline
            MOV AH, 9
            INT 21H           
            
            LEA DX, no
            MOV AH, 9
            INT 21H  
             
            
              
             
                ;LEA DX, newline
;                MOV AH, 9
;                INT 21H
;                
;                LEA DX, string_one
;                MOV AH, 9
;                INT 21H   
;                
;                LEA DX, newline
;                MOV AH, 9
;                INT 21H
;                
;                LEA DX, string_two
;                MOV AH, 9
;                INT 21H   
;                
               MOV AH, 4CH
                INT 21H
            
        
    MAIN ENDP
    
    END MAIN