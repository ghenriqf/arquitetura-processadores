	.text
	jal 	zero, main
	
main:
	addi 	a7, zero, 24
	addi	a6, zero, 16
	
	jal 	ra, mdc		# jal mdc
	
	addi 	a7, zero, 10 	# return 0;
	ecall

mdc:	
	addi 	sp, sp, -8
	sw	a7, 4(sp)
	sw	a6, 0(sp)
	
mdc_while:
	beq	a7, a6, mdc_fim
	
	blt	a7, a6, mdc_menor
	sub	a7, a7, a6
	
	jal	zero, mdc_while

mdc_menor:
	sub	a6, a6, a7
	jal	zero, mdc_while

mdc_fim:
	add	a0, zero, a6
	
	lw	a6, 0(sp)
	lw	a7, 4(sp)
	
	addi	sp, sp, 8
	
	jalr	zero, ra, 0	# jalr ra