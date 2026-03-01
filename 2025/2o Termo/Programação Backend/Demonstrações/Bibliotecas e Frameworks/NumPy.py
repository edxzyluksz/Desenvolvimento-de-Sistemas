import numpy as np, openai

            #1. Criando arrays NumPy
        #Cria um array unidimensional (vetor) a partir de uma lista python

vetor = np.array([1,2,3,4,5])
print("Vetor original:")
print(vetor)

        #Cria um array bidimensional (matriz)
matriz_a = np.array([[1, 2],
                     [3,4]])

print("\nMatriz A:")
print(matriz_a)

matriz_b = np.array([[5, 6],
                     [7, 8]])

print("\nMatriz B:")
print(matriz_b)

                        # 2. Operação Matemática em todos os elementos
                # Eleva cada elemento do vetor ao quadrado e ao cubo
                # Note que a operação é aplicada a cada item de forma eficiente.
vetor_ao_quadrado = vetor ** 2
print("\nCada elemento do vetor elevado ao quadrado:")
print(vetor_ao_quadrado)


vetor_2 = np.array([22, 28, 41, 47, 51, 55, 67])
vetor_ao_cubo = vetor_2 ** 3
print("\nCada elemento do vetor elevado ao cubo: ")
print(vetor_ao_cubo)


                        # 3. Multiplicação do vetor ao quadrado
                # Realiza a multiplicação de matrizes de forma eficiente usando np.dot()
                # O resultado é uma nova matriz

matriz_resultado = np.dot(matriz_a, matriz_b)
print("\nResultado da multiplicação de Matriz A por Matriz B:")
print(matriz_resultado)

matriz_3d = np.array([[9, 10, 11],
                      [12, 13, 14],
                      [15, 16, 17]])

print("\nMatriz Tridimensional: ")
print(matriz_3d)
