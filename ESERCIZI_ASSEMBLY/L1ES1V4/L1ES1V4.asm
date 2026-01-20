;ESERCIZIO 1 VARIANTE 3
;R1 = indirizzo cella memoria contenente l'indirizzo di num1
;R2 = indirizzo cella memoria contenente l'indirizzo di num2
;OUTPUT
;R0 = -1 se num1<num2
;R0 = 0 se num1=num2
;R0 = 1 se num1>num2

;--------------------PROGRAMMA CHIMANTE---------------------------
	.orig x3000
	LEA R1,pn1	;indirizzo num1
	LEA R2,pn2	;NB: n1 e la label che corrisponde all'indirizzo di n1
	JSR confr

	LEA R1,pn1
	LEA R2,pn1
	JSR confr

	LEA R1,pn2
	LEA R2,pn1
	JSR confr

	LEA R1,pn2
	LEA R2,pn4
	JSR confr

	LEA R1,pn3
	LEA R2,pn4
	JSR confr

	LEA R1,pn1
	LEA R2,pn3
	JSR confr
stoqui	BRNZP	stoqui

n1	.fill	10
n2	.fill	20
n3	.fill	-10
n4	.fill	-20
pn1	.fill	n1
pn2	.fill	n2
pn3	.fill 	n3
pn4 	.fill	n4
;-------------------SOTTOPROGRAMMA--------------------------------

confr	ST R1,salvar1	;se facessi STI, salvar1 verrebbe interpretato come un puntatore a un'altra cella,
	ST R2,salvar2	;quindi per salvare i dati usare esclusivamente ST e LD
	AND R0,R0,#0	;AZZERO R0(DOVE ANDRA IL RIS)

;ho salvato, devo ora accedere ai valori

	LDR R1,R1,#0	;doppio accesso, ora in R1 = l'indirizzo contenuto in pn1
	LDR R1,R1,#0	;ora ho il contenuto di n1

;	LDI R1,salvar1	posso fare anche cosi, con LDI in R1 = salvar1-> pn1 -> n1
;	LDI orende l'idnirizzo contenuto in salvaR1, e legge il valore di quell'indirizzo
;	LDR R1,R1,#0    visto che R1 = n1, posso accede al valore cosi

	LDR R2,R2,#0	;doppio accesso, ora in R1 = l'indirizzo contenuto in pn1
	LDR R2,R2,#0	;ora ho il contenuto di n1


	NOT R2,R2	;complemento a 1 su R2
	ADD R2,R2,#1	;R2 = -R2
	ADD R1,R1,R2	; R1 = R1 -R2
	BRN seneg
	BRP sepos
	BRNZP fine	;se R1 = 0, allora RET

seneg	ADD R0,R0,#-1
	BRNZP fine

sepos	ADD R0,R0,#1

fine	LD R1,salvar1
	LD R2,salvar2
	RET

salvar1	.blkw	1
salvar2	.blkw	1
	.end
