import os, random, string, time
os.system('cls')

Letras = string.ascii_uppercase   # 'A' até 'Z'
Algarismos = string.digits        # '0' até '9'

padrao = "LLLNLNN"

placa = "".join(
    random.choice(Letras if c == "L" else Algarismos)
    for c in padrao
)   

while Nome := True:
    user = input("Qual é o seu nome, usuário?\nR: ")
    if not user.replace(" ", "").isalpha():
        print("Por favor, digite um nome somente com letras!")
        time.sleep(2)
        os.system('cls')
    break

while True:
    try:
        print("-" * 50)
        print("         Software de Semáforo-Radar")
        print("-" * 50)

        cor = input(f"{user.capitalize()}, digite a cor do semáforo no momento da passagem (Vermelho, Amarelo, Verde)\nResponda aqui: ").upper()
        if cor not in ["VERMELHO", "AMARELO", "VERDE"]:
            raise TypeError

        try:
            velocidade = int(input("\nDigite a velocidade em km/h:\n"))
            if velocidade < 0:
                velocidade = print("Erro! ⚠️ Números negativos não são permitidos.")
                raise ValueError
        except ValueError:
            print("Números negativos não são permitidos.")
            time.sleep(2)
            os.system('cls')

        if velocidade >= 70:
            print("\nMulta! ⚠️\nIndependentemente da sinalização do semáforo, sua velocidade estava a 70km/h ou acima.")
        elif cor == "VERMELHO":
            print("\nMulta! ⚠️ Não se deve passar no sinal vermelho, apesar da baixa velocidade 🔴🚫")
        elif cor == "AMARELO":
            print("\nAtenção! Tenha cuidado ao ultrapassar o sinal amarelo 🟡")
        elif cor == "VERDE":
            print("\nA passagem está liberada! 🟢")

        print(f"\nOk, {user.capitalize()}. Deseja continuar a execução?")

        continuar = ""
        while continuar not in ["S", "N"]:
            continuar = input("\nS - Para continuar a execução /// N - Para fechar o programa\nResposta: ").upper()

        if continuar == "S":
            print("\nMuito bem! Redirecionando para o início...")
            time.sleep(3)
            os.system('cls')
        elif continuar == "N":
            os.system('cls')
            print("Obrigado pela preferência!")
            break

    except TypeError:
        print(f"\n{user}, parece que você inseriu a cor indevidamente. Vamos tentar novamente!")
        time.sleep(4)
        os.system('cls')
    