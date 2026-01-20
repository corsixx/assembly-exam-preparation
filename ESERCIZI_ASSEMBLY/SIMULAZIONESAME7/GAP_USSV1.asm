;REALIZZARE OSTTOPROGRAMMA GAP_A55
;input:
;R0 = prima cella di aun array terminata da 0
;output:
;R0 = differenza tra valore assoluto massimo e valore assoluto minimo
;-------------------------programma chiamante---------------------------
		.orig x3000
		LEA R0,array
		JSR GAP_A55
stop		BRNZP	stop

array	.fill	112
	.fill	-27
	.fill	-12
	.fill	45
	.fill	15
	.fill	0
;-------------------------sottoprogramma-------------------------------
GAP_A55		ST R1,sr1	;new puntatore
		ST R2,sr2	;valore num(i)
		ST R3,sr3	;MAX
		ST R4,sr4	;MIN
		ST R5,sr5	;tmp
		
		AND R3,R3,#0
		AND R4,R4,#0
		ADD R1,R0,#0	;MOV R0 <- R1
		LDR R2,R1,#0	;leggo il primo numero, sezero vado alla fine
		BRZ fine	;se fosse vuoto in R0 non torni nulla
		BRP giapos
;se negativo
		NOT R2,R2
		ADD R2,R2,#1	;trasformo in valore assoluto
	
giapos		ADD R3,R2,#0	;R3 = MAX(valore assoluto, quindi sempre positivo)
		ADD R4,R2,#0	;R4 = MIN
		ADD R1,R1,#1	;i++
		
ciclo		LDR R2,R1,#0	;leggo R2 = array(i)
		BRZ fine
		BRN senegativo
;se positivo converto
		NOT R2,R2
		ADD R2,R2,#1
;se negativo faccio i calcoli
senegativo	NOT R0, R2
		ADD R0,R0,#1	;|R2| tmp
		ADD R5,R3,R2	;R5 = max - R2
		BRN newMAX

		ADD R5,R4,R2	;R5 = min - R2
		BRP newMIN

next		ADD R1,R1,#1	;i++
		BRNZP ciclo


newMAX		ADD R3,R0,#0	;MOV R3(oldMAX) <- R0(|newMAX|)
		BRNZP next

newMIN		ADD R4,R0,#0
		BRNZP next

fine		NOT R4,R4
		ADD R4,R4,#1
		ADD R0,R3,R4

		LD R1,sr1
		LD R2,sr2
		LD R3,sr3
		LD R4,sr4
		LD R5,sr5
		RET
sr1	.blkw	1
sr2	.blkw	1
sr3	.blkw	1
sr4	.blkw	1
sr5	.blkw	1
;--------------------------------------------------------------------------
	.end