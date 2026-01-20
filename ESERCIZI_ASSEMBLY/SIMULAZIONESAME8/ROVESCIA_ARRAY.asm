;sottoprogramma rovescia array
;input:
;R0 = indirizzo prima cella array con terminatore 0
;R1 = indirizzo prima cella array di copia
;Devo invertire array1 e metterlo in copia
;---------------------------programma chiamante-----------------------
			.orig x3000
			LEA R0,array
			LEA R1,copy
			JSR ROVESCIA_ARRAY
stop			BRNZP	stop
array	.fill	12
	.fill 	10
	.fill	8
	.fill	4
	.fill	0
copy	.blkw	1
;---------------------------sottoprogramma-----------------------------
ROVESCIA_ARRAY		ST R2,sr2
			ST R3,sr3

			AND R3,R3,#0	;azzero contatore

ciclo			LDR R2,R0,#0
			BRZ riempiCopy
			ADD R3,R3,#1	;cont++
			ADD R0,R0,#0	;i++
			BRNZP ciclo

riempiCopy		ADD R0,R0,#-1	;accedo alla poszione precente per copiare l'array rovesciato
			LDR R2,R0,#0	;metti il numero in R2
			STR R2,R1,#0	;metti il valore di R2 alla prima pos disponibile di copy
			ADD R1,R1,#1
			ADD R3,R3,#-1	;decremento elementi da copiare
			BRNP riempiCopy
;se cont == 0
			
			ST R2,sr2
			ST R3,sr3
			RET
sr2	.blkw	1
sr3	.blkw	1
;------------------------------------------------------------------------
	.end
