;input:
;R0 = primo elemento di un array in modulo e segno diverso da 0( 0 = tappo)
;output:
;R0 = sommatoria in modulo e segno di tutti i numeri dell'array, trascurando traboccamenti
;------------------------programma chiamante--------------------------
	.orig x3000
	LEA	R0,arr
	JSR	sommat
stoqui	BRNZP	stoqui
			
arr	.fill	x33FA
	.fill 	X84AE
	.fill	x8000
	.fill	x0000
;----------------------sottoprogramma--------------------------------
sommat	LD  R1,salvar1
	LD  R2,salvar2
	LD  R7,salvar7
	AND R1,R1,#0
	
ciclo	LDR R2,R0,#0	;r2 = array(i)
	JSR trovacomplemento
	ADD R2,R2,#0	;aggiorno CC
	BRZ fine
	
	ADD R1,R1,R2	;(R1)sommatoria = sommatoria+array(i)
	ADD R0,R0,#1	;i++
	BRNZP ciclo

fine	AND R0,R0,#0
	ADD R0,R1,#0
	ST R1,salvar1
	ST R2,salvar2
	ST R7,salvar7
	RET
	
salvar1	.blkw	1
salvar2	.blkw	1
salvar7 .blkw	1
;--------------------------------------------------------------------
trovacomplemento	ST R4,salvar4
			LD R4,mask
			ADD R2,R2,#0	;controllo se R2 >= 0
			BRZP fine1
neg			AND R2,R2,R4	;0111 1111 1111 1111 AND numero negativo(1xxx xxxx xxxx xxxx) ci fa ignorare il segno(1)
			NOT R2,R2
			ADD R2,R2,#1	;complemento a 2 del modulo(senza segno)
fine1			LD R4,salvar4
			RET
salvar4	.blkw	1
mask	.fill	x7FFF
;---------------------------------------------------------------------------
	.end
