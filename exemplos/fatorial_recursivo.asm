fatorial_recursivo:
	addi	sp, sp, -8
	sw	ra, -4(sp)
	sw	a7, 0(sp)
	
	addi	t0, zero, 1
	
	blt	a7, t0, fatorial_recursivo_fim

chamada_recursiva:
	addi	a7, a7, -1
	jal	ra, fatorial_recursivo
	
	lw	ra, 4(sp)
	lw	a7, 0(sp)
	
	addi	sp, sp, 8
	
	mul	a0, a0, a7
	jalr	zero, ra, 0
	
fatorial_recursivo_fim:
	addi	a0, zero, 1
	jalr	zero, ra, 0