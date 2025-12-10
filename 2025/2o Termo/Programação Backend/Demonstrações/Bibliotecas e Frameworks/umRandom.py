import random

	# 1. Definir a lista de nomes que você quer usar
nomes_lista = ["Alice", "Bob", "Carlos", "Diana", "Eva", "Fábio", "Giovana"]

	# 2. Verificar se a lista não está vazia para evitar erros
if nomes_lista:

    	# 3. Usar a função random.choice() para escolher um nome aleatoriamente
    nome_escolhido = random.choice(nomes_lista)

    	# 4. Exibir o resultado
    print("A lista de participantes é:", nomes_lista)
    print("---")
    print(f"O nome escolhido aleatoriamente foi: {nome_escolhido}")

else:
    print("A lista de nomes está vazia. Por favor, adicione nomes para poder sortear.")
