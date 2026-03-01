create dbAula_10
use dbAula_10

CREATE TABLE Clientes (
	idCliente 	  int          primary key auto_increment,
    nome 	 	  varchar(100) not null,
    email	  	  varchar(150) unique,
    dataCadastro  date		   default(current_date),
    idade         int          check(idade >= 18)
);

CREATE TABLE Funcionarios (
idFuncionario int 			primary key,
nome 		  varchar(100)  not null,
cargo 	 	  varchar(50),
salario 	  decimal(10, 2)
);

ALTER TABLE Funcionarios ADD departamento varchar(50);
ALTER TABLE Funcionarios ADD idGerente int;
ALTER TABLE Funcionarios modify cargo varchar(100);

ALTER TABLE Funcionarios ADD CONSTRAINT chk_salario
	check(salario >=0);

ALTER TABLE	Funcionarios DROP COLUMN departamento;
SELECT * FROM Funcionarios