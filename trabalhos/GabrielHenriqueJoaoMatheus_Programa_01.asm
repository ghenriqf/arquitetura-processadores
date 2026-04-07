.data
vetor_dias:
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
    .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF

msg_entrada_a: .asciz "Entre com o numero da aula (de 0 a 15) ou 99 para sair: "
msg_entrada_b: .asciz "Entre com o numero do aluno (de 0 a 31): "
msg_entrada_c: .asciz "Entre com o tipo de registro (presenca = 1; ausencia = 0): "

.text
    addi t6, zero, 99   # valor de parada

while:
    # 🔹 ler dia
    addi a7, zero, 4
    la a0, msg_entrada_a
    ecall

    addi a7, zero, 5
    ecall
    add s0, zero, a0   # s0 = dia

    # 🔹 verificar saída
    beq s0, t6, fim_while

    # 🔹 ler aluno
    addi a7, zero, 4
    la a0, msg_entrada_b
    ecall

    addi a7, zero, 5
    ecall
    add s1, zero, a0   # s1 = aluno

    # 🔹 ler tipo (1 ou 0)
    addi a7, zero, 4
    la a0, msg_entrada_c
    ecall

    addi a7, zero, 5
    ecall
    add s2, zero, a0   # s2 = tipo

    # 🔹 acessar vetor_dias[dia]
    la t0, vetor_dias
    slli t1, s0, 2      # dia * 4
    add  t2, t0, t1     # endereço do dia
    lw   t3, 0(t2)      # valor do dia

    # 🔹 criar máscara (1 << aluno)
    addi t4, zero, 1
    sll  t4, t4, s1

    # 🔹 se for falta (0), faz XOR
    bne s2, zero, salvar   # se for 1 → não faz nada
    xor t3, t3, t4         # se for 0 → alterna (vira falta)

salvar:
    sw t3, 0(t2)

    j while

fim_while:
    addi a7, zero, 10
    ecall