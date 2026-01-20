;scrive il sottoprogramma per calcolare fibonacci
;input:
;R0 = numero intero N
;output:
;R0 = fibonacci
;NB : Fn(successivo) = Fn-1(attuale) + Fn-2(precedente)

;-------------------programma chiamante-----------------------------
	.orig	x3000
	LD R0,num1
	JSR FIBONACCI
	
	LD R0,num2
	JSR FIBONACCI
	
	LD R0,num3
	JSR FIBONACCI
stop	BRNZP	stop

num1	.fill	10
num2	.fill	2
num3	.fill	-4
;-------------------sottoprogramma-----------------------------

FIBONACCI	
;caso base: N <= 0
		AND R0,R0,R0	;aggiorno i CC
		BRN R0zero
		BRZ fine
;caso base N =1 o N=2
		ADD R0,R0,#-2	;R1 = R0 - 1
		BRP nouno
		AND R0,R0,#0
		ADD R0,R0,#1	;se N = 1 o 2 ret 1
		BRNZP fine
	
;qui se N>2
nouno		ST R1,sr1
		ST R2,sr2
		ST R3,sr3
		AND R1,R1,#0
		ADD R1,R1,#1	;R1 = F(N-1)	(attuale)
		ADD R2,R1,#0	;R2 = F(N-2)	(precedente)
;se N>=3 per forza di cose N-1=1 e N-2=1

ciclo		ADD R3,R1,R2	;R3 = F(N)
		ADD R0,R0,#-1	;decremento N
		BRZ fineciclo
		ADD R2,R1,#0	; R2 = R1(attaule->newprecedente)
		ADD R1,R3,#0	; R1 = R3(risultato=newattuale)
		BRNZP ciclo

fineciclo	ADD R0,R3,#0	;sposto il risultato in R3
		BRNZP	fine

R0zero		AND R0,R0,#0	;se R0 all'inzio < 0, il risultato = 0
		
fine		LD R1,sr1
		LD R2,sr2
		LD R3,sr3
		RET
sr1	.blkw	1
sr2	.blkw	1
sr3	.blkw	1
;----------------------------------------------------------------------
	.end