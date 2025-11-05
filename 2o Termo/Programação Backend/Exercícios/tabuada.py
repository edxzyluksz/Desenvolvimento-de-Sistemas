import os
os.system('cls')

while True:
    try:
        print("Bem-vindo, usuário!")
        nomeInput = str(input("Digite o seu nome: "))
        if not nomeInput.replace("'", " ").replace("-", " ").replace(" ", "").isalpha():
            raise ValueError
        nome = " ".join(nomeInput.strip().split())
        if nome == "":
            raise ValueError
        break
    except ValueError:
        os.system('cls')
        print("Por favor, digite um nome válido!\nNomes não podem conter números " \
        "ou caracteres especiais, em exceção de hífen (-) e apóstrofo (')\n")
        continue

while Tabuada := True:
    print("-" * 50)
    print("       Tabuada de números")
    print("-" * 50)
    while True:
        try:
            num = input(f"{nome}! Digite um número: ").replace(",", ".")
            num = float(num)

            os.system('cls')
            break
        except ValueError:
            print("Você não digitou um número...")

    print("-" * 30)
    print(f"      Tabuada do {num}")
    print("-" * 30)
                                                                                                        
    for i in range(1, 11, 1):
        print(f"||{num} x {i} = {round(num*i, 2)}")
    print("-" * 30)
    
    continuar = ["S", "SIM", "YES", "Y"]
    parar = ["N", "NÃO", "NAO", "NO"]

    while True:
        try:
            decisao = input("Deseja continuar?\nR: ").upper().strip()
            if decisao in parar:
                os.system('cls')
                print(f"Obrigado por usar, {nome}")
                break
            elif decisao not in continuar:
                raise ValueError
            break
        except ValueError:
            print("Você digitou a alternativa errado...")

    if decisao in parar:
        break
