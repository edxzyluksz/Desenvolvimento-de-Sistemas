import os
os.system('cls')

carrinho = [
    {"id": 1, "nome": "Impressora 3D", "preco": 3678.79, "cupom": False},
    {"id": 2, "nome": "Caneta", "preco": 3.00, "cupom": True}
]

tamanhoCarrinhoAtual = len(carrinho)

print(f"Carrinho atual: {carrinho}")

adicionar_frete = {
    "frete": 8
}

for i in range(len(carrinho)):
    carrinho[i].update(adicionar_frete) # Frete adicionado ao pedidos

    verificaCupom = carrinho[i].get("cupom")

    if verificaCupom == True:
        print(f"O produto {i+1} possui cupom.")
    else:
        print(f"O produto {i+1} não possui cupom.")


carrinho.pop(0)

tamanhoCarrinhoDepois = len(carrinho)


if tamanhoCarrinhoAtual > tamanhoCarrinhoDepois:
    print("A lista do carrinho diminuiu.")

print(f"Carrinho atual: {carrinho[0].items()}")