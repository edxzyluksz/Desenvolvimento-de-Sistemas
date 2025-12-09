# Teste de pertencimento rápido (Performance)

# Criando um Set de usuários online

usuarios_online = {"Ana", "Bruno", "Carla", "Daniel", "Elias", "Fernanda"}

# Nome a ser verificado
nome_buscado = "Bruno"
outro_nome = "Gabriel"

# Verificação de pertencimento usando operador 'in'
esta_online = nome_buscado in usuarios_online
nao_esta_online = outro_nome in usuarios_online

print(f"O usuário {nome_buscado} está online? {'Sim' if esta_online else 'Não'}")
print(f"O usuário {outro_nome} está online? {'Sim' if nao_esta_online else 'Não'}")


# Adicionando novo usuário
usuarios_online.add("Gabriel")

print(f"Novo Set após adição: {usuarios_online}")