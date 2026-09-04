import random, os
os.system('cls')

while True:
    tentativas = 10
    print("Olá! Você deverá adivinhar um número aleatório entre 1 e 100, com somente 10 tentativas!")
    numeroAleatorio = random.randint(1, 100)
    while tentativas != 0:
        try:
            adivinhacao = int(input("Digite o seu número palpite: "))
            if adivinhacao > 100 or adivinhacao < 1:
                print("\nNão tá podendo! Somente números entre 1 e 100!")
                continue
            elif adivinhacao == numeroAleatorio:
                print(f"UAL, Parabéns! Você acertou em {tentativas} chances restantes.")
                break
            elif adivinhacao > numeroAleatorio:
                print("\nErrouuu! Tente um número menor.")
            elif adivinhacao < numeroAleatorio:
                print("\nErrouuu! Tente um número maior.")
            tentativas -= 1
            print(f"Tentativas restantes: {tentativas}")
        except ValueError:
            print("\nEscreva somente números, não letras!")

        if tentativas == 0:
            print("\nPoxa! Você não conseguiu acertar em 10 tentativas...")
            
        
    print("Desejaria continuar para tentar acertar outro número?\nS - Continuar\nX - Sair")

    while True:
        try:
            escolhaContinuar = input("Escreva aqui: ").upper()
            if escolhaContinuar != "S" and escolhaContinuar != "X":
                raise ValueError
            break
        except ValueError:
            print("Digite corretamente uma das opções apresentadas!")

    if escolhaContinuar == "S":
        print("\nOk! Vamos continuar")
    else:
        print("\nAdeus!")
        break