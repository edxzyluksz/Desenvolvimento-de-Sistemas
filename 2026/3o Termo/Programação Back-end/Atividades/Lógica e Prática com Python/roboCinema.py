idade = int(input("Olá, cliente. Entre sua idade para calcular o valor do ingresso: "))

if idade < 12:
    print("Ingresso: R$ 10,00")
elif idade > 60:
    print("Ingresso: R$ 15,00")
else:
    print("Ingresso: R$ 30,00")