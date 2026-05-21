create table alunos (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    sobrenome TEXT NOT NULL,
    data_nascimento DATE,
    turma TEXT NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT true
);

insert into alunos (
    nome,
    sobrenome,
    data_nascimento,
    turma
) values (
    'Edxzy',
    'Luksz',
    '2009-04-14',
    'I2D35A'
    );

select * from alunos;