# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Prática 01 – Programação de procedimentos em linguagem de montagem
# Programa 02
# Grupo: Gabriel Henrique de Freitas e João Matheus Cachoeira

    .text
    jal     zero, main

ehprimo:
    addi    sp, sp, -12
    sw      ra, 0(sp)
    sw      s0, 4(sp)
    sw      s1, 8(sp)

    addi    s0, zero, 2      
    addi    s1, a0, 0        

ehprimo_loop:
    bge     s0, s1, ehprimo_fim

    addi    a7, s0, 0        
    jal     ra, resto_divisao

    beq     a0, zero, numero_nao_primo

    addi    s0, s0, 1
    jal     zero, ehprimo_loop

numero_nao_primo:
    lw      ra, 0(sp)
    lw      s0, 4(sp)
    lw      s1, 8(sp)
    addi    sp, sp, 12

    addi    a0, zero, 0
    jalr    zero, ra, 0

ehprimo_fim:
    lw      ra, 0(sp)
    lw      s0, 4(sp)
    lw      s1, 8(sp)
    addi    sp, sp, 12

    addi    a0, zero, 1
    jalr    zero, ra, 0


resto_divisao:
    addi    sp, sp, -8
    sw      ra, 0(sp)
    sw      s0, 4(sp)

    addi    s0, a7, 0

resto_divisao_loop:
    blt     a0, s0, resto_divisao_fim
    sub     a0, a0, s0
    jal     zero, resto_divisao_loop

resto_divisao_fim:
    lw      ra, 0(sp)
    lw      s0, 4(sp)
    addi    sp, sp, 8
    jalr    zero, ra, 0


main:
    addi    a0, zero, 7
    jal     ra, ehprimo

    addi    a7, zero, 10
    ecall