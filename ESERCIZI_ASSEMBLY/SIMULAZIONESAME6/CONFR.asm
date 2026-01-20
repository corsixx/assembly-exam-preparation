;PROGRAMMA CONFRONTO R1 E R2 DUE NUMERI NUM1 E NUM2
;RESTITUIRE IN R0 -1 SE NUM1>NUM2, 0 SE NUM1=NUM2 +1 SE NUM1<NUM2


;---------------inzio del programma----------------------------------------
	.orig	x3000
;preparo i dati
	AND	R0,R0,#0	;azzero il registro del risultato
	LD	R1,num1
	LD	R2,num2
;inizio del confronto
	NOT	R2,R2		;complemento a 1 num2
	ADD	R2,R2,#1	;sommo +1 -> R2= -R2
	ADD	R1,R1,R2	;faccio num1 - num2 e controllo CC
	BRN	seneg
	BRP	sepos
seneg	ADD	R0,R0,#-1	;faccio la add a R0 di -1
sepos	ADD	R0,R0,#1


fine	ST	R0,ris		;salvo il risultato in ris
stoqui	BRNZP	stoqui
;-----------zona dati-------------
ris	.blkw	1
num1	.fill	15
num2	.fill	5
	.end