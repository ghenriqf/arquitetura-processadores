	.text
main:
	addi	a7, zero, 5
	
	jal 	ra, fatorial
	
	addi	a7, zero, 10
	ecall

fatorial:
	addi	a0, zero, 1
	
	
fatorial_while:
	beq		a7, zero, fatorial_fim
	
	mul		a0, a0, a7
	addi	a7, a7, -1
	
	jal		zero, fatorial_while
	
fatorial_fim
	jal		zero, ra, 0