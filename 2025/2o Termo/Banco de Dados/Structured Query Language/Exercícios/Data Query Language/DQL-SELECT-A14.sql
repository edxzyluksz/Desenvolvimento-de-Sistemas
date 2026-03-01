use dbLoja;

ALTER TABLE Produtos add categoria varchar(20);

select * from Produtos where categoria is null;

update produtos set categoria = 'Periférico' where id in (1, 2);
update produtos set categoria = 'Tela' where id = 3;
update produtos set categoria = 'Cabo' where nome like '%cabo%';
update produtos set categoria = 'Printer' where nome like '%impressora%';

update produtos set
	   categoria = case
					when id in (1,2) 				then 'Periférico'
                    when id = 3 					then 'Tela'
                    when nome like '%cabo%' 		then 'Cabo'
                    when nome like '%impressora%' 	then 'Printer'
                    else 'Sem categoria'
				 end;
                    

select * from Produtos where categoria is not null;

/* select * from Produtos where categoria = 'Periféricos' 
or categoria = 'Printers'
or categoria  = 'Cabos'
; */

-- Melhor alternativa
select * from produtos where categoria in ('Periféricos', 'Printers', 'Cabos');

create table categorias (
	id int not null auto_increment primary key,
	descricao varchar(20)
);

insert into categorias (descricao)
	values 	('Periféricos'),
			('Telas'),
            ('Cabos'),
            ('Printers');

-- Seleciona todos os produtos que possuem uma categoria que também está presente no campo descrição da tabela categorias
select * from produtos where categoria in (select descricao from categorias);

select * 
	from produtos 
    where categoria in (select descricao 
							from categorias 
							where descricao like 'tela%')
		and quantidade < 5;

alter table produtos 	add data_inclusao date,
						add data_alteracao date;
                        
select * from produtos;

update produtos set
	data_alteracao = current_date()
    , quantidade = quantidade + 200
where id = 2;

update produtos set 
	data_inclusao = current_date() 
where data_inclusao is null;

select nome, data_inclusao, data_alteracao, datediff(data_alteracao, data_inclusao) from produtos;
        
