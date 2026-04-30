# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Prática 01 – Programação de procedimentos em linguagem de montagem
# Programa 01
# Grupo: Gabriel Henrique de Freitas e João Matheus Cachoeira

    .text
    jal     zero, main

main:
    addi    a6, zero, 45
    addi    a7, zero, 4
    jal     ra, resto_divisao
    
    addi    a7, zero, 1
    ecall

    addi    a7, zero, 10
    ecall

resto_divisao:
    addi    sp, sp, -4
    sw      s0, 0(sp)

    addi    a0, a6, 0
    addi    s0, a7, 0

resto_divsao_loop:
    blt     a0, s0, resto_divisao_fim
    sub     a0, a0, s0
    jal     zero, resto_divsao_loop

resto_divisao_fim:
    lw      s0, 0(sp)
    addi    sp, sp, 4

    jalr    zero, ra, 0