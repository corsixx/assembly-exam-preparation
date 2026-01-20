;scrivere il sottoprogramma CONTA_MIN_UGU_MAG
;input:
;R0 = ARRAY con tappo
;R1 = valore da confrontare

;output:
;R0 = numeri di valori della sequenza minori di num1
;R1 = numeri di valori della sequenza uguali di num1
;R2 = numeri di valori della sequenza maggiori di num1
;-----------------------programma chimante----------------------
	.orig x3000
	LEA R0,ARRAY
	LD R1,NUM
	JSR CONTA_MIN_UGU_MAG
	
stoqui BRNZP stoqui

ARRAY 	.fill	112
	.fill	-27
	.fill	-12
	.fill	-20
	.fill	-12
	.fill	-15
	.fill	0
NUM	.fill	-12
;----------------------sottoprogramma--------------------------
CONTA_MIN_UGU_MAG	ST R3,SR3	;TOT_MIN
			ST R4,SR4	;TOT_UGU
			ST R5,SR6	;TMP
			
			AND R2,R2,#0	;AZZERO TOT_MAG
			AND R3,R3,#0	
			AND R4,R4,#0	
			NOT R1,R1
			ADD R1,R1,#1	;R1 = -R1 PER IL CONFRONTO
			
CICLO			LDR R6,R0,#0
			BRZ FINE
			
			ADD R6,R6,R1
			BRZ UGUALI
			BRP MAGGIORE
			ADD R3,R3,#1	;array(i) minore di num
			BRNZP NEXT
UGUALI		ADD R4,R4,#1
		BRNZP NEXT

MAGGIORE	ADD R2,R2,#1

NEXT		ADD R0,R0,#1
		BRNZP CICLO	

FINE		ADD R0,R3,#0
		ADD R1,R4,#0
		LD R3,SR3	;TOT_MIN
		LD R4,SR4	;TOT_UGU
		LD R5,SR6	;TMP
		RET
SR3	.BLKW	1
SR4	.BLKW	1
SR6	.BLKW	1
;------------------------------------------------------------------
	.end
