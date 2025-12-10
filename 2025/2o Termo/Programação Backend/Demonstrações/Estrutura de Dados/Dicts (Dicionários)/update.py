configuracao = {
    "usuario": "admin",
    "tema": "claro",
    "volume": 50
}

print(f"Antes: {configuracao}")

novas_opcoes = {
    "tema": "escuro", # Chave tema já existe, é atualizada o valor
    "idioma": "PT-BR" # Chave idioma foi criada agora
}

configuracao.update(novas_opcoes)

print(f"Depois: {configuracao}")