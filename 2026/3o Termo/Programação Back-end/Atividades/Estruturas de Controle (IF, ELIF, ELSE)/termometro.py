from math import round

print("Objetivo detectado: Sair de casa 🤖")
temperatura = input("Por favor, humano, informe a temperatura atual em graus Celsius: ")
temperatura = temperatura.replace(",", ".")
temperatura = round(float(temperatura), 2)

if temperatura > 30:
    print("Está muito quente lá fora! Use regata! 🏃‍♂️")
elif temperatura < 15:
    print("Está frio lá fora! Use um casaco! 🧥")
else:
    print("A temperatura está agradável! Use uma camiseta! 👕")