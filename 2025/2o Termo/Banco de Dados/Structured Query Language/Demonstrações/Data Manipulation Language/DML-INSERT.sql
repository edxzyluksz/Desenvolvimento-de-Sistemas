create database dbAula;
use dbAula;

CREATE TABLE Agenda(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NOME VARCHAR(50) NOT NULL,
TELEFONE VARCHAR(20)
); 


INSERT INTO Agenda(nome, telefone)
	VALUES('Melissa', '(11)1234-1234');

INSERT INTO Agenda(nome)
	VALUE('Zé');
    
INSERT INTO Agenda(telefone)
	VALUES('(21) 4321-4789'); 

/* Como nome é NOT NULL, o script acima não pode ser executado */

INSERT INTO Agenda(nome, telefone)
	VALUES('Abigail', '(21) 7532-1597'),
		  ('Fernandinho', '(33) 11111111'),
		  ('Jhony', '7891478523');

INSERT INTO Agenda(id, nome, telefone)
	VALUES(10, 'Prof. Well', '(0800)-TOPZERA');

INSERT INTO Agenda(nome, telefone)
	VALUES('Fernandinha', '123');
    
INSERT INTO Agenda(id, nome, telefone)
	VALUES(5, 'Aninha', '1234');
    
/* Jhony já possui o id = 5, portanto Aninha não pode ser inserida*/
    
SELECT * from Agenda where id = 20;

INSERT INTO Agenda VALUES (6, 'Prof. Diogo', '1258');

SELECT * FROM Agenda;