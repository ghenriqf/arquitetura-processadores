.text
	addi, t0, zero, 6
	addi, t1, zero, 5
	
	bne t0, t1, D1 # if t0 == t1, s0 = 1
	addi s0, zero, 1
	
	D1: beq t0, t1, D2 # if se t0 != t1, s1 = 1
	addi s1, zero, 1
	
	D2: bge t0, t1, D3 # if t0 < t1, s1 = 1 
	addi s2, zero, 1
	
	D3: blt t1, t0, D4 # if t0 <= t1, s3 = 1
	addi s3, zero, 1
	
	D4: bge t1, t0, D5 # if t0 > t1, s4 = 1
	addi s4, zero, 1
	
	D5: blt t0, t1, D6 # if t0 >= t1, s5 = 1
	addi s5, zero, 1
	
	D7: addi a7, zero, 10 # return 0;
	ecall	