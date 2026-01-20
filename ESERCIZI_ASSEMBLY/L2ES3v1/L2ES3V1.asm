;input:
;R0 = numero in modulo e segno
;output:
;R0 = numero in complemento a 2
;------------------------programma chiamante--------------------------
			.orig x3000
			LD R0,n1
			JSR trovacomplemento
			LD R0,n2
			JSR trovacomplemento
			LD R0,n3
			JSR trovacomplemento
			LD R0,n4
			JSR trovacomplemento
stoqui			BRNZP	stoqui
			
n1	.fill	x33FA
n2	.fill 	X84AE
n3	.fill	x8000
n4	.fill	x0000
;----------------------sottoprogramma--------------------------------
trovacomplemento	ST R1,salvar1
			LD R1,mask
			ADD R0,R0,#0
			BRZP fine
neg			AND R0,R0,R1	;0111 1111 1111 1111 AND numero negativo(1xxx xxxx xxxx xxxx) ci fa ignorare il segno(1)
			NOT R0,R0
			ADD R0,R0,#1
			LD R1,salvar1
fine			RET
salvar1	.blkw	1
mask	.fill	x7FFF
;--------------------------------------------------------------------
			.end