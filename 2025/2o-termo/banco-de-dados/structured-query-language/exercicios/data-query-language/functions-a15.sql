use dbLoja;

select nome
	,upper(nome)
	,lower(nome)
    ,length(nome)
    ,substring(nome, 3, 5) -- A partir da terceira posição, um caractere, começando em 1 diferente do vetor da programação.
 from produtos;
