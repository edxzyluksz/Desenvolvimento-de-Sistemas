USE AtividadeBiblioteca;

INSERT INTO Autores(nomeAutor)
VALUES	('Hellen Corina de Oliveira'),
	('Melissa Leventon'),
        ('Janice McNeillie'),
        ('Maria Carolina Garcia'),
        ('Fernanda Nascimento'),
        ('Antonia Motta de Castro Memória Ribeiro'),
        ('Jose Osvaldo Saldanha Paulino'),
        ('Vogue'),
        ('Serviço Nacional de Aprendizagem Industrial'),
        ('Cambridge University Press'),
        ('Amalia Ponce'),
        ('Chidy Weine'),
        ('Harward Business Review'),
        ('Catellany'),
        ('Regina Maria'),
        ('Marcos Didonet'),
        ('Libeneco'),
        ('José Carlos'),
        ('Revista Veja'),
        ('Alexandre Luzzi Las Casas'),
        ('Fernando de Sousa Meirelles'),
        ('Eugênio Fürstenau'),
        ('Samuel Hazzan'),
        ('Hilde Jaffe'),
        ('Francisco Fernandes'),
        ('Celso Pedro Luft F.'),
        ('Marques Guimarães'),
        ('Laura Rosa');

INSERT INTO Generos(nomeGenero, descricao)
VALUES  ('Ilustração', 'Livro que se destaca pelo uso de imagens para narrar ou complementar o conteúdo.'),
        ('Revista', 'Livro periódico, geralmente temático, com textos e imagens sobre assuntos diversos.'),
        ('Dicionário', 'Livro de consulta que reúne palavras e seus significados ou traduções.'),
        ('Didático', 'Livro voltado ao ensino, usado como apoio no processo de aprendizagem.'),
        ('Manual', 'Livro que explica de forma prática como realizar tarefas ou compreender um assunto específico.
');


INSERT INTO Livros(nome, id_genero, numeroPaginas)
VALUES  ('Arte e Conformação')
        ('História Ilustrada do Vestuário')
        ('Dicionário Larousse Ática')
        ('Fundição e Serviços')
        ('Catálogo de Recursos Bibliográficos')
        ('Álbum 1999')
        ('Tolerância Geométrica')
        ('Cambridge Dicionary of American English')
        ('Manual Para Elaboração de Trabalhos Acadêmicos do SENAI-SP')
        ('Arte e Conformação')
        ('Máquinas e Metais')
        ('Proteção de Equipamentos Elétricos e Eletrônicos Contra Surtos Elétricos em Instalação')
        ('Vogue')
-- Entidade fraca 
    
INSERT INTO Livro_Autores(id_livro, id_autor)
VALUES
();
-- Entidade fraca
SHOW TABLES;