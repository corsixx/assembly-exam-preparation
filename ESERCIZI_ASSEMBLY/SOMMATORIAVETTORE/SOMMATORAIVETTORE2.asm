;somma degli elementi di un array
;INZIO DEL PROGRAMMA
	.orig x3000
	LEA	R0,ARRAY	;inizializzo indirizzo R0 = indirizzo prima cella array
	AND	R2,R2,#0	;azzero il totalizzatore
ciclo	LDR	R1,R0,#0	;in R1 salvo il numero in posizione i
	BRZ	fine
	ADD	R2,R2,R1	;incremnto il totalizzatore con elemnto in pos i
	ADD	R0,R0,#1	;incrento i di 1
	BRNZP	ciclo

fine	ST	R2,RIS
stoqui	BRNZP	stoqui
;DATI-----------------------------------------------------------------------------------
ARRAY	.fill	15
	.fill	-27
	.fill	4
	.fill	0

RIS	.blkw	1
	.end