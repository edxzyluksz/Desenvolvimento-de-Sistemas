const DBContent = {

SQLDDL: `    CREATE DATABASE ConEduc;
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
`,

    SQLDML: `    /* --- INSERÇÃO DE DADOS NAS TABELAS INDEPENDENTES (Fortes) --- */
    INSERT INTO Municipios (nome, UF) VALUES
    ('São Paulo', 'SP'),
    ('Campinas', 'SP'),
    ('Rio de Janeiro', 'RJ');

    /* Bairros */
    INSERT INTO Bairros (nomeBairro) VALUES
    ('Jardim Europa'),
    ('Centro'),
    ('Vila Mariana');

    /* TiposLogradouro (Tipos de Logradouro) */
    INSERT INTO TiposLogradouro (descricao) VALUES
    ('Rua'),
    ('Avenida'),
    ('Praça');

    /* Logradouro (Endereço - depende de Bairros, Municipios, TiposLogradouro) */
    INSERT INTO Logradouro (CEP, nomeLogradouro, id_tipoLogradouro, id_bairro, id_municipio) VALUES
    ('01440000', 'Europa', 2, 1, 1), 
    ('13010001', 'Orozimbo Maia', 2, 2, 2), 
    ('20010000', 'Quinze de Novembro', 3, 2, 3); 

    /* Infos_Escola (Informações da Escola - depende de Logradouro) */
    INSERT INTO Infos_Escola (nomeInstituicao, CEP, numeroEndereco, telefone_secretaria) VALUES
    ('Colégio Conhecimento e Educação', '01440000', '1234', '1130889900');

    /* Clientes (Alunos) */
    INSERT INTO Clientes (nomeAluno, nomeResponsavel, email, inicioMatricula, numeroFIAPS) VALUES
    ('Maria Silva', 'João Silva', 'maria.s@email.com', '2023-02-01', 0),
    ('Pedro Santos', 'Ana Santos', 'pedro.s@email.com', '2023-02-01', 0),
    ('Lucas Oliveira', 'Carla Oliveira', 'lucas.o@email.com', '2024-02-01', 0);

    /* Professores */
    INSERT INTO Professores (nome, email, inicioAtricuicao, principaisFormacoes) VALUES
    ('Dr. Roberto Almeida', 'roberto.a@colegio.com', '2020-08-15', 'Doutorado em Matemática, Licenciatura em Física'),
    ('Ms. Fernanda Costa', 'fernanda.c@colegio.com', '2021-02-10', 'Mestrado em Letras, Pós em Linguística');

    /* Gestores */
    INSERT INTO Gestores (nome, email) VALUES
    ('Diretora Helena Souza', 'helena.s@colegio.com'),
    ('Coordenador Ricardo Melo', 'ricardo.m@colegio.com');

    /* Materias (Disciplinas) */
    INSERT INTO Materias (nome, descricao) VALUES
    ('Matemática', 'Estudo de números, estruturas e variações.'),
    ('Língua Portuguesa', 'Estudo da gramática e literatura brasileira.');

    /* Laboratorios */
    INSERT INTO Laboratorios (nome, sigla) VALUES
    ('Laboratório de Informática 1', 'LAB-I1'),
    ('Laboratório de Ciências', 'LAB-C1');

    /* Turmas */
    INSERT INTO Turmas (tipoEnsinoBasico, anoEnsinoBasico, inicialTurma, dataInicio, dataFim) VALUES
    ('F', '9', 'A', '2024-02-19', '2024-12-15'), /* Ensino Fundamental - 9º Ano A */
    ('M', '3', 'B', '2024-02-19', '2024-12-15'); /* Ensino Médio - 3º Ano B */

    /* StatusLab (Status do Laboratório) */
    INSERT INTO StatusLab (tipoStatus) VALUES
    ('Disponível'),
    ('Em Uso'),
    ('Manutenção');

    /* --- INSERÇÃO DE DADOS NAS TABELAS DEPENDENTES (Fracas e N:M) --- */

    /* Fiaps (Fichas Individuais de Acompanhamento Pedagógico - depende de Clientes) */
    INSERT INTO Fiaps (matricula, data_e_hora, justificativa) VALUES
    (1, '2024-03-05 10:00:00', 'Atraso na entrega de trabalho de Matemática.'),
    (2, '2024-03-05 14:30:00', 'Discussão em sala de aula.');

    /* Boletim (depende de Clientes) */
    INSERT INTO Boletim (matricula, mediaSemestre1, mediaSemestre2, mediaFinal) VALUES
    (1, 80, 85, 83),
    (2, 75, 70, 73);

    /* Boletim_Materias (depende de Clientes e Materias) */
    INSERT INTO Boletim_Materias (matricula, id_materia, semestre, nota1, nota2, nota3, nota4) VALUES
    (1, 1, 1, 75, 85, 80, 90), 
    (1, 2, 1, 90, 80, 85, 95), 
    (2, 1, 1, 70, 75, 65, 80); 

    /* Eventos (depende de Gestores) */
    INSERT INTO Eventos (nomeEvento, descricao, data_e_hora, id_gestor) VALUES
    ('Feira de Ciências', 'Exposição de projetos científicos dos alunos.', '2024-06-15 09:00:00', 1),
    ('Reunião de Pais e Mestres', 'Discussão sobre o desempenho dos alunos e metas.', '2024-04-20 18:30:00', 2);

    /* Agenda_Laboratorio (depende de StatusLab, Professores, Laboratorios) */
    INSERT INTO Agenda_Laboratorio (id_status, id_professor, id_laboratorio, diaAquisicao, HoraEntrada, HoraSaida, justificativa_aquisicao) VALUES
    (2, 1, 1, '2024-04-10', '13:00:00', '15:00:00', 'Uso para aula prática de Geometria.');

    /* Aulas (depende de Materias e Turmas) */
    INSERT INTO Aulas (NumerodaAula, id_materia, id_turma, pauta, dataAula) VALUES
    (1, 1, 1, 'Revisão de Álgebra Linear. Início da pauta de Cálculo.', '2024-04-01'),
    (2, 2, 1, 'Leitura e interpretação de texto: Machado de Assis.', '2024-04-02');

    /* Materias_Turmas (Relação N:M - depende de Materias e Turmas) */
    INSERT INTO Materias_Turmas (id_materia, id_turma) VALUES
    (1, 1), 
    (2, 1), 
    (2, 2); 

    /* Turmas_Professores (Relação N:M - depende de Turmas e Professores) */
    INSERT INTO Turmas_Professores (id_turma, id_professor) VALUES
    (1, 1), 
    (1, 2), 
    (2, 2);`
}