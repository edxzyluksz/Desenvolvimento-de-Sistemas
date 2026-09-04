use dbLoja;

CREATE TABLE Funcionarios (
id int not null auto_increment primary key,
nome varchar (100) not null,
salario decimal (10, 2) not null,
cargo varchar (50) not null
);

INSERT INTO Funcionarios (nome, salario, cargo)
VALUES
	('Billy', 10000.00, 'Professor'),
    ('Wagner', 100, 'Coordenador'),
    ('Caio', 123456, 'Diretor'),
    ('Ronaldo', 9999, 'Coordenador'),
    ('Well', 10001.01, 'Professor'),
    ('Natacha', 3000, 'Funcionário'),
    ('Fabiana', 4700, 'Funcionário'),
    ('Diogo', 10001.00, 'Professor'),
    ('César', 12500, 'Professor'),
    ('Clodoaldo', 13000, 'Professor'),
    ('Vidigal', 15000, 'Professor');
    
SELECT * FROM Funcionarios;

-- Listando funcionários com salario maior que 3k 
-- Natacha e Wagner não aparecem
SELECT * FROM Funcionarios WHERE salario > 3000;

-- Aumentando o salário dos funcionários em 15% (Sem persistir a informação)
SELECT *, ROUND(salario  * 1.15, 2) as salario_atual FROM Funcionarios;

-- Descontando o salário dos professores em 35% (Sem persistir a informação)
SELECT *, ROUND(salario * 0.65, 2) as salario_descontado FROM Funcionarios WHERE cargo = 'Professor';

-- Aumentando o salário do diretor em 50% (Persistindo a informação) com DML - UPDATE
UPDATE Funcionarios
SET salario = salario * 1.50
WHERE id = 3;
-- WHERE cargo = 'Diretor'; - Não funciona normalmente dado o safe update mode