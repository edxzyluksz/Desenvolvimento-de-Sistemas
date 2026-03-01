estoque = [
    {
        "id": 1,
        "produto": "Notebook Gamer",
        "preco": 4500.00,
        "quantidade": 5
    },

    {
        "id": 2,
        "produto": "Mouse Sem Fio",
        "preco": 120.50,
        "quantidade": 50
    },

    {
        "id": 3,
        "produto": "Teclado Mecânico",
        "preco": 350.00,
        "quantidade": 12
    }
]

print(estoque[0]["produto"])

print("--- RELATÓRIO DE ESTOQUE ---")
for item in estoque:
    nome = item["produto"]
    valor = item["preco"]
    print(f"O produto {nome} custa R$ {valor}")