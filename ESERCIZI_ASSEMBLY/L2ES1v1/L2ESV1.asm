;input:
;R0 = indirizzo primo elemento array di elementi diversi da 0
;R1 = numero N
;output:
;R0 = posizione di N in array partendo da 1, altyrimetni 0 se non fosse presente

;--------------------programma chiamante-------------------------------
	.orig x3000
	LEA	R0,array
	LD	R1,n1
	JSR	confrArr
stoqui	BRNZP stoqui
array	.fill -10
	.fill	10
	.fill	5
	.fill	-5
	.fill	0
n1	.fill	-5
;nel programma converto nel numero oppsoto perche cosi se io voglio trovare -5, e ho -5 nell'array, facendo
;5 -5 non lo troverò mai
;----------------------sottopogramma----------------------------------
confrArr	ST R3,salvar3
		ST R2,salvar2
		ST R4,salvar4
		ST R1,salvar1
		
		AND R4,R4,#0	;azzero registri in piu
		AND R2,R2,#0
		AND R3,R3,#0

		ADD R1,R1,#0	;aggiorno i CC
		BRZ sezero 
;se N!= 0 allora lo trasformi in complmento a 1
		NOT R1,R1	;complemento a 1
		ADD R1,R1,#1	;R1 = -R1

ciclo		LDR R4,R0,#0	;accedo alla posizione i dell'array
		BRZ sezero	;se il primo elemnto = 0
		ADD R3,R3,#1	;faccio i+1
		ADD R2,R4,R1	;R2 = array(i) -N
		BRZ uguali
		ADD R0,R0,#1	;vado alla posizione successiva
		BRNP ciclo

uguali		AND R0,R0,#0	;azzeri R0
		ADD R0,R0,R3	;fai R0+i
		BRNZP fine

		 
;se N = 0
sezero	AND R0,R0,#0	;se fosse zero non puo essere uguale a nessun elemento
fine	LD R3,salvar3
	LD R4,salvar4
	LD R2,salvar2
	LD R1,salvar1
	RET
salvar3 .blkw 1
salvar2 .blkw 1
salvar4 .blkw 1
salvar1 .blkw 1
;--------------------------------------------------------------------------------
	.end