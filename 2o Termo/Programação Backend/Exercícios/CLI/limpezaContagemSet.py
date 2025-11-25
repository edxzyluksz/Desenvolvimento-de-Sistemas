import os
os.system('cls')

notas_turma = [7.5, 8.0, 6.6, 9.0, 7.5, 8.0, 5.0, 9.0, 10.0, 6.5]
notas_unicas = set(notas_turma)

print("NOTAS DA TURMA: ")
print(notas_turma)

print("\nQUANTAS NOTAS (SEM REPETIÇÃO) EXISTEM NA LISTA?")
print(f"{len(notas_unicas)} notas...")

print("\nQUAIS SÃO ESSAS NOTAS?")
print(notas_unicas)