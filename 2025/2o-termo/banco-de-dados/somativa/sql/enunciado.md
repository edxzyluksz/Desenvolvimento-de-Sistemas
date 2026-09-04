# Atividade Prática – Banco de Dados de Controle de Estoque

## Conteúdo envolvido

- DDL
- DML (INSERT, UPDATE, DELETE)
- DQL (SELECT, JOIN, GROUP BY, HAVING, funções, filtros)
- INNER JOIN, LEFT JOIN
- Consultas com 1, 2 e 3 tabelas

Uma empresa possui um sistema de controle de estoque que registra produtos, categorias, fornecedores e movimentações (entradas e saídas).
Os alunos deverão criar o banco, inserir dados, manipular registros e consultar informações.

## 1. Script de Criação do Banco (DDL)

- Criar o banco de dados com nome `dbControleEstoque`.

### Tabela `Categorias`

- `Id` – auto incremento – chave primária
- `Nome` – texto – 50 caracteres

### Tabela `Fornecedores`

- `Id` – auto incremento – chave primária
- `Nome` – texto – 100 caracteres
- `Cidade` – texto – 50 caracteres

### Tabela `Produtos`

- `Id` – auto incremento – chave primária
- `Nome` – texto – 100 caracteres
- `Preço`
- `Estoque` – inteiro – padrão `0`
- `IdCategoria`
- `IdFornecedor`

### Tabela `Movimentacoes`

- `Id` – auto incremento – chave primária
- `IdProduto`
- `Tipo` – enumerador – valores possíveis `{Entrada, Saída}`
- `Quantidade` – inteiro
- `DataMovimentacao`

## 2. Dados Iniciais (DML – INSERT)

### Inserir em `Categorias`

- Informática
- Papelaria
- Limpeza
- Mobiliário

### Inserir em `Fornecedores`

- Tech Distribuidora – São Paulo
- PapelMais – Campinas
- MoveisMax – Santos
- LimpezaPro – São Paulo

### Inserir em `Produtos` (nome, preço, estoque, categoria, fornecedor)

- Mouse Óptico – 35.90, 50, 1, 1
- Teclado USB – 49.90, 30, 1, 1
- Caderno 200 folhas – 12.00, 80, 2, 2
- Detergente 500 ml – 3.50, 100, 3, 4
- Cadeira Escritório – 350.00, 12, 4, 3
- Lapiseira 0.7mm – 6.90, 60, 2, 2

### Inserir em `Movimentacoes` (produto, tipo, quantidade)

- 1, Entrada, 20
- 1, Saída, 5
- 2, Entrada, 30
- 3, Saída, 10
- 4, Entrada, 50
- 5, Entrada, 5
- 6, Saída, 2

## 3. Lista de Exercícios

### Bloco 1 — DML Básico

1. Insira 3 novos produtos na tabela `Produtos`.
   - Inventar categoria e fornecedor existentes.
2. Atualize o preço de um produto aumentando-o em 10%.
3. Aumente o estoque de um produto em 15 unidades.
4. Delete um produto que esteja com estoque `0`.
5. Corrija o nome de algum fornecedor.

### Bloco 2 — SELECT Básico e Filtros

1. Liste todos os produtos com preço maior que `20`.
2. Exiba produtos ordenados por estoque (do maior para o menor).
3. Mostre apenas produtos da categoria `Papelaria`.
4. Mostre os produtos cujo nome começa com a letra `C`.
5. Liste fornecedores da cidade de `São Paulo`.

### Bloco 3 — JOINs (INNER / LEFT)

1. Liste produtos com suas categorias (com `INNER JOIN`).
2. Liste produtos com seus fornecedores (com `INNER JOIN`).
3. Liste todos os produtos com nome, preço, categoria e fornecedor.
4. Liste todas as categorias mesmo que não tenham produtos (com `LEFT JOIN`).
5. Liste todas as movimentações mostrando também o nome do produto.
6. Liste os produtos informando o nome da categoria e o nome do fornecedor.
7. Liste o valor total em estoque (`preço * estoque`) de cada produto.

### Bloco 4 — Agrupamento e HAVING

1. Total de produtos por categoria.
2. Total de movimentações (`ENTRADA` e `SAÍDA`) por produto.
3. Qual a categoria que tem o maior número de produtos?
4. Valor total de estoque por categoria.
5. Liste apenas categorias cujo estoque total ultrapassa `R$ 1000`.
6. Média de preço dos produtos por fornecedor.
7. Quantidade total movimentada por tipo (`ENTRADA` vs `SAÍDA`).
8. Top 3 produtos mais movimentados (somando entradas e saídas).

### Consultas Extras

- Produto com menor estoque.
- Produto mais caro de cada categoria.
- Lista de produtos que nunca tiveram movimentação (`LEFT JOIN` + `IS NULL`).
- Preço médio de produtos de cada categoria (`HAVING > 20`).
- Extra: crie uma VIEW chamada `vw_produtos_completos` contendo produto, categoria e fornecedor.

> Atenção: Submeta um arquivo com o seu nome e com a extensão `.sql`.
