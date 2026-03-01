import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error

	# 1. Gerando dados de exemplo para regressão linear
# x é a nossa variável independente (por exemplo, "horas de estudo")
# y é a nossa variável dependente (por exemplo, "nota no teste")
np.random.seed(0)  # Para garantir que os dados sejam os mesmos em todas as execuções
x = 2 * np.random.rand(100, 1) # 100 valores aleatórios entre 0 e 2
y = 4 + 3 * x + np.random.randn(100, 1) # A equação é y = 4 + 3x, com algum "ruído"

	# 2. Dividindo os dados em conjuntos de treino e teste
# 80% para treino e 20% para teste
x_treino, x_teste, y_treino, y_teste = train_test_split(x, y, test_size=0.2, random_state=42)

	# 3. Criando e treinando o modelo de Regressão Linear
modelo = LinearRegression()
modelo.fit(x_treino, y_treino)

	# 4. Fazendo previsões com o conjunto de teste
y_previsto = modelo.predict(x_teste)

	# 5. Avaliando o modelo
# Calcula o Erro Quadrático Médio (Mean Squared Error)
mse = mean_squared_error(y_teste, y_previsto)
print(f"Erro Quadrático Médio (MSE): {mse:.2f}")

	# 6. Visualizando os resultados
plt.figure(figsize=(10, 6))
# Plota os pontos de dados de teste (os originais)
plt.scatter(x_teste, y_teste, color='blue', label='Dados de Teste Reais')
# Plota a linha de regressão (a previsão do modelo)
plt.plot(x_teste, y_previsto, color='red', linewidth=3, label='Previsão do Modelo')
plt.title('Regressão Linear Simples')
plt.xlabel('Variável X')
plt.ylabel('Variável Y')
plt.legend()
plt.grid(True)
plt.show()