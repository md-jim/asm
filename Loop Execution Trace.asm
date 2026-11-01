
.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'Sum = $'

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Initialize registers
    MOV CX, 0005H
    MOV AX, 0000H

L1:
    ADD AX, CX
    LOOP L1

    ; Display message
    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    ; Display result (15)
    MOV DL, '1'
    MOV AH, 02H
    INT 21H

    MOV DL, '5'
    MOV AH, 02H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
