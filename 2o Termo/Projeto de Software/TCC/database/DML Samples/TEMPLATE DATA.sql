USE ConEduc;

INSERT INTO Clientes (nomeAluno, nomeResponsavel, email, inicioMatricula, numeroFIAPS)
VALUES
('Ana Silva', 'Carlos Silva', 'ana.silva@example.com', '2024-02-10', 2),
('Pedro Oliveira', 'Marina Oliveira', 'pedro.oliveira@example.com', '2023-09-05', 1),
('Julia Santos', 'Roberto Santos', 'julia.santos@example.com', '2024-01-20', 3);

INSERT INTO Professores (nome, email, inicioAtricuicao, principaisFormacoes)
VALUES
('Mariana Costa', 'mariana.costa@coneduc.com', '2022-03-01', 'Licenciatura em Matemática; Especialização em Educação'),
('Thiago Moreira', 'thiago.moreira@coneduc.com', '2021-02-15', 'Licenciatura em História'),
('Fernanda Lima', 'fernanda.lima@coneduc.com', '2020-05-20', 'Letras; Mestrado em Linguística');

INSERT INTO Gestores (nome, email)
VALUES
('Ricardo Almeida', 'ricardo.almeida@coneduc.com'),
('Patricia Costa', 'patricia.costa@coneduc.com');

INSERT INTO Materias (nome, descricao)
VALUES
('Matemática', 'Cálculos, lógica e resolução de problemas'),
('História', 'Estudo das civilizações e eventos históricos'),
('Português', 'Gramática, interpretação e produção textual');

INSERT INTO Laboratorios (nome, sigla)
VALUES
('Laboratório de Informática', 'LABINFO'),
('Laboratório de Ciências', 'LABCIEN');

INSERT INTO Turmas (tipoEnsinoBasico, anoEnsinoBasico, inicialTurma, dataInicio, dataFim)
VALUES
('F', '2024', 'A', '2024-02-01', '2024-12-15'),
('F', '2024', 'B', '2024-02-01', '2024-12-15');

INSERT INTO StatusLab (tipoStatus)
VALUES
('Agendado'),
('Cancelado'),
('Concluído');

INSERT INTO Municipios (nome, UF)
VALUES
('São Paulo', 'SP'),
('Campinas', 'SP');

INSERT INTO Bairros (nomeBairro)
VALUES
('Centro'),
('Jardim das Flores');

INSERT INTO TiposLogradouro (descricao)
VALUES
('Rua'),
('Avenida'),
('Travessa');

INSERT INTO Logradouro (CEP, nomeLogradouro, id_tipoLogradouro, id_bairro, id_municipio)
VALUES
('01001000', 'Rua das Acácias', 1, 1, 1),
('13040089', 'Avenida Central', 2, 2, 2);

INSERT INTO Infos_Escola (nomeInstituicao, CEP, numeroEndereco, telefone_secretaria)
VALUES
('Colégio ConEduc', '01001000', '120', '1122334455');

INSERT INTO Fiaps (matricula, data_e_hora, justificativa)
VALUES
(1, '2024-03-15 08:20:00', 'Atraso por trânsito'),
(2, '2024-03-16 07:50:00', 'Consulta médica');

INSERT INTO Boletim (matricula, mediaSemestre1, mediaSemestre2, mediaFinal)
VALUES
(1, 7.5, 8.0, 7.8),
(2, 9.0, 8.5, 8.7),
(3, 6.5, 7.0, 6.8);

INSERT INTO Boletim_Materias (matricula, id_materia, notaSemestre1, notaSemestre2)
VALUES
(1, 1, 8.0, 7.5),
(1, 2, 7.0, 8.0),
(2, 1, 9.0, 8.5),
(3, 3, 6.5, 7.0);

INSERT INTO Eventos (nomeEvento, descricao, data_e_hora, id_gestor)
VALUES
('Feira de Ciências', 'Apresentações e experimentos escolares', '2024-06-20 09:00:00', 1),
('Semana da Leitura', 'Atividades de incentivo à leitura', '2024-04-10 10:00:00', 2);

INSERT INTO Agenda_Laboratorio (id_status, id_professor, id_laboratorio, diaAquisicao, HoraEntrada, HoraSaida, justificativa_aquisicao)
VALUES
(1, 1, 1, '2024-03-21', '08:00:00', '10:00:00', 'Aula prática de informática'),
(1, 2, 2, '2024-03-22', '10:00:00', '12:00:00', 'Experimento de ciências');

INSERT INTO Aulas (NumerodaAula, id_materia, id_turma, pauta, dataAula)
VALUES
(1, 1, 1, 'Operações básicas e revisão', '2024-03-10'),
(2, 2, 1, 'Estudo da Idade Média', '2024-03-11'),
(1, 3, 2, 'Interpretação de texto', '2024-03-12');


INSERT INTO Materias_Turmas (id_materia, id_turma)
VALUES
(1, 1),
(2, 1),
(3, 2);


INSERT INTO Turmas_Professores (id_turma, id_professor)
VALUES
(1, 1),
(1, 2),
(2, 3);