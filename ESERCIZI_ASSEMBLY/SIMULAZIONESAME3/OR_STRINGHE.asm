;SCRIVERE IL SOTTOPROGRAMMA OR_ARRAY
;input:
;R0 = indirizzo di una prima cella di un araray di stringhe
;R1 = una stringa s
;output:
;restituisce l'OR tra ogni stringa dell'array e la stringa ricevuta in R1
;NB: a OR b tutto negato = a negato AND b negato tutto negato
	.orig	x3000
;--------------------programma chiamante--------------------
        LEA R0, array       ; R0 = indirizzo array
        LD  R1, str_val     ; R1 = valore della maschera (caricato direttamente)
        JSR OR_ARRAY
        
STOP    BRnzp STOP          ; Loop infinito per fermare la CPU

; --- DATI DEL CHIAMANTE (Spostati qui per sicurezza) ---
array   .fill b0000111100001111
        .fill b0011001100110011
        .fill b1100110011001100
        .fill x0000          ; Terminatore (BRZ usa questo)
str_val .fill b1111000011110000
;--------------------sottoprogramma-------------------------

OR_ARRAY	ST	R2,sr2

		NOT	R1,R1		;nego stringa1

CICLO		LDR	R2,R0,#0	;R2 = array(i)
		BRZ	fine

		NOT 	R2,R2		;nego stringa(i)
		AND 	R2,R2,R1	;AND FRA R2 E R3 NEGATI	
		NOT	R2,R2		;nego di nuovo R2
		STR	R2,R0,#0
		ADD	R0,R0,#1
		BRNZP	CICLO

fine		LD	R2,sr2
		RET

sr2	.blkw	1	
;-----------------------------------------------------------
		.end