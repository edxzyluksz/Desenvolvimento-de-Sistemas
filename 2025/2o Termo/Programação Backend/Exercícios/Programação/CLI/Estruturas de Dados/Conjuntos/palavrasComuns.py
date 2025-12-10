import os
os.system('cls')

set_a_substantivos = {"Casa", "Azul", "Carro", "Bonito", "Cidade", "Rápido"}
set_b_adjetivos = {"Grande", "Rápido", "Azul", "Feliz", "Carro", "Pequeno"}

elementos_duplicados = set_a_substantivos.intersection(set_b_adjetivos)

print("Ao que tudo indica, houve um engano entre a semântica das definições, contendo rotulações erradas E duplicadas em ambos conjuntos.")
print("Portanto, a lista que se dá os elementos repetidos é: ")
print(elementos_duplicados)

print("O primeiro deve estar contido somente no Conjunto B, o segundo no A e o terceiro no C.")