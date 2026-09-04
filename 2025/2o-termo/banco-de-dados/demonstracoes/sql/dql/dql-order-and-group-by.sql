CREATE DATABASE BancoAula;
USE BancoAula;

CREATE TABLE Alunos (
	id 			int 			not null auto_increment primary key,
    nomeAluno 	varchar(50) 	not null,
    nota1		decimal(5,2) 	not null check (nota1 between 0.0 and 10.0),
    nota2 		decimal(5,2) 	not null check (nota2 between 0.0 and 10.0),
    nota3 		decimal(5,2) 	not null check (nota3 between 0.0 and 10.0),
    nota4 		decimal(5,2) 	not null check (nota4 between 0.0 and 10.0),
    curso 		varchar(10) 	not null
);

INSERT INTO Alunos(curso, nomeAluno, nota1, nota2, nota3, nota4)
	VALUES  ("ADS", "Ana", 		8, 7, 6, 9),
			("ELE", "Aline", 	9, 2, 8, 9),
            ("MEC", "Melissa", 	8, 3, 6, 5),
            ("ADS", "Abigail", 	10, 7,6, 7),
            ("ADS", "Rebeca", 	8, 7, 4, 10),
            ("ADS", "Cristina", 1, 6, 3, 6),
            ("ELE", "Fernanda", 8, 7, 6, 7),
            ("MEC", "Olivia", 	4, 7, 7, 9),
            ("ADS", "Regina", 	8, 9, 6, 5),
			("ADS", "Débora", 	6, 7, 2, 5);
            

select *
	from alunos
order by nomeAluno desc;

select nomeAluno, (nota1+nota2+nota3+nota4)/4 AS media
	From Alunos;

select "Média da escola inteira" as descricao,
		avg(nota1+nota2+nota3+nota4) as media
from alunos
group by curso;

select "Média dos alunos" as descricao,
		avg(nota1+nota2+nota3+nota4) as media
from alunos;
            
select curso
	,count(nomeAluno) as totalAlunos
	,avg((nota1+nota2+nota3+nota4)/4) as mediaGeral
	,min((nota1+nota2+nota3+nota4)/4) as menorMedia
	,max((nota1+nota2+nota3+nota4)/4) as maiorMedia
	from alunos
group by curso
having mediaGeral >= 6;

select alunos.*
	,(nota1+nota2+nota3+nota4) / 4 as media
    from alunos
where curso = "ELE";

-- Enquanto a cláusula Where verifica uma condição geral da tabela, "Having" verifica uma condição de agrupamento