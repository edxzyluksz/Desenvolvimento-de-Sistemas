CREATE DATABASE empresa_xyz;

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sexo CHAR(1)
);

INSERT INTO clientes (nome, sexo) VALUES
('Edxzy', 'M'), ('Billy', 'M'), ('Liphyzz', 'M'), ('GuizineRa', 'M');

SELECT * FROM clientes WHERE id = 1;
SELECT * FROM clientes ORDER BY id;

UPDATE clientes SET nome = 'FAR Shadow' WHERE nome = 'Liphyzz';
