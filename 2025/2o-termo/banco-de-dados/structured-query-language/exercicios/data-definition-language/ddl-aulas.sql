create database dba10_escola;
USE dbA10_Escola;

-- Tabela Cursos
CREATE TABLE cursos (
id	int not null auto_increment primary key,
sigla   	varchar (20),
descricao   varchar(60)
);

-- Tabela Turmas
CREATE TABLE turmas (
id 				int 			not null auto_increment,
siglaTurma  	varchar(10),
descricao   	varchar(60),
semestreInicio  char(6),
semestreFim 	char(6),
id_Curso 		int 			not null,
				primary key(id),
				foreign key fk_Curso_Turma (id_Curso) references Cursos(id)
);

-- Tabela Estados
CREATE TABLE estados (
sigla 	char(2) 		not null primary key,
nome 	varchar(20) 	not null
);

-- Tabela Cidades
CREATE TABLE cidades(
id 			int 			not null primary key auto_increment,
nome 		varchar(120) 	not null,
siglaEstado char(2),
foreign key fk_UF_Cidade (siglaEstado) references Estados(sigla)
);

CREATE TABLE tiposLogradouro(
siglaTipo varchar(10) 		not null primary key,
tipoLogradouro varchar(40) 	not null
);

-- Tabela de Bairros
CREATE TABLE bairros(
id int 					not null auto_increment primary key,
nomeBairro varchar(40)	not null
);

-- Tabela de Logradouros
CREATE TABLE logradouros(
cep 		char(8) 		not null primary key,
siglaTipo 	varchar(10) 	not null,
logradouro 	varchar(120) 	not null,
idBairro 	int 			not null,
idCidade 	int 			not null,
foreign key fk_SiglaLog_TiposLogra (siglaTipo) 
	references TiposLogradouro (siglaTipo),
foreign key fk_IdBairro_Bairros (idBairro)
	references Bairros(id),
foreign key fk_IdCidade_Cidades (idCidade)
	references Cidades(id)
);

-- Tabela Alunos
CREATE TABLE alunos (
id 			int 			not null auto_increment primary key,
nome 		varchar(120) 	not null,
email 		varchar(120) 	not null unique,
cep 		char(8) 		not null,
numeroEnd 	varchar(10) 	not null,
complemento varchar (20),
foreign key fk_CEP_Alunos (cep) references logradouros(cep)
);	

-- Tabela de Tipos de Contato
CREATE TABLE tiposContato(
id int not null auto_increment primary key,
descricao varchar(40)
);

-- Tabela de Telefone Alunos
CREATE TABLE telefones_Alunos(
telefone varchar(12) not null,
idAluno int,
nomeContato varchar(40),
idTipo int not null,
primary key(telefone, idAluno),
foreign key fk_IdAluno_Alunos (idAluno) references TiposContato(id)
);

-- Tabela de Situações
CREATE TABLE tiposSituacao(
id int not null auto_increment primary key,
descricao varchar(20) not null
);

-- Tabela de Matrículas
CREATE TABLE matriculas(
matricula varchar(10) not null primary key,
dataMatricula date default(current_date),
idTipoSituacao int not null,
idAluno int not null,
idTurma int not null,
foreign key fk_IdTipoSit_TiposSit (idTipoSituacao) references tiposSituacao(id),
foreign key fk_IdAluno_Alunos (idAluno) references alunos(id),
foreign key fk_IdTurma_turmas (idTurma) references Turmas(id)
);

-- Tabela de Professores
CREATE TABLE professores (
id 			int 			not null auto_increment primary key,
nome 		varchar(120) 	not null,
email 		varchar(120) 	not null unique,
cep 		char(8) 		not null,
numeroEnd 	varchar(10) 	not null,
complemento varchar (20),
foreign key fk_CEP_Alunos (cep) references logradouros(cep)
);

-- Tabela de Materias
CREATE TABLE disciplinas(
id int not null auto_increment primary key,
siglaDisciplina varchar(10) not null,
descricao varchar(40) not null
);

-- Tabela de Classes
CREATE TABLE classes(
matricula varchar(20) not null,
idProfessor int not null,
idDisciplina int not null,
primary key(matricula, idProfessor, idDisciplina),
foreign key fk_Matriculas_Matricula (matricula) references matriculas(matricula),
foreign key fk_idProf_Professores(idProfessor) references professores(id),
foreign key fk_idDisc_Disciplinas(idDisciplina) references disciplinas(id)
);

-- Tabela Frequências
CREATE TABLE frequencias(
id int not null,
data date default(current_date),
aula1 char(1),
aula2 char(1),
aula3 char(1),
aula4 char(1),
aula5 char(1),
matricula varchar(10) not null,
idProfessor int not null,
idDisciplina int not null,
foreign key fk_Classes_Freq (matricula, idProfessor, idDisciplina) 
references Classes(matricula, idProfessor, idDisciplina)
);

-- Tabela tipo Avaliações
CREATE TABLE tiposAvaliacao(
id int not null auto_increment primary key,
descricao varchar (40) not null
);

-- Tabela Avaliações
CREATE TABLE avaliacoes(
id int not null auto_increment primary key,
data date default(current_date),
id_TipoAvaliacao int not null,
nota decimal(5,2) not null check(nota between 0 and 10),
matricula varchar(10) not null,
idProfessor int not null,
idDisciplina int not null,
foreign key fk_Classes_Ava (matricula, idProfessor, idDisciplina) 
references Classes(matricula, idProfessor, idDisciplina),
foreign key fk_IdTiposAval (id_TipoAvaliacao) references TiposAvaliacao(id)
);



