;input:
;R0 = indirizzo primo elemento array ordinati per valori crescenti
;R1 = indirizzo ultimo elemento array
;output:
;array con i numeri ordinati per valori descescenti
;--------------------programma chiamante-------------------------------
	.orig x3000
	LEA	R0,array
	LEA	R1,endA
	JSR	decrescenti
stoqui	BRNZP stoqui
array	.fill 	10
	.fill	20
	.fill	30
	.fill	40
endA	.fill	50
;----------------------sottopogramma----------------------------------
decrescenti	ST R2,salvar2
		ST R3,salvar3	;registro in cui mettiamo il valore attuale di array(i)
				
ciclo		LDR R2,R0,#0	;R2 = array(i)
		LDR R3,R1,#0	;R3 = array(endA)
		STR R2,R1,#0
		STR R3,R0,#0
		ADD R0,R0,#1	;i++
		ADD R1,R1,#-1	;endA--
		NOT R2,R1
		ADD R2,R2,#1	; R1 = -ARR(endA)
		ADD R2,R0,R2	;R2 = indirizzo di array(i) - indirizzi fine array
		BRN ciclo	;se sono uguali allora vai alla fine
 					
		LD R2,salvar2
		LD R3,salvar3
		RET

salvar2 .blkw 1
salvar3 .blkw 1
;--------------------------------------------------------------------------------
	.end