# Conjunto 1: Clientes que compraram livros
compraram_livros = {"Alice", "Bob", "Charlie", "David"}

# Conjunto 2: Clientes que compraram E-books (digital)
compraram_ebooks = {"Alice", "Charlie", "Eve", "Frank"}

# Interseção (Elementos em COMUM) - Clientes que compraram livros E e-books
compraram_ambos = compraram_livros.intersection(compraram_ebooks)

# União (TODOS os elementos, sem duplicatas) - Clientes que compraram livros OU E-books
qualquer_compra = compraram_livros.union(compraram_ebooks)

print(f"Clientes que compraram Livros e E-books (Interseção): {compraram_ambos}")
print(f"Clientes que fizeram qualquer compra (União): {qualquer_compra}")