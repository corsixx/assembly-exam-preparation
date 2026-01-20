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
		ST R6,sr6	;tmp
		
		AND R3,R3,#0
		AND R4,R4,#0
		ADD R1,R0,#0
		LDR R2,R1,#0
		BRZ fine	;se fosse vuoto in R0 non torni nulla
		BRP giapos
;se negativo
		NOT R2,R2
		ADD R2,R2,#1	
giapos		ADD R3,R2,#0	;R3 = MAX(valore assoluto, quindi sempre positivo)
		ADD R4,R2,#0	;R4 = MIN
		ADD R1,R1,#1	;i++
		
ciclo		LDR R2,R1,#0	;leggo R2 = array(i)
		BRZ fine
		BRP giavalass
;se num(i) = neg
		NOT R2,R2
		ADD R2,R2,#1
;in questo punto il valore deve essere gia in valore assoluto
giavalass	NOT R5,R2	;R5 registro tmp per salvare il negativo
		ADD R5,R5,#1
		ADD R6,R5,R3	;R6 = -|num(i)| + MAX
		BRZP nonumMAX
		ADD R3,R5,#0	;NEWMAX = |num(i)|
		BRNZP next	;se il nuovo valore è maggiore di MAX , non puo essere anche minore di min

nonumMAX	ADD R6,R5,R4	;R6 = -|num(i)| + MIN
		BRNZ next
		ADD R4,R5,#0	;NEWMIN = |num(i)|
;ci arrivo in ogni caso
next		ADD R1,R1,#1;
		BRNZP fine

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
sr6	.blkw	1
;--------------------------------------------------------------------------
	.end