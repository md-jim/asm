
.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC

    MOV AX, 2000H
    MOV DS, AX

    MOV BX, 0100H
    MOV SI, 0020H

    ; Store 1234H at memory address DS:0120H
    MOV WORD PTR [BX+SI], 1234H

    ; Load value from memory
    MOV AX, [BX+SI]

    ; Add 0010H
    ADD AX, 0010H

    ; Terminate program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
