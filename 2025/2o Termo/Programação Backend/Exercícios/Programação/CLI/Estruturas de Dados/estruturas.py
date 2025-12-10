itens_comprados = ["camiseta", "caneca", "camiseta", "chaveiro", "caneca", "meia"]
detalhes_cliente = ("maria.silva@email.com", "Rua das Flores, 123", "SP")
precos_produtos = {"camiseta": 35.00, "caneca": 25.00, "chaveiro": 10.00, "meia": 15.00}

# Conjunto (Set)
produtos_unicos = set(itens_comprados)

# Dicionário (Dict)
valor_pedido = sum(precos_produtos[item] for item in itens_comprados)

# Lista (List)
pedido_final = [(item, precos_produtos[item]) for item in itens_comprados]

# Tupla (Tuple)
cliente = detalhes_cliente[0].split("@")[0]

# Fim
print("Cliente:", cliente)
print("Produtos únicos:", produtos_unicos)
print("Pedido final:", pedido_final)
print("Valor total: R$", valor_pedido)
