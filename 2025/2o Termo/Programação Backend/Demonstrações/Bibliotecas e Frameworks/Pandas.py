import pandas as pd, os
os.system('cls' if os.name == 'nt' else 'clear')

# 1. Criando um DataFrame a partir de um dicionário
dados = {
    'Nome': ['Alice', 'Bob', 'Carlos', 'Diana', 'Eva'],
    'Idade': [25, 30, 35, 22, 28],
    'Cidade': ['São Paulo', 'Rio de Janeiro', 'Belo Horizonte', 'São Paulo', 'Rio de Janeiro']
}

# Cria o DataFrame
df = pd.DataFrame(dados)

print("----- DataFrame Original -----")
print(df)

# 2. Selecionando uma Coluna
print("\n----- Apenas a coluna 'Nome' -----")
    # Selecionar uma única coluna retorna uma Series (tipo de dado do Pandas)
nomes = df['Nome']
print(nomes)

# 3. Filtrando dados por uma condição
print("\n----- Pessoas com mais de 25 anos -----")
#Cria uma condição )uma Series de True/False) e a usa para filtrar o DataFrame
df_filtrado = df[df['Idade'] > 25]
print(df_filtrado)

# 4. Realizando um cálculo simples
    # Calcula a média de idade de todas as pessoas

media_idade = df['Idade'].mean()
print("\n----- Media de Idade -----")
print(f"A média de idade das pessoas é {media_idade:.2f} anos")