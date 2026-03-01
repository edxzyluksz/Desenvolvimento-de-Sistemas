from sklearn.linear_model import LinearRegression

# Dados de Exemplo
X = [[1], [2], [3], [4]] # Variável indepentente
y = [2, 4, 6, 8] # Variável Dependente

# Criando e treinando o modelo
modelo = LinearRegression()
modelo.fit(X, y)

# Fazendo previsão
print(modelo.predict([[5]])) # Resultado esperado ~ 10