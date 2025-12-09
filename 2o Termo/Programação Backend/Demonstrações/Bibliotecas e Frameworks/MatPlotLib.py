import matplotlib.pyplot as plt
import numpy as np

    # 1. Preparando os dados
meses = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun']
vendas = np.array([150, 200, 250, 300, 280, 320])

    # 2. Criando o gráfico
plt.figure(figsize=(8, 6)) # Cria uma figura para o gráfico com tamanho definido

    # Plota os dados: meses no eixo X e vendas no eixo Y
plt.plot(meses, vendas, marker='o', linestyle='-', color='b')

    # 3. Adicionando rótulos e título para clareza
plt.title('Vendas Mensais no Primeiro Semestre', fontsize=16)
plt.xlabel('Mês', fontsize=12)
plt.ylabel('Total de Vendas', fontsize=12)

    # Adiciona uma grade para facilitar a leitura
plt.grid(True)

    # 4. Exibindo o gráfico
plt.show()