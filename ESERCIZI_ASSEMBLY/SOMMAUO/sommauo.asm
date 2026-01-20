;input:
;R0 = num1
;R1 = num2

;output:
;R1 = num1+num2
;R0 = -1 se underflow
;R0 = 0 se somma ok
;R0 = +1 se overflow

;-----------------------programma chimante----------------------
	.orig x3000
	LD R0,num1
	LD R1,num2
	JSR sommaou
	LD R0,num1
	LD R1,num3
	JSR sommaou
	LD R0,num3
	LD R1,num3
	JSR sommaou
	LD R0,num5
	LD R1,num6
	JSR sommaou
	LD R0,num5
	LD R1,num7
	JSR sommaou
	LD R0,num1
	LD R1,num6
	JSR sommaou
stoqui BRNZP stoqui

num1	.fill	32767
num2	.fill	5
num3 	.fill 	10
num4	.fill 	0
num5	.fill	-32768
num6	.fill	-5
num7 	.fill 	-10
;----------------------sottoprogramma--------------------------
sommaou	ADD R0,R0,#0	;aggiorno CC
	BRN n1neg
	BRZP n1pos

;qui num1 pos
n1pos	AND R1,R1,R1	;aggiorno CC
	BRNZ disc
	BRP concpos

;qui num1 neg
n1neg	AND R1,R1,R1	;aggiorno CC
	BRZP disc
	BRN concneg

disc	ADD R1,R1,R0	;R1=num1+num2/-num1+num2/0+0
	BRNZP sommaok

concpos	ADD R1,R1,R0	;R1=+num1+num2
	BRN overflow
	BRZP sommaok
	
concneg	ADD R1,R1,R0	;R1=(-num1)+(-num2)
	BRP underflow
	BRNZ sommaok

;qui se disc o se concopos/neg con risultato con giusto segno
sommaok	AND R0,R0,#0	;R0 = sommaok
	RET

overflow AND R0,R0,#0	;azzero R0
	 ADD R0,R0,#+1	;R0 = +1 overflow
	 RET

underflow AND R0,R0,#0	;azzero R0
	  ADD R0,R0,#-1	;R0 = +1 UNDERflow
	  REt
;------------------------------------------------------------------
	.end
