;input:
;R0 = indirizzo primo elemento array di elementi diversi da 0
;R1 = indirizzo ultimo elemento array
;R2 = N
;output:
;R0 = posizione di N in array partendo da 1, altyrimetni 0 se non fosse presente
;NB: per finire la scansione dell'array devo superare la cella dell'ultimo elelmento
;quindi indirizzo di array(i) > indirizzo ultima cella = risultato > 0
;--------------------programma chiamante-------------------------------
	.orig x3000
	LEA	R0,array
	LD	R2,n1
	LEA	R1,endA
	JSR	confrArr
stoqui	BRNZP stoqui
array	.fill -10
	.fill	10
	.fill	5
	.fill	-5
endA	.fill	50
n1	.fill	-5
;----------------------sottopogramma----------------------------------
confrArr	ST R2,salvar2
		ST R3,salvar3	;registro in cui mettiamo il valore attuale di array(i)
		ST R4,salvar4 	; R4 = I

		AND R4,R4,#0	;azzero r4
		NOT R1,R1	;complemento a 1 per l'elemento fianel array
				;NB: in R1 c'e l'indiirzzo, deve essere un confronto tra indirizzi
		ADD R1,R1,#1	; R1 = -R1 ->cosi possiamo capire se l'array è finito

		NOT R2,R2	;cambio segno a R2 per il confronto
		ADD R2,R2,#1	; R2 = -N


ciclo		ADD R3,R0,R1	;R3 = indirizzo di array(i) - indirizzi fine array
		BRP nontrovato	;se ris = positivo
 
		ADD R4,R4,#1	;i++
 		LDR R3,R0,#0	;R3 = array(i) ->dopo che lo uso per il confronto lo posso ancora usare
		ADD R3,R3,R1	; array(i) - elemento finale ->sezero vai alla fine
		BRZ trovato
		ADD R0,R0,#1	;scorro array di 1
		BRNZP ciclo

trovato		AND R0,R0,#0
		ADD R0,R0,R4	;R0 = pososzione elemento trovato
		BRNZP fine
nontrovato	AND R0,R0,#0

fine		LD R2,salvar2
		LD R3,salvar3
		LD R4,salvar4
		RET

salvar2 .blkw 1
salvar3 .blkw 1
salvar4 .blkw 1
;--------------------------------------------------------------------------------
	.end