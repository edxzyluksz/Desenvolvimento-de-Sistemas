CREATE DATABASE estoquefic;
USE estoquefic;

CREATE TABLE Categorias(
	id int primary key not null auto_increment,
    nome varchar(50)
);

CREATE TABLE Fornecedores(
	id int primary key not null auto_increment,
    nome varchar(100),
    cidade varchar(50)
);


CREATE TABLE Produtos(
	id int primary key not null auto_increment,
    nome varchar(100),
    preco decimal(10,2),
    estoque int not null,
    id_categoria int,
    id_fornecedor int,
    foreign key (id_categoria) references Categorias(id),
    foreign key (id_fornecedor) references Fornecedores(id)
);



CREATE TABLE Movimentacoes(
	id int primary key not null auto_increment,
    id_produto int,
    tipo enum("Entrada", "Saída"),
    quantidade int,
    dataMovimentacao date,
    foreign key (id_produto) references Produtos(id)
);



INSERT INTO Categorias(nome) values 
	("Informática"),
	("Papelaria"),
	("Limpeza"),
	("Mobiliário");

INSERT INTO Fornecedores(nome, cidade) values
	("Tech Distribuidora", "São Paulo"),
    ("PapelMais", "Campinas"),
    ("MoveisMax", "Santos"),
    ("LimpezaPro", "São Paulo");
    
INSERT INTO Produtos(nome, preco, estoque, id_categoria, id_fornecedor) values
	("Mouse Óptico", 35.90, 50, 1, 1),
    ("Teclado USB", 49.50, 30, 1, 1),
    ("Caderno 200 folhas", 12.00, 80, 2, 2),
    ("Detergente 500 ml", 3.50, 100, 3, 4),
    ("Cadeira Escritório", 350.00, 12, 4, 3),
    ("Lapiseira 0.7mm", 6.90, 60, 2, 2);
    
INSERT INTO Movimentacoes(id_produto, tipo, quantidade) values 
	(1, "Entrada", 20),
    (1, "Saída", 5),
    (2, "Entrada", 30),
    (3, "Saída", 10),
    (4, "Entrada", 5),
    (5, "Entrada", 5),
    (6, "Saída", 2);

-- 1
INSERT INTO Produtos(nome, preco, estoque, id_categoria, id_fornecedor) values
	("Patinho de Borracha p/ Banho", 3.99, 100, 3, 4),
    ("Sangue Falso para Teatro 50ml", 12.50, 20, 5, 4),
    ("Máscara Fantasia Horror", 19.94, 10, 5, 2);

-- a.
INSERT INTO Categorias(nome) values 
	("Artes Cênicas");
  
-- 2.
UPDATE Produtos
SET preco = (preco * 1.10)
WHERE nome = "Patinho de Borracha p/ Banho";

-- 3.
UPDATE Produtos
SET estoque = (estoque + 15)
WHERE nome = "Máscara Fantasia Horror";

-- 4.
DELETE FROM Produtos WHERE estoque = 0;

-- 5.
UPDATE Fornecedores
SET nome = "PapelPlus"
WHERE nome = "PapelMais";

-- 6
SELECT * FROM Produtos where preco > 20;

-- 7
SELECT * FROM Produtos
ORDER BY estoque DESC;

-- 8 
SELECT * FROM Produtos WHERE id_categoria = 2;

-- 9
SELECT * FROM Produtos WHERE nome LIKE "c%";

-- 10
SELECT * FROM Fornecedores WHERE cidade = "São Paulo";

-- 11
SELECT produtos.id, produtos.nome as Produto, categorias.nome as Categoria FROM Produtos
INNER JOIN Categorias
ON Produtos.id_categoria = Categorias.id;

-- 12
SELECT produtos.id, produtos.nome as Produto, fornecedores.nome as Fornecedor FROM Produtos
INNER JOIN Fornecedores
ON PRODUTOS.id_fornecedor = Fornecedores.id;

-- 13
SELECT produtos.id, produtos.nome as Produto, produtos.preco as Preço, categorias.nome as Categoria, fornecedores.nome 
as Fornecedor FROM Produtos
INNER JOIN Fornecedores ON Produtos.id_fornecedor = Fornecedores.id
INNER JOIN Categorias ON Produtos.id_categoria = Categorias.id;

