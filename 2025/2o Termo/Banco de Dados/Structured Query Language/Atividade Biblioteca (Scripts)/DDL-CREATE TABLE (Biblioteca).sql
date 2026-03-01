create database AtividadeBiblioteca;
use AtividadeBiblioteca;

create table Autores(
id 			integer 		not null primary key auto_increment,
nomeAutor 	varchar(120) 	not null
);

create table Generos(
id 			int 			not null auto_increment,
nomeGenero 	varchar(50) 	not null,
descricao 	varchar(100) 	not null
);

create table Livros(
	id 				integer 		not null primary key,
	nomeLivro 		varchar(200) 	not null,
    id_genero		int				not null,
    numeroPaginas 	int 			not null,
    foreign key (id_genero) references Generos(id)
);

create table Livro_Autores(
id_livro integer not null primary key,
id_autor integer not null primary key,
-- Chaves primárias e estrangeiras (ao mesmo tempo)
foreign key (id_autor) references Autores(id),
foreign key (id_livro) references Livros(id)
);

SHOW TABLES;
