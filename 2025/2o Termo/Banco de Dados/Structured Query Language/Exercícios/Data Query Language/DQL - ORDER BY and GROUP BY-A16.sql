USE BancoAula;

CREATE TABLE Trabalhadores (
	id 				int not null primary key,
    nome 			varchar(100) not null,
    perComissao 	decimal(6,2) not null,
    vTotalVendas 	decimal (15,2) not null,
    tipo 			varchar(50)
);

INSERT INTO Trabalhadores(id, nome, perComissao, vTotalVendas, tipo)
	VALUES
		(1, "João", 10, 1000, "Vendedor"),
        (3, "José", 12.50, 25000.00, "Vendedor"),
        (8, "Pedro", 10, 3200, "Gerente"),
        (9, "Antônio", 15, 8000, "Vendedor"),
        (10, "Carlos", 25, 3500.00, "Diretor"),
        (12, "Gabriel", 32, 6500.00, "Vendedor");
        
-- Tabela Geral
SELECT * FROM Trabalhadores;

-- Maior comissão
/* O que esse comando faz? Ele seleciona todas as colunas da tabela Trabalhadores, ordenado pela ordem comissão
(ou seja, já apaga as repetições) e pede que seja do maior pro maior. O truque está no LIMIT 1, que força o MySQL a apresentar
somente uma linha da tabela, que nesse caso, sempre será o trabalhador com a maior comissão.*/
SELECT *
FROM Trabalhadores
ORDER BY perComissao DESC
LIMIT 1;

SELECT *
	,vTotalVendas * (perComissao / 100) as valorComissao
FROM Trabalhadores;

/* Melhor vendedor: Aquele que possui maior total decorrente das vendas */

SELECT * FROM Trabalhadores
WHERE tipo = "Vendedor"
ORDER BY vTotalVendas DESC 
LIMIT 1;

/* Vendedor com maior venda e menor comissão */
--
/* Vendedor com menor venda e maior comissão */
--

/* Valor de comissão paga por tipo */
select tipo, sum(vTotalVendas * percomissao/100) as "Comissão de acordo"
from Trabalhadores
group by tipo;

select tipo
		,sum(vTotalVendas * percomissao/100) as comissaoVendedores
        ,sum(case
			when tipo = "Vendedor" then (vTotalVendas * percomissao/100) * 0.10
            else 0
        end) as comissaoGerente
        ,sum(case
			when tipo in ("Vendedor", "Gerente") then (vTotalVendas * percomissao/100) * 0.15
            else 0
        end) as comissaoDiretor
	from Trabalhadores
group by tipo;
--

        
