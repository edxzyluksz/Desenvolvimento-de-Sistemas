/* CREATE DATABASE dbloja;
use dbLoja;

CREATE TABLE Produtos(
	id 			int not null auto_increment primary key,
	nome 		varchar(50),
    preco 		decimal(12,2),
    quantidade 	int
);


INSERT INTO Produtos (nome, preco, quantidade)
	VALUES
		('Teclado', 80, 10),
        ('Mouse', 50, 3),
        ('Monitor', 600, 5),
        ('Cabo HDMI', 25, 100),
        ('Impressora', 1500, 25);
*/
        
SELECT * FROM PRODUTOS;

SELECT nome, quantidade, preco
	FROM Produtos
WHERE id = 3;


-- Essas duas consultas acabam deixando "Mouse" de fora, visto que ele não é maior nem menor que cinquenta, é equivalente.
SELECT nome, quantidade, preco
	FROM Produtos
WHERE preco > 50;

SELECT nome, quantidade, preco
	FROM Produtos
WHERE preco < 50;

-- Sem "as", o nome do campo onde será exibido a operação será literalmente o da conta
SELECT nome, quantidade, preco, quantidade * preco
	FROM Produtos;
    
SELECT nome, quantidade, preco, quantidade * preco as Valor_Item
	FROM Produtos;
    
-- O comando abaixo não é possível, já que o campo "Valor_Item" não existe fisicamente na tabela.
SELECT nome, quantidade, preco, quantidade * preco as Valor_Item
	FROM Produtos
WHERE Valor_Item > 1000;

-- Por isso, caso necessite exibir, coloque o nome literal do campo.
SELECT nome, quantidade, preco, quantidade * preco as Valor_Item
	FROM Produtos
WHERE (quantidade * preco) > 1000;

-- A13.A1 - Vamos Praticar

-- EXERCÍCIO 1
SELECT * FROM Produtos WHERE preco < 100;

-- EXERCÍCIO 2
SELECT nome, quantidade * preco as Valor_Total FROM Produtos;

-- EXERCÍCIO 3
SELECT *,
(quantidade * preco) as Valor_Total FROM Produtos 
WHERE (quantidade * preco) > 500; 

-- EXERCÍCIO 4
SELECT * FROM Produtos WHERE nome != 'Mouse';

-- EXERCÍCIO 5
SELECT * FROM Produtos WHERE quantidade >= 5 and quantidade <= 50;





    

