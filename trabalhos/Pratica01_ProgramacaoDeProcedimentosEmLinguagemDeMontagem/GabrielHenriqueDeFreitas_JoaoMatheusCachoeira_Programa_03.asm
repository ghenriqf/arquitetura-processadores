# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Prática 01 – Programação de procedimentos em linguagem de montagem
# Programa 02
# Grupo: Gabriel Henrique de Freitas e João Matheus Cachoeira
   
    .text
    jal     zero, main

main:
    addi    a2, zero, 10
    addi    a3, zero, 5

    jal     ra, mdc

    addi    a7, zero, 10         # exit
    ecall

mdc:
    addi    sp, sp, -4          # reserva espaço na stack
    sw      ra, 0(sp)           # salva ra

    beq     a2, a3, mdc_fim     # if (a==b)          
    bgt     a2, a3, maior       # if (a>b) 
    blt     a2, a3, menor

menor:
    sub     a3, a3, a2
    jal     ra, mdc
    jal     zero, mdc_fim

maior:
    sub     a2, a2, a3
    jal     ra, mdc

mdc_fim:
    lw      ra, 0(sp)
    addi    sp, sp, 4

    jalr     zero, ra, 0