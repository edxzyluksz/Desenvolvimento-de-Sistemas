# 1. Criação da Tupla (Imutável)
notas_finais= (10.0, 7.5, 8.0, 6.0, 9.5, 8.0, 5.0)
print(f"Tupla de Notas {notas_finais}")
print("-" * 30)

# Queremos saber quantas vezes a nota 8.0 aparece.
contagem_8 = notas_finais.count(8.0)
print(f"Usando count(): A nota 8.0 aparece {contagem_8} vezes(es)")

# Queremos onde saber a nota 9.5 está localizada
indice_NoveMeio = notas_finais.index(9.5)
print(f"Usando index(): A nota 9.5 está no índice {indice_NoveMeio}")

# Vamos encontrar o índice da nota 8.0 (Ele retorna apenas o primeiro índice que encontra)
primeiro_indice_oito = notas_finais.index(8.0)
print(f"Usando index(): A primeira ocorrência de 8.0 está no índice {primeiro_indice_oito}")