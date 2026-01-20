;SCRIVERE IL SOTTOPROGRAMMA CONTA_PARI_DISPARI
;input:
;R0 = indirizzo di un array
;R1 = indirizzo di fine array
;output:
;R0 = conteggio numeri pari
;R1 = conteggio numeri dispari
;NB: se il bit 2^0 = 1, vuol dire che é dispari, senno il contrario
;--------------------programma chiamante-----------------------------
			.orig x3000
			LEA R0,array
			LEA R1,farray
			JSR CONTA_PARI_DISPARI
STOQUI			BRNZP STOQUI

;----dati locali----

array	.fill	122
	.fill	-27
	.fill	-1232
	.fill	450
	.fill	15
farray	.fill	120

;--------------------sottoprogramma--------------------------------

CONTA_PARI_DISPARI	ST R2,sr2
			ST R3,sr3
			ST R4,sr4

			ADD R2,R0,#0	;R2 nuovo puntatore a array(i)
			AND R0,R0,#0
			ADD R3,R1,#0	;R2 nuovo puntatore a array(fine)
			AND R1,R1,#0

			NOT R3,R3	;trasformo l'indirizzo in negativo
			ADD R3,R3,#1
ciclo			ADD R4,R2,R3
			BRP fine

			LDR R4,R2,#0	;carico array(i) in R4
			AND R4,R4,#1	;R4 è il numero da controllare. R4 = R4 AND 0000000000000001
			;AND R4,R4,b00001
			BRz PARI

			;qui se dispari
			ADD R1,R1,#1	;contatore dispari + 1
			BRNZP prossimo

PARI
			ADD R0,R0,#1

prossimo		ADD R2,R2,#1
			BRNZP ciclo
			
fine			LD R2,sr2
			LD R3,sr3
			LD R4,sr4
			RET

;----dati locali----

sr2	.blkw	1
sr3	.blkw	1
sr4	.blkw	1

;------------------------------------------------------------------------------
			.end



			