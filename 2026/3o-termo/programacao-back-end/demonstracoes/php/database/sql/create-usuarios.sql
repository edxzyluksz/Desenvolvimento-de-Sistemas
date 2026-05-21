CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO usuarios (nome, email) VALUES
('Edxzy', 'edxzyluksz@gmail.com'),
('João Carlos', 'joaocarlos@hotmail.com'),
('Joana Carneiro', 'joanacarneiro@yahoo.com');

SELECT * FROM usuarios;

UPDATE usuarios SET email = 'novo@email.com' WHERE id = 2;