;confronto 2 numeri con sottoprogramma
;R0 = -1 se num1<num2
;R0 = 0 se num1=num2
;R0 = +1 se num1>num2
;-----------------------programma chimante--------------------------
	.orig x3000
	LD R1,n1
	LD R2,n2
	JSR confr

	LD R1,n1
	LD R2,n1
	JSR confr

	LD R1,n2
	LD R2,n1
	JSR confr

	LD R1,n2
	LD R2,n4
	JSR confr

	LD R1,n3
	LD R2,n4
	JSR confr

	LD R1,n1
	LD R2,n3
	JSR confr
stoqui	BRNZP	stoqui

n1	.fill	10
n2	.fill	20
n3	.fill	-10
n4	.fill	-20
;-------------------------sottoprogramma----------------------------
confr	ST R1,salvar1
	ST R2,salvar2
	AND R0,R0,#0	;AZZERO R0(DOVE ANDRA IL RIS)
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
