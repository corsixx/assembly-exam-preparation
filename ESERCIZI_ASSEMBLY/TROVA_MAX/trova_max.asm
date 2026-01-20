;scrive il sottoprogramma trova max
;input:
;R0 = indirizzo della prima cella di un array di interi
;output:
;R0 = masismo elemento contenuto in array
;---------------------sottoprogramma---------------------------------
		.orig x3000
		LEA R0,array
		JSR TROVA_MAX
		LEA R0,array1
		JSR TROVA_MAX
stop		BRNZP 	stop
array	.fill	-56
	.fill	47
	.fill	12
	.fill	-8
	.fill 	0
array1	.fill	-56
	.fill	-80
	.fill	-12
	.fill	-100
	.fill 	0
;---------------------programma chiamante-------------------------------
TROVA_MAX	ST R1,sr1
		ST R2,sr2
		ST R3,sr3
		
		LDR R1,R0,#0	;MAX = R1
		BRZ fine
		ADD R0,R0,#1	;i++

ciclo		LDR R2,R0,#0	;R2 = array(i)
		BRZ fine
		NOT R3,R2
		ADD R3,R3,#1	; R3 = -R2
		ADD R3,R1,R3	; R3 = MAX - R3(notR2)
		BRZP noNewMAX
		ADD R1,R2,#0	;MOV MAX <- R2(array(i))
noNewMAX	ADD R0,R0,#1
		BRNZP ciclo
fine		ADD R0,R1,#0	;sposto il massimo trovato in R0
		LD R1,sr1
		LD R2,sr2
		LD R3,sr3
		RET
sr1	.blkw	1
sr2	.blkw	1
sr3	.blkw	1
;---------------------------------------------------------------------
	.end		