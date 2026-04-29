# Disciplina: Arquitetura e Organização de Processadores
# Atividade: Prática 01 – Programação de procedimentos em linguagem de montagem
# Programa 01
# Grupo: Gabriel Henrique de Freitas

    .text
main:
    addi    t0, zero, 5     # t0 = 5 valor para calcular o fatorial

    jal     ra, fatorial    # chama a função fatorial e salva retorno em ra

    addi    a7, zero, 10    # código de saída exit para o ecall
    ecall                   # chama o sistema e finaliza

fatorial:
    addi    a0, zero, 1     # a0 = 1 acumulador do resultado

fatorial_loop:
    beq     t0, zero, fatorial_fim      # se t0 == 0 desvia para fim da função   

    mul     a0, a0, t0      # # a0 = a0 * t0
    addi    t0, t0, -1    # t0 = t0 - 1
    jal     zero, fatorial_loop     # volta para início do loop

fatorial_fim:
    jalr     zero, ra, 0    # retorna para o endereço salvo em ra
