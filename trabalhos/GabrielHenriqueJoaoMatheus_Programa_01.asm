# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Avaliação 01 – Programação em Linguagem de Montagem
# Programa 01
# Nome: Gabriel Henrique de Freitas e João Matheus Cachoeira

        .data

# Vetor de 16 dias; bit=1 indica presenca, bit=0 indica ausencia
vetor_dias:
        .word   0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF  # dias  0 a  3
        .word   0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF  # dias  4 a  7
        .word   0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF  # dias  8 a 11
        .word   0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF  # dias 12 a 15

msg_a:  .asciz  "Entre com o numero da aula (0 a 15): "
msg_b:  .asciz  "Entre com o numero do aluno (0 a 31): "
msg_c:  .asciz  "Entre com o tipo (presenca = 1; ausencia = 0): "

        .text

loop:
        # leitura do dia
        addi    a7, zero, 4             # imprimir string
        la      a0, msg_a
        ecall
        addi    a7, zero, 5             # leitura de inteiro
        ecall
        add     s0, zero, a0           # s0 = dia (0..15)

        # leitura do aluno
        addi    a7, zero, 4
        la      a0, msg_b
        ecall
        addi    a7, zero, 5
        ecall
        add     s1, zero, a0           # s1 = aluno (0..31)

        # leitura do tipo
        addi    a7, zero, 4
        la      a0, msg_c
        ecall
        addi    a7, zero, 5
        ecall
        add     s2, zero, a0           # s2 = tipo (1=presenca, 0=ausencia)

        # calcula endereco de vetor_dias[dia]
        la      t0, vetor_dias
        slli    t1, s0, 2              # offset = dia * 4 bytes
        add     t2, t0, t1             # t2 = endereco do elemento do dia
        lw      t3, 0(t2)              # t3 = valor atual do dia

        # constroi mascara: bit do aluno
        addi    t4, zero, 1
        sll     t4, t4, s1             # t4 = 1 << aluno

        # presenca ou ausencia?
        beq     s2, zero, ausencia

presenca:
        or      t3, t3, t4             # liga bit do aluno (bit = 1)
        jal     zero, salvar

ausencia:
        xori    t5, t4, -1             # inverte mascara
        and     t3, t3, t5             # desliga bit do aluno (bit = 0)

salvar:
        sw      t3, 0(t2)              # salva valor atualizado no vetor
        jal     zero, loop             # volta ao inicio