;SIMULAZIONE DI ESAME 1
;input:
;R0 = indirizzo della prima cella di una stringa di caratteri ASCII(un carattere per cella)
;output:
;R0 = conteggio lettere convertite
; deve convertire tutte le lettere minuscole in maiuscolo
;ASCII MAIUSCOLE  dal A=65 ad Z=90
;ASCII MINUSCOLE da a=97 ad z=122
;--------------------programma---------------------------
	.orig x3000
	LEA	R0,stringa
	JSR 	CONV_MAIUS
stoqui  BRNZP 	stoqui
stringa .stringz "str ingA"
;--------------------sottoprogramma-----------------------
CONV_MAIUS	ST R1,sr1
		ST R2,sr2	;vogliamo salvarci il valore di stringa(i)
		ST R3,sr3	;serve per salvare -32
	
		ADD R1,R0,#0	;MOV R1 <- R0
		AND R0,R0,#0	;azzero R0

ciclo		LDR R2,R1,#0	; R2 = stringa(i)
		BRZ fine
;se != 0 è un carattere
		LD R3,imm97	;carica -97
		ADD R3,R2,R3	; R2 = stringa(i) - 97
		BRN prossimo
		
		LD R3,imm122	;carico -122 per controllare che non siano caratteri strani
		ADD R3,R2,R3	;R2 = stringa(i) - 122
		BRP prossimo	
		
		LD R3,imm32
		ADD R0,R0,#1	; i++
		ADD R2,R2,R3	;R2 = stringa(i) - 32
		STR R2,R1,#0	;R2 = stringa(i) minuscola

prossimo	ADD R1,R1,#1
		BRNZP ciclo

fine		LD R1,sr1
		LD R2,sr2	;vogliamo salvarci il valore di stringa(i)
		LD R3,sr3	;serve per salvare -32
		RET

sr1	.blkw	1
sr2	.blkw	1
sr3	.blkw	1
imm32	.fill	-32
imm97	.fill	-97
imm122	.fill	-122
;--------------------------------------------------------------
		.end		