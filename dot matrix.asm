
.MODEL SMALL
.STACK 100H

.DATA

; 8x8 Dot Matrix Pattern for Letter A
PATTERN DB 18H, 24H, 42H, 7EH
        DB 42H, 42H, 42H, 00H

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    LEA SI, PATTERN
    MOV CX, 8

DISPLAY:
    MOV AL, [SI]

    CALL SHOW_HEX

    INC SI
    LOOP DISPLAY

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP


; Procedure to display one byte in hexadecimal
SHOW_HEX PROC

    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    MOV BL, AL

    ; Display upper 4 bits
    MOV DL, AL
    MOV CL, 4
    SHR DL, CL

    CALL PRINT_DIGIT

    ; Display lower 4 bits
    MOV DL, BL
    AND DL, 0FH

    CALL PRINT_DIGIT

    ; New line
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H

    MOV DL, 0AH
    MOV AH, 02H
    INT 21H

    POP DX
    POP CX
    POP BX
    POP AX

    RET

SHOW_HEX ENDP


; Procedure to print hexadecimal digit
PRINT_DIGIT PROC

    CMP DL, 9
    JBE NUMBER

    ADD DL, 7

NUMBER:
    ADD DL, 30H

    MOV AH, 02H
    INT 21H

    RET

PRINT_DIGIT ENDP

END MAIN
