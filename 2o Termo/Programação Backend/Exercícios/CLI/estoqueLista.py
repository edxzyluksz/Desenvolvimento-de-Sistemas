estoqueAtual = ["Camisa", "Calça", "Meia"]

print(f"O estoque atual possui {estoqueAtual}")

estoqueAtual.append("Sapato")
estoqueAtual.append("Cinto")
estoqueAtual.append("Gravata")


# Melhor opção seria o extend para vários itens de uma só vez

print(f"O estoque atual possui {estoqueAtual}")

print(f"Agora existem {len(estoqueAtual)} produtos no estoque!")