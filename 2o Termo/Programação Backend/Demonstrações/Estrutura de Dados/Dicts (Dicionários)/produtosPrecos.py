produtos = {
    "Notebook": 3500.00,
    "Mouse": 50.00,
    "Teclado": 120.00
}

preco_mouse = produtos.get("Mouse")
print(f"O preço do mouse é {preco_mouse}")

preco_teclado = produtos.get("Teclado")
print(f"O preço do mouse é {preco_teclado}")

preco_webcam = produtos.get("Webcam", "Produto indisponível")
print(f"O preço do mouse é {preco_webcam}")
