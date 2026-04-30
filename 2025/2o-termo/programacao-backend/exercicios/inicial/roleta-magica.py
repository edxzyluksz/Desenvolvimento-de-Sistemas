import random, time, os
def limpar():
    os.system('cls' if os.name == 'nt' else 'clear')
limpar()

print("-" * 50)
print("👿👿 Roleta do terror 👿👿")
print("-" * 50)

lista = []

while True:
    try:
        if not lista:
            print("Deseja remover os nomes conforme são sorteados? S/N")
            opcaoRemocao = ''
            while opcaoRemocao not in ['S', 'N']:
                opcaoRemocao = input("Insira sua resposta: ").upper().strip()
                if opcaoRemocao not in ['S', 'N']:
                    print("Digite corretamente!")
            limpar()

            print(f"Sua escolha: {opcaoRemocao}")
            print("Digite vários nomezinhos na roleta, à vontade. Para parar, pressione Ctrl + C")
            while True:
                nomes = input("Insira aqui: ")
                lista.append(nomes)
    except KeyboardInterrupt:
        limpar()
        print("Muito bem, vamos ao sorteio...")
        time.sleep(3)
        limpar()

    # Laço for para efeito visual
    for i in range (0, 3):
            print(f"{i+1}...")
            time.sleep(1)
            limpar()

    if lista:
        sorteado = random.choice(lista)
        print("Muito bem, a escolha foi: ")
        print(f"{sorteado} 🎉🎉🎉")

        if opcaoRemocao == 'S':
            lista.remove(sorteado)
            
    else:
        print("Você não escreveu nenhum elemento na lista! ")

    escolha = ''
    print("Escolha como deseja continuar: ")

    while escolha not in ['1', '2', 'X']:
        print("1 - Sortear dentro da mesma lista\n2 - Escrever outra lista\nX - Sair do programa")
        escolha = input("Digite aqui: ").upper().strip()
        limpar()
        if escolha not in ['1', '2', 'X']:
            print("Por favor, selecione corretamente conforme as alternativas.")
            time.sleep(3)
            limpar()

    if escolha == '1':
        if not lista:
            print("Por não existir mais elementos nesta lista, você deverá escrever uma nova.")
        continue

    if escolha == '2':
        lista = []
        continue

    if escolha == 'X':
        print("Agradeço muito por utilizar meu software!")
        break