-- 14
SELECT categorias.id, categorias.nome as Categoria, sum(produtos.estoque) as "Estoque Total" FROM Categorias
LEFT JOIN Produtos
ON Categorias.id = Produtos.id_categoria
GROUP BY categorias.id, categorias.nome;

-- 15 
SELECT movimentacoes.id, produtos.nome as Produto, movimentacoes.tipo, movimentacoes.quantidade, movimentacoes.dataMovimentacao 
FROM Movimentacoes
INNER JOIN Produtos
ON Movimentacoes.id_produto = produtos.id;

-- 16
SELECT produtos.id, produtos.nome as Produto, categorias.nome as Categoria, fornecedores.nome as Fornecedor from Produtos
INNER JOIN Categorias ON produtos.id_categoria = categorias.id
INNER JOIN Fornecedores ON produtos.id_fornecedor = fornecedores.id;

-- 17
SELECT id, nome, preco, estoque, (preco * estoque) as valor_total FROM Produtos;

-- 18
SELECT categorias.id, categorias.nome as Categoria, sum(produtos.estoque) as "Estoque Total" FROM Categorias
LEFT JOIN Produtos
ON Categorias.id = Produtos.id_categoria
GROUP BY categorias.id, categorias.nome;

-- 19
SELECT produtos.nome AS Produto, count(movimentacoes.id) AS "Qtde. Movimentacoes" FROM Movimentacoes
INNER JOIN Produtos ON Movimentacoes.id_produto = produtos.id
GROUP BY produtos.nome;

-- 20
SELECT *, count(tipo) as teste FROM Movimentacoes
group by id_produto;

-- 21
SELECT categorias.id, categorias.nome as Categoria, sum(produtos.estoque) as "Estoque Total" FROM Categorias
LEFT JOIN Produtos
ON Categorias.id = Produtos.id_categoria
GROUP BY categorias.id, categorias.nome
ORDER BY sum(produtos.estoque) DESC LIMIT 1;

-- 22
SELECT  id_categoria, sum(preco * estoque) AS "Valor Total de Estoque" FROM  Produtos
GROUP BY  id_categoria;

-- 23
SELECT  id_categoria, sum(preco * estoque) AS "Valor Total de Estoque" FROM  Produtos
GROUP BY  id_categoria
HAVING SUM(preco * estoque) > 1000;

-- 24
SELECT  id_fornecedor, sum(preco) AS "Média p/ Fornecedor" FROM  Produtos
GROUP BY  id_fornecedor;

-- 25
SELECT tipo, sum(quantidade) AS QuantidadeTotal FROM Movimentacoes
GROUP BY tipo;

-- 26
SELECT produtos.nome AS Produto, sum(movimentacoes.quantidade) AS TotalMovimentado FROM Movimentacoes
INNER JOIN Produtos
ON movimentacoes.id_produto = produtos.id
GROUP BY produtos.nome
ORDER BY TotalMovimentado DESC LIMIT 3;

SELECT * FROM Produtos ORDER BY estoque ASC LIMIT 1;

SELECT Produtos.* FROM Produtos
INNER JOIN (
    SELECT id_categoria, MAX(preco) AS maior_preco FROM Produtos
    GROUP BY id_categoria
) AS i
ON produtos.id_categoria = i.id_categoria
AND produtos.preco = i.maior_preco;

SELECT Produtos.*
FROM Produtos
LEFT JOIN Movimentacoes
ON Produtos.id = Movimentacoes.id_produto
WHERE Movimentacoes.id IS NULL;

SELECT Categorias.nome AS Categoria, AVG(Produtos.preco) AS PrecoMedio FROM Produtos
INNER JOIN Categorias ON Produtos.id_categoria = Categorias.id
GROUP BY Categorias.nome
HAVING AVG(Produtos.preco) > 20;

CREATE VIEW vw_produtos_completos AS
SELECT Produtos.id,
       Produtos.nome AS Produto,
       Produtos.preco,
       Produtos.estoque,
       Categorias.nome AS Categoria,
       Fornecedores.nome AS Fornecedor
FROM Produtos
INNER JOIN Categorias ON Produtos.id_categoria = Categorias.id
INNER JOIN Fornecedores ON Produtos.id_fornecedor = Fornecedores.id;






    

    