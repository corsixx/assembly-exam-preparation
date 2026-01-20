;scrivere il sottoprogramma conta_volte
;input:
;R0 = puntatore a una stringa
;R1 = codice ASCII di una lettere MAIUSCOLA

;output:
;R1 = numero di volte in cui la lettera ricevuta comapre come lettera minuscola
;R0 = conteggio di quante volte la lettera in R1 compare come lettera maiuscola

;-----------------------programma chimante----------------------
	.orig x3000
	LEA R0,stringa
	LD R1,char
	JSR sommaou
	
stoqui BRNZP stoqui

stringa .stringz "Giorno 23 maggio 2025"
char	.fill	x0047
;----------------------sottoprogramma--------------------------
CONTA_VOLTE	ST R2,SR2	;TMP
		ST R3,SR3	;CONT1
		ST R4,SR4	;CONT2
		ST R5,SR5	;
		
		AND R2,R2,#0	;totalizzatore 1 = 0
		AND R3,R3,#0	;totalizzatore 2 = 0
		LD R5,imm32
		NOT R1,R1
		ADD R1,R1,#1	; negato di lettera MAIUSCOLA
		
CICLO		LDR R4,R0,#0
		BRZ FINE
		
		ADD R4,R4,R1	; stringa(i) - lettera = STRINGA - R1
		BRZ MAIUSC
	
;se in R4 avevamo 'a(97)', e la lettera da cercare(R1) era 'A(65)'
;facendo R4-R1 in R4 abbiamo la 32(se fosse un'altra lettera sarebbe piu grande/piccolo)
;quindi facendo 32 - 32 troviamo la soluzione
		
		ADD R4,R4,R5
		BRZ MINUSC
		BRNP NEXT

MAIUSC		ADD R2,R2,#1	;tot+=1 se è maiuscola
		BRNZP NEXT

MINUSC		ADD R3,R3,#1

NEXT		ADD R0,R0,#1
		BRNZP CICLO

FINE		ADD R0,R2,#0
		ADD R1,R3,#0
		LD R2,SR2	;TMP
		LD R3,SR3	;CONT1
		LD R4,SR4	;CONT2
		LD R5,SR5	;
		RET
SR2	.BLKW	1
SR3	.BLKW	1
SR4	.BLKW	1
SR5	.BLKW	1
imm32	.fill	-32
;------------------------------------------------------------------
	.end
