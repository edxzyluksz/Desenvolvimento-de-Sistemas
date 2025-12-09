CREATE DATABASE ConEduc;
USE ConEduc;
                                                
                                                /*ENTIDADES FORTES*/
                                                
                                                    /* Cargos */
CREATE TABLE Clientes (
    matricula INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeAluno VARCHAR (100),
    nomeResponsavel VARCHAR (100),
    email VARCHAR (120),
    inicioMatricula DATE,
    numeroFIAPS INTEGER
);

CREATE TABLE Professores (
    id_professor INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (300),
    email VARCHAR (200),
    inicioAtricuicao DATE,
    principaisFormacoes TEXT
);

CREATE TABLE Gestores (
    id_gestor INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (300),
    email VARCHAR (200)
);

												/* Objetos da Instituição */
CREATE TABLE Materias (
    id_materia INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100),
    descricao VARCHAR (300)
);

CREATE TABLE Laboratorios (
    id_laboratorio INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (150),
    sigla VARCHAR (7)
);

CREATE TABLE Turmas (
    id_turma INTEGER PRIMARY KEY AUTO_INCREMENT,
    tipoEnsinoBasico CHAR (1),
    anoEnsinoBasico CHAR (4),
    inicialTurma CHAR (1),
    dataInicio DATE,
    dataFim DATE
);

CREATE TABLE StatusLab (
    id_status INTEGER PRIMARY KEY AUTO_INCREMENT,
    tipoStatus VARCHAR (20)
);
													/* Endereço */
CREATE TABLE Municipios (
    id_municipio INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100),
    UF CHAR (2)
);

CREATE TABLE Bairros (
    id_bairro INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeBairro VARCHAR (150)
);

CREATE TABLE TiposLogradouro (
    id_tipoLogradouro INTEGER PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR (100)
);
												/*ENTIDADES FRACAS*/
                                                
											/* Objetos da Instituição */
                                                
CREATE TABLE Fiaps (
    id_fiap INTEGER PRIMARY KEY AUTO_INCREMENT,
    matricula INTEGER,
    data_e_hora DATETIME,
    justificativa TEXT
);
 
ALTER TABLE Fiaps ADD CONSTRAINT FK_Fiaps
    FOREIGN KEY (matricula)
    REFERENCES Clientes(matricula);

CREATE TABLE Boletim (
    matricula INTEGER PRIMARY KEY,
    mediaSemestre1 INTEGER,
    mediaSemestre2 INTEGER,
    mediaFinal INTEGER
);
 
ALTER TABLE Boletim ADD CONSTRAINT FK_Boletim_Aluno
    FOREIGN KEY (matricula)
    REFERENCES Clientes(matricula);

CREATE TABLE Boletim_Materias (
    matricula INTEGER,
    id_materia INTEGER,
    semestre INTEGER,
    nota1 INTEGER,
    nota2 INTEGER,
    nota3 INTEGER,
    nota4 INTEGER,
    PRIMARY KEY (matricula, id_materia)
);
 
ALTER TABLE Boletim_Materias ADD CONSTRAINT FK_Boletim_Materias_Cliente
    FOREIGN KEY (matricula)
    REFERENCES Clientes(matricula);
    
ALTER TABLE Boletim_Materias ADD CONSTRAINT FK_Boletim_Materias_Materia
    FOREIGN KEY (id_materia)
    REFERENCES Materias(id_materia);


CREATE TABLE Eventos (
    id_evento INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeEvento VARCHAR (100),
    descricao VARCHAR (500),
    data_e_hora DATETIME,
    id_gestor INTEGER
);
 
ALTER TABLE Eventos ADD CONSTRAINT FK_Eventos_Gestor
    FOREIGN KEY (id_gestor)
    REFERENCES Gestores(id_gestor);


CREATE TABLE Agenda_Laboratorio (
    id_aquisicao INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_status INTEGER,
    id_professor INTEGER,
    id_laboratorio INTEGER,
    diaAquisicao DATE,
    HoraEntrada TIME,
    HoraSaida TIME,
    justificativa_aquisicao VARCHAR (100)
);
 

