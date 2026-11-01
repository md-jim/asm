
.MODEL SMALL
.STACK 100H

.DATA
A DB 02H
B DB 03H
C DB 04H
D DB 02H

RESULT DB ?
SEG_CODE DB ?

; Common cathode 7-segment codes (0-9)
SEG_TABLE DB 3FH, 06H, 5BH, 4FH, 66H
          DB 6DH, 7DH, 07H, 7FH, 6FH

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Multiply A and B
    MOV AL, A
    MUL B

    ; Add C
    MOV DL, C
    MOV DH, 00H
    ADD AX, DX

    ; Divide by D
    MOV BL, D
    DIV BL

    ; Store result
    MOV RESULT, AL

    ; Convert result to 7-segment code
    LEA BX, SEG_TABLE
    XLAT
    MOV SEG_CODE, AL

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
