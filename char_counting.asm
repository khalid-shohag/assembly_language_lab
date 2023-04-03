.MODEL SMALL

.STACK 100H

.DATA   

    input_prompt db 'Enter string: $'
    output_vowel db 'Vowels: $'
    output_consonant db 'Consonant: $'
    output_digit db 'Digit: $'
    output_space db 'Space: $'
    output_special db 'Special: $'
    newline db 10, 13, '$'
    string db 128 dup('$') 
    
    count_space db 48
    count_vowel db 48
    count_consonant db 48
    count_digit db 48
    count_special db 48

.CODE

    MAIN PROC   
        
        MOV AX, DATA
        MOV DS, AX 
        
        
        
        LEA DX, input_prompt
        MOV AH, 9
        INT 21H  
        
        LEA SI, string
        
        read_char: 
               
               MOV AH, 1
               INT 21H 
               
               CMP AL, 13
               JE count
               
               CMP AL, 32
               JE space  
               
               CMP AL, '0'
               JGE digit
        
        space:
            INC count_space
            JMP read_char 
        
        digit:
            
            CMP AL, '9'
            JG vowel
            
            INC count_digit
            JMP read_char
        
        vowel:
            
            CMP AL, 'a'
            JE find_vowels 
            CMP AL, 'e'
            JE find_vowels
            CMP AL, 'i'
            JE find_vowels
            CMP AL, 'o'
            JE find_vowels
            CMP AL, 'u'
            JE find_vowels
            
            JMP special
        
        find_vowels:
            INC count_vowel
            JMP read_char 
        
        special:
            CMP AL, '!'
            JE find_specials 
            CMP AL, '@'
            JE find_specials
            CMP AL, '#'
            JE find_specials
            CMP AL, '%'
            JE find_specials
            CMP AL, '&'
            JE find_specials
            
            JMP consonant
        find_specials:
            INC count_special
            JMP read_char
        consonant:
               
               INC count_consonant
               JMP read_char
                   
        
        count:
            
            LEA DX, newline
            MOV AH, 9
            INT 21H
            
            LEA DX, output_vowel
            MOV AH, 9
            INT 21H
            
            MOV DL, count_vowel
            MOV AH, 2
            INT 21H   
            
           ; LEA DX, newline
;            MOV AH, 9
;            INT 21H
;            
;            LEA DX, output_space
;            MOV AH, 9
;            INT 21H
;            
;            MOV DL, count_space
;            MOV AH, 2
;            INT 21H            
            
            LEA DX, newline
            MOV AH, 9
            INT 21H
            
            LEA DX, output_space
            MOV AH, 9
            INT 21H
            
            MOV DL,, count_space
            MOV AH, 2
            INT 21H      
            
            LEA DX, newline
            MOV AH, 9
            INT 21H
            
            LEA DX, output_consonant
            MOV AH, 9
            INT 21H
            
            MOV DL, count_consonant
            MOV AH, 2
            INT 21H    
            
            LEA DX, newline
            MOV AH, 9
            INT 21H
            
            LEA DX, output_special
            MOV AH, 9
            INT 21H
            
            MOV DL, count_special
            MOV AH, 2
            INT 21H         
            
            MOV AH, 4CH
            INT 21H
         
    MAIN ENDP
    
    END MAIN