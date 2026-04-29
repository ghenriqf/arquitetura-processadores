# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Prática 01 – Programação de procedimentos em linguagem de montagem
# Programa 02
# Grupo: Gabriel Henrique de Freitas 
 
    .text
    jal     zero, main

fatorial:
    addi    a0, zero, 1         

fatorial_loop:
    beq     t0, zero, fatorial_fim   

    mul     a0, a0, t0           
    addi    t0, t0, -1           

    jal     zero, fatorial_loop  

fatorial_fim:
    jalr    zero, ra, 0                    


arranjo:
    addi    sp, sp, -12          # reserva espaço na stack
    sw      ra, 0(sp)            # salva ra
    sw      s0, 4(sp)            # salva s0
    sw      s1, 8(sp)            # salva s1

    # calcula n!
    addi    t0, a2, 0            # t0 = n
    jal     ra, fatorial
    addi    s0, a0, 0            # s0 = n!

    # calcula (n - p)!
    sub     t0, a2, a3           # t0 = n - p
    jal     ra, fatorial
    addi    s1, a0, 0            # s1 = (n-p)!

    # divisão final
    div     a0, s0, s1           # a0 = n! / (n-p)!

    # restaura registradores
    lw      ra, 0(sp)
    lw      s0, 4(sp)
    lw      s1, 8(sp)
    addi    sp, sp, 12

    jalr    zero, ra, 0          # return
          

main:
    addi    a2, zero, 5     # n = 5
    addi    a3, zero, 10    # p = 10

    jal     ra, arranjo

    addi    a7, zero, 10         # exit
    ecall