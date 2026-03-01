aluno = {
    "nome": "Carlos Silva",
    "idade": 25,
    "curso": "Análise de Sistemas",
    "notas": [8.5,9.0,7.5], # Pode ser uma lista!
    "ativo": True
}

print(aluno["nome"])

# Adicionando um novo valor:
aluno["semestre"] = 4

# Alterando um valor existente
aluno["curso"] = "Engenharia de Software"

# Acessando as chaves e valores separadamente
print(aluno.keys()) # -- Mostra nome, idade, curso, notas, ativo e semestre (As chaves)
print(aluno.values()) # Mostra os conteúdos (Os valores)

# Adicionando uma nova chave "curso"

aluno["curso2"] = "Análise de Sistemas"

