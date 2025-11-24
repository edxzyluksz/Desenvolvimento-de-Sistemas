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

INSERT INTO estados (codigo_ibge, sigla, nome) VALUES
(11, 'RO', 'Rondônia'),
(12, 'AC', 'Acre'),
(13, 'AM', 'Amazonas'),
(14, 'RR', 'Roraima'),
(15, 'PA', 'Pará'),
(16, 'AP', 'Amapá'),
(17, 'TO', 'Tocantins'),
(21, 'MA', 'Maranhão'),
(22, 'PI', 'Piauí'),
(23, 'CE', 'Ceará'),
(24, 'RN', 'Rio Grande do Norte'),
(25, 'PB', 'Paraíba'),
(26, 'PE', 'Pernambuco'),
(27, 'AL', 'Alagoas'),
(28, 'SE', 'Sergipe'),
(29, 'BA', 'Bahia'),
(31, 'MG', 'Minas Gerais'),
(32, 'ES', 'Espírito Santo'),
(33, 'RJ', 'Rio de Janeiro'),
(35, 'SP', 'São Paulo'),
(41, 'PR', 'Paraná'),
(42, 'SC', 'Santa Catarina'),
(43, 'RS', 'Rio Grande do Sul'),
(50, 'MS', 'Mato Grosso do Sul'),
(51, 'MT', 'Mato Grosso'),
(52, 'GO', 'Goiás'),
(53, 'DF', 'Distrito Federal');

select * from estados


-- SINTAXE GERAL

/* UPDATE <tabela> values
<campo> = <valor>
<campo> = <valor> 
<campo> = <valor> 
<campo> = <valor>
where <condições>; */
