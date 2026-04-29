	.text
	
	jal 	zero, main
	
leaf:	
	# por padrão se espera que os registradores temporarios podem conter valores não confiaveis
	
	# salvando valores dos registradores que vão ser utilizados na pilha
	addi	sp, sp, -4
	sw		t0, 0(sp)
	
	addi	sp, sp, -4
	sw		t1, 0(sp)
	
	addi	sp, sp, -4
	sw		s0, 0(sp)
	
	
	add 	t0, a0, a1		# (g + h)
	add		t1, a2, a3		# (i + j)
	sub		s0, t0, t1		# f = (g + h) - (i + j)
	add		a0, zero, s0	# guarda em a0 o valor de f
	
	# retornando os valores
	lw 	s0, 0(sp)
	lw 	t1, 4(sp)
	lw	t0, 8(sp)
	
	addi	sp, sp, 12
	
	jalr 	zero, ra, 0

main:
	addi	a0, zero, 1 	# g = 1
	addi 	a1, zero, 2 	# h = 2
	addi	a2, zero, 3 	# i = 3
	addi	a3, zero, 4		# j = 4
	
	jal 	ra, leaf