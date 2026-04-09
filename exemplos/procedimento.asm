	.text
	
	jal 	zero, main
soma:	
	add 	a0, a7, a6
	jalr 	zero, ra, 0

main:	
	# soma passando 6 e 4
	addi 	a7, zero, 6
	addi 	a6, zero, 4
	
	jal 	ra, soma
	
	#imprimir na tela o resultado
	addi	a7, zero, 1
	ecall