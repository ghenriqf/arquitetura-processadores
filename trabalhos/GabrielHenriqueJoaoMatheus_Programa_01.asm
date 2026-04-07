# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Avaliação 01 – Programação em Linguagem de Montagem
# Programa 01
# Nome: Gabriel Henrique de Freitas e João Matheus Cachoeira

.data
	vetor_dias:
	        .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
	        .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
	        .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
	        .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
	        
	msg_entrada_a: .asciz "Entre com o número da aula (de 0 a 15):"
        
	msg_entrada_b: .asciz "Entre com o número do aluno (de 0 a 31):"
	
	msg_entrada_c: .asciz "Entre com o tipo do registro (presença = 1; ausência = 0):"
	
	msg_entrada_d: .asciz "Digite 99 se quiser encerrar:"
        
.text
	addi t1, zero, 99 # guarda valor de condição para encerramento do programa
	addi a0, zero, 0 # garante que a0 não guarde lixo de memoria
	
	while:
		beq t1, a0, fim_while # se o valor digitado for 99 encerra
    		
    		#  comandos para escrever string no console
		addi a7, zero, 4
		la a0, msg_entrada_a
		ecall
		
		# comandos para executar leitura de um valor inteiro no console
		addi a7, zero, 5
		ecall
		add s0, zero, a0
		
		la t0, vetor_dias
		slli t1, s0, 2
		add t2, t0, t1
		lw t3, 0(t2)
		
		
		
		
		#  comandos para escrever string no console
		addi a7, zero, 4
		la a0, msg_entrada_b
		ecall
		
		# comandos para executar leitura de um valor inteiro no console
		addi a7, zero, 5
		ecall
		add s0, zero, a0
		
		#  comandos para escrever string no console
		addi a7, zero, 4
		la a0, msg_entrada_c
		ecall
		
		# comandos para executar leitura de um valor inteiro no console
		addi a7, zero, 5
		ecall
		add s0, zero, a0
		
		#  comandos para escrever string no console
		addi a7, zero, 4
		la a0, msg_entrada_d
		ecall
		
		# comandos para executar leitura de um valor inteiro no console
		addi a7, zero, 5
		ecall
		add s0, zero, a0
		
		    
		jal zero, while # salta para o começo do while
		
	fim_while:
		nop
