# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Prática 01 – Programação de procedimentos em linguagem de montagem
# Programa 03
# Grupo: Gabriel Henrique de Freitas e João Matheus Cachoeira

    .text
    jal     zero, main

soma_digitos:
    addi    sp, sp, -8
    sw      ra, 0(sp)
    sw      s0, 4(sp)

    addi    s0, a2, 0

    addi    t0, zero, 10
    blt     s0, t0, caso_base

    addi    a6, s0, 0
    addi    a7, zero, 10
    jal     ra, resto_divisao

    addi    t1, a0, 0

    addi    a2, s0, 0
    addi    a7, zero, 10
    div     a2, a2, a7

    jal     ra, soma_digitos

    add     a0, a0, t1
    jal     zero, fim_soma

caso_base:
    addi    a0, s0, 0

fim_soma:
    lw      ra, 0(sp)
    lw      s0, 4(sp)
    addi    sp, sp, 8
    jalr    zero, ra, 0

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

main:
    addi    a2, zero, 255
    jal     ra, soma_digitos

    addi    a7, zero, 10
    ecall