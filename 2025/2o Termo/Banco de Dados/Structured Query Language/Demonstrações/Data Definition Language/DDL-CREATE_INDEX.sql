CREATE DATABASE lab_Indices;
USE lab_Indices; 

CREATE TABLE Clientes(
id 		int not null auto_increment primary key,
nome 	varchar(100),
cpf 	char(11),
sexo 	char(1),
cidade 	varchar(50)
);

DELIMITER //
CREATE PROCEDURE popular_clientes()
BEGIN
	DECLARE i INT DEFAULT 1;
    WHILE i <= 1000000 DO
		INSERT INTO Clientes (nome, cpf, sexo, cidade)
			values (
				CONCAT('Cliente_', i),
                LPAD(i, 11, '0'),
                IF (i % 2 = 0, 'M', 'F'),
                ELT(1 + (i % 5), 'São Paulo', 'Rio', 'Curitiba', 'Recife', 'Salvador')
                );
			SET i = i + 1;
		END WHILE;
END //
DELIMITER ;

SELECT * FROM Clientes;

call popular_clientes();

CREATE INDEX idx_CPF ON Clientes(cpf);
EXPLAIN SELECT * FROM CLIENTES WHERE CPF = '00000005000';

CREATE INDEX idx_CPF ON Clientes(cpf);

SELECT * FROM CLIENTES WHERE sexo = 'M';
CREATE INDEX idx_sexo on clientes(sexo);