ALTER TABLE Agenda_Laboratorio ADD CONSTRAINT FK_Agenda_Laboratorio_Status
    FOREIGN KEY (id_status)
    REFERENCES StatusLab(id_status);

ALTER TABLE Agenda_Laboratorio ADD CONSTRAINT FK_Agenda_Laboratorio_Professor
    FOREIGN KEY (id_professor)
    REFERENCES Professores(id_professor);

ALTER TABLE Agenda_Laboratorio ADD CONSTRAINT FK_Agenda_Laboratorio_Laboratorio
    FOREIGN KEY (id_laboratorio)
    REFERENCES Laboratorios(id_laboratorio);
    
CREATE TABLE Aulas (
    id_aulaSistema INTEGER PRIMARY KEY AUTO_INCREMENT,
    NumerodaAula INTEGER,
    id_materia INTEGER,
    id_turma INTEGER,
    pauta TEXT,
    dataAula DATE
);
 
ALTER TABLE Aulas ADD CONSTRAINT FK_Aulas_Materia
    FOREIGN KEY (id_materia)
    REFERENCES Materias(id_materia);

ALTER TABLE Aulas ADD CONSTRAINT FK_Aulas_Turma
    FOREIGN KEY (id_turma)
    REFERENCES Turmas(id_turma);

												/* Endereço */

CREATE TABLE Logradouro (
    CEP CHAR (8) PRIMARY KEY,
    nomeLogradouro VARCHAR (300),
    id_tipoLogradouro INTEGER,
    id_bairro INTEGER,
    id_municipio INTEGER
);
 
ALTER TABLE Logradouro ADD CONSTRAINT FK_Logradouro_TipoLogradouro
    FOREIGN KEY (id_tipoLogradouro)
    REFERENCES TiposLogradouro(id_tipoLogradouro);

ALTER TABLE Logradouro ADD CONSTRAINT FK_Logradouro_Bairro
    FOREIGN KEY (id_bairro)
    REFERENCES Bairros(id_bairro);
    
ALTER TABLE Logradouro ADD CONSTRAINT FK_Logradouro_Municipio
    FOREIGN KEY (id_municipio)
    REFERENCES Municipios(id_municipio);

												/* Informações */

CREATE TABLE Infos_Escola (
    id_alteracao INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeInstituicao VARCHAR (150),
    CEP VARCHAR (9),
    numeroEndereco VARCHAR (10),
    telefone_secretaria VARCHAR (12)
);
 
ALTER TABLE Infos_Escola ADD CONSTRAINT FK_Infos_Escola_Endereco
    FOREIGN KEY (CEP)
    REFERENCES Logradouro(CEP);
    

												/*RELAÇÕES N:M*/

CREATE TABLE Materias_Turmas (
    id_materia INTEGER,
    id_turma INTEGER,
    PRIMARY KEY (id_materia, id_turma)
);
 
ALTER TABLE Materias_Turmas ADD CONSTRAINT FK_Materias_Turmas_Materia
    FOREIGN KEY (id_materia)
    REFERENCES Materias(id_materia);

ALTER TABLE Materias_Turmas ADD CONSTRAINT FK_Materias_Turmas_Turma
	FOREIGN KEY (id_turma)
    REFERENCES Turmas(id_turma);
    

CREATE TABLE Turmas_Professores (
    id_turma INTEGER,
    id_professor INTEGER,
    PRIMARY KEY (id_turma, id_professor)
);
 
ALTER TABLE Turmas_Professores ADD CONSTRAINT FK_Turmas_Professores_Turma
    FOREIGN KEY (id_turma)
    REFERENCES Turmas(id_turma);

ALTER TABLE Turmas_Professores ADD CONSTRAINT FK_Turmas_Professores_Professor
    FOREIGN KEY (id_professor)
    REFERENCES Professores(id_professor);


                                                

    
