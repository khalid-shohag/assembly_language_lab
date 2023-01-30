
.MODEL SMALL
.STACK 100H

.DATA   
    
    sentence DB 'Hello World' 
    
    reverse DB 11 DUP ? 
    
    count EQU 10


.CODE                        

    MAIN PROC 
        
       MOV AX, DATA
       MOV DS, AX
       
       MOV SI, OFFSET sentence
       MOV BP, OFFSET reverse
       
       ADD SI, 10
       
       MOV CX, count
       
       loopOne:
        
            MOV ES,  [SI] 
            MOV [BP], ES
            dec SI 
            INC BP
            loop loopOne
        
        MOV CX, 11 
        MOV BP, OFFSET reverse
        
        loopTwo: 
             MOV DX, [BP] 
             INC BP
             MOV AH, 02H 
             int 21H
             loop loopTwo
        
        
    MAIN ENDP
    
    END MAIN