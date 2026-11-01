
.MODEL SMALL
.STACK 100H

.DATA
ARRAY DB 12H, 45H, 23H, 67H, 34H
MAX DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA SI, ARRAY

    MOV AL, [SI]       ; First number is maximum
    MOV CX, 4          ; Remaining 4 numbers

L1:
    INC SI
    CMP AL, [SI]
    JAE NEXT           ; If AL >= [SI], skip
    MOV AL, [SI]       ; Update maximum

NEXT:
    LOOP L1

    MOV MAX, AL        ; Store maximum

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
