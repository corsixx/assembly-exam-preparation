;ESERCIZIO 1 VARIANTE 3
;R1 = indirizzo cella memoria di num1 e R2 = indirizzo cella memoria dindirizzo cella memoria di num2
;OUTPUT
;R0 = -1 se num1<num2
;R0 = 0 se num1=num2
;R0 = 1 se num1>num2

;--------------------PROGRAMMA CHIMANTE---------------------------
	.orig x3000
	LEA R1,n1	;indirizzo num1
	LEA R2,n2	;NB: n1 e la label che corrisponde all'indirizzo di n1
	JSR confr

	LEA R1,n1
	LEA R2,n1
	JSR confr

	LEA R1,n2
	LEA R2,n1
	JSR confr

	LEA R1,n2
	LEA R2,n4
	JSR confr

	LEA R1,n3
	LEA R2,n4
	JSR confr

	LEA R1,n1
	LEA R2,n3
	JSR confr
stoqui	BRNZP	stoqui

n1	.fill	10
n2	.fill	20
n3	.fill	-10
n4	.fill	-20
;-------------------SOTTOPROGRAMMA--------------------------------

confr	ST R1,salvar1
	ST R2,salvar2
	AND R0,R0,#0	;AZZERO R0(DOVE ANDRA IL RIS)

	
	LDR R1,R1,#0	;accedo all valore dentro la cella e lo salvo sulla cella stessa solo perche e un valore scalare
	LDR R2,R2,#0

	NOT R2,R2	;complemento a 1 su R2
	ADD R2,R2,#1	;R2 = -R2
	ADD R1,R1,R2	; R1 = R1 -R2
	BRN seneg
	BRP sepos
	BRNZP fine	;se R1 = 0, allora RET

seneg	ADD R0,R0,#-1
	BRNZP fine

sepos	ADD R0,R0,#1

fine	LDI R1,salvar1
	LDI R2,salvar2
	RET

salvar1	.blkw	1
salvar2	.blkw	1
	.end
