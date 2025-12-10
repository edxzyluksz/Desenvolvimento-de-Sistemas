import tensorflow as tf
from tensorflow import keras

    #1 Carregar o dataset MNIST (inmagens de 28x28 pixels)
(x_train, y_train), (x_test, y_test) = keras.datasets.mnist.load_data()

    # 2. Normalizar os dados (0-255 >>> 0-1)
x_train = x_train / 255.0
x_test = x_test / 255.0

    # 3. Criar o modelo da rede neural
modelo = keras.Sequential([
    keras.layers.Flatten(input_shape=(28,28)), # transforma 28x28 em vetor de 784 posições
    keras.layers.Dense(128, activation='relu'), # camada oculta com 128 neurônios
    keras.layers.Dense(10, activation='softmax') # saída: 10 classes (0 a 9)
])

    # 4. Compilar o modelo
modelo.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

    # 5. Treinar o modelo
modelo.fit(x_train, y_train, epochs=5)

    # 6. Avaliar no conjunto de teste
teste_loss, teste_acc = modelo.evaluate(x_test, y_test)
print(f"Acurácia no teste: {teste_acc:.2f}")
