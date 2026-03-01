use dbAula;

SELECT * FROM Agenda;

-- O SGBD PRIMEIRO BUSCA TODA CONDIÇÃO QUE SEJA VERDADEIRA NO WHERE PARA APLICAR O UPDATE.
-- NO WORKBENCH, O COMANDO WHERE NECESSITA ESTAR CONTIDO NO UPDATE DADO AO SAFE MODE (DESATIVÁVEL PORÉM NÃO RECOMENDADO)
UPDATE Agenda SET
	telefone = '157novotel'
WHERE id = 2;

-- Poxa, escrevi o telefone errado... O que faço? UPDATE novamente.

UPDATE Agenda SET
	telefone = '157875'
WHERE id = 2;


create table Estados (
	codigo_ibge int not null primary key,
	sigla char(2) not null,
	nome varchar(40) not null
);

/*
-- NÃO FAÇA ISSO

UPDATE Agenda SET
	telefone = '157875'
WHERE id > 0; -- Todo ID maior que zero terá o telefone acima
*/