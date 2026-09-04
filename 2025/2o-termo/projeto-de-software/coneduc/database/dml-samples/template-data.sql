/* --- INSERÇÃO DE DADOS NAS TABELAS INDEPENDENTES (Fortes) --- */
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
(2, 2);