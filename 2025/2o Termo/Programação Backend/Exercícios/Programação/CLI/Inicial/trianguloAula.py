import os
os.system('cls')

while True:
    try:
        print("Bem-vindo, usuário!")
        nomeInput = str(input("Digite o seu nome: "))
        if not nomeInput.replace("'", " ").replace("-", " ").replace(" ", "").isalpha():
            raise ValueError
        user = " ".join(nomeInput.strip().split())
        if user == "":
            raise ValueError
        break
    except ValueError:
        os.system('cls')
        print("Por favor, digite um nome válido!\nNomes não podem conter números " \
        "ou caracteres especiais, em exceção de hífen (-) e apóstrofo (')\n")
        continue

while Triangulo := True:
    print("-" * 50)
    print("       ----> Calculadora de Triângulos <----")
    print("-" * 50)

    print(f"{user.title()}, por favor, insira os valores de cada lado do triângulo:\n")
    while True:
        try:
            lado1 = input("Insira 1º Valor: ").replace("," , ".")
            lado2 = input("Insira 2º Valor: ").replace(",", ".")
            lado3 = input("Insira 3º Valor: ").replace("," , ".")

            a, b, c = float(lado1), float(lado2), float(lado3)

            break
        except ValueError:
            print("Valor(es) NaN.\n")
        
    if a <= 0 or b <= 0 or c <= 0:
        os.system('cls')
        print("Nenhum dos valores podem ser menores ou iguais a zero!\n")
        continue

    if (a + b > c) and (b + c > a) and (c + a > b):
        print("\nDado as entradas, seu triângulo...")
        if a == b:
            if a == c:
                print("... É equilátero!\n")
        if a != b:
            if b != c:
                print("... É escaleno!\n")
            else:
                print("... É isósceles!\n")
    else:
        print("\nSeus valores digitados não podem formar um triângulo!\n")

    decisao = int(input(f"{user}, deseja continuar usando o programa?\n1- Sim\n2- Não\nDigite: "))
    binario = [1, 2]

    if decisao not in binario:
        while decisao not in binario:
            decisao = int(input("\nPor favor, uma das opções válidas:\n1- Sim\n2- Não\nDigite: "))
    elif decisao == 2:
        os.system('cls')
        print(f"Adeus, {user}!!!")
        break