# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Avaliação 01 – Programação em Linguagem de Montagem
# Programa 02
# Nome: Gabriel Henrique de Freitas e João Matheus Cachoeira
	.data

msg_x:  .asciz  "Entre com o valor de X: "
msg_y:  .asciz  "Entre com o valor de Y: "
msg_r:  .asciz  "Resultado: "

        .text

        # leitura de X
        addi    a7, zero, 4             # imprimir string
        la      a0, msg_x
        ecall
        addi    a7, zero, 5             # leitura de inteiro
        ecall
        add     s0, zero, a0           # s0 = X

        # leitura de Y
        addi    a7, zero, 4
        la      a0, msg_y
        ecall
        addi    a7, zero, 5
        ecall
        add     s1, zero, a0           # s1 = Y

        add     s2, zero, zero         # s2 = resultado = 0

loop:
        beq     s1, zero, fim          # se Y == 0 termina

        andi    t0, s1, 1              # t0 = bit menos significativo de Y
        beq     t0, zero, desloca      # se bit == 0 nao soma

        add     s2, s2, s0             # resultado += X

desloca:
        slli    s0, s0, 1              # X <<= 1 (X dobra)
        srli    s1, s1, 1              # Y >>= 1 (Y cai pela metade)
        jal     zero, loop

fim:
        addi    a7, zero, 4
        la      a0, msg_r
        ecall
        addi    a7, zero, 1            # imprimir inteiro
        add     a0, zero, s2           # argumento = resultado
        ecall