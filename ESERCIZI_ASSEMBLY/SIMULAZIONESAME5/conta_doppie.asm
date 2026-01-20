;scrivere il sottoprogramma contadoppie
;input:
;R0 = indirizzo di un array di codice ASCII di un carattere di testo(no MAIUSC)
;R1 = indirizzo di fine array
;output:
;R0 = numero di lettere doppie(coppie di lettere consecutive uguali)
;NB: non contiene sequenze di lettere uguali di lunghezza maggiore di 2
;-------------------------------programmma chiamante---------------------------
		.orig x3000
		LEA R0,f1
		LEA R1,endf1	;endf1 punta alla cella successiva alla fine della frase
		ADD R1,R1,#-2	;l'ultimo carattere è il terminatore, quindi si fa -2
		JSR CONTA_DOPPIE
		LEA R0,f2
		LEA R1,endf2	;endf1 punta alla cella successiva alla fine della frase
		ADD R1,R1,#-2	;l'ultimo carattere è il terminatore, quindi si fa -2
		JSR CONTA_DOPPIE
stop		BRNZP stop
		
f1	.stringz 	"aafbb"
endf1	.blkw	1
f2	.stringz 	"aacvbb"
endf2	.blkw	1
;------------------------------sottoprogramma-------------------------------
CONTA_DOPPIE	ST R2,sr2	;newR0
		ST R3,sr3	;tmp
		ST R4,sr4	;tmp2

;operazioni pre - programma
;R2 = new indirizzo di inizio array
;R1 = indirizzo di fine
;R0 = contatore

		ADD R2,R0,#0
		AND R0,R0,#0
		NOT R1,R1
		ADD R1,R1,#1	;R1 = -R1

ciclo		ADD R3,R2,R1	;R3 = R2 - R1
		BRZP fine	;finito quando R2 >= R1

		LDR R3,R2,#0	;stringa(i)
		LDR R4,R2,#1	;stringa(i+1)

		NOT R4,R4
		ADD R4,R4,#1
		
		ADD R3,R3,R4	; R4 = R3 - R4 -> confronto stringa(i) con stringa(i+1)
		BRNP diverse
		ADD R0,R0,#1	;cont = cont + 1
		ADD R2,R2,#2	;shift di 2 celle
		BRNZP ciclo

diverse		ADD R2,R2,#1	;shift di una cella
		BRNZP ciclo

fine		LD R2,sr2
		LD R3,sr3	;tmp
		LD R4,sr4	;tmp2
		RET
sr2	.blkw	1
sr3	.blkw	1
sr4	.blkw	1
;----------------------------------------------------------------------------------
	.end