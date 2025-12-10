import os
def clean_screen():
    os.system('cls' if os.name == 'nt' else 'clear')
clean_screen()

alternativas = ["S", "SIM", "Y", "YES", "NÃO", "NAO", "N", "NO"]
positivas = ["S", "SIM", "Y", "YES"]
negativas = ["NÃO", "NAO", "N", "NO"]

def coletar_nome():
    while True:
        try:
            print("Bem-vindo, aluno!")
            nomeInput = str(input("Digite o seu nome: "))
            if not nomeInput.replace("'", " ").replace("-", " ").replace(" ", "").isalpha():
                raise ValueError
            user = " ".join(nomeInput.strip().split())
            if user == "":
                raise ValueError
            break
        except (ValueError, KeyboardInterrupt):
            os.system('cls')
            print("Por favor, digite um nome válido!\nNomes não podem conter números " \
            "ou caracteres especiais, em exceção de hífen (-) e apóstrofo (')\n")
            continue
    return user

def numero_notas(user):
    while True:
        print(f"""\n{user.title()}, por padrão do sistema, são 4 notas a serem inseridas. 
              Deseja prosseguir com este valor?""")

        while True:
            try:
                decisao_notas = str(input("\nDigite aqui: ")).upper()
                if decisao_notas not in alternativas:
                    raise ValueError
                break
            except (ValueError, KeyboardInterrupt):
                print("\nDigite 'sim' ou 'nao' de qualquer forma para prosseguir.\n")


        if decisao_notas in positivas:
            return 4
            break 
        elif decisao_notas in negativas:
            while True:
                    try:
                        numnotas = int(input(f"Para começar, digite a quantidade de notas, {user}: "))
                        if numnotas > 0:
                            return numnotas
                        print("Por favor, digite um valor maior que zero.\n")
                    except (ValueError, KeyboardInterrupt):
                            print("Ao digitar a quantidade de notas, escreva-a com algarismos.")

    

def calculo_media(numnotas, user):
    
    listanotas = []
    somativa = 0.0

    for i in range(numnotas):
        while True:
            try:
                notainput = str(input(f"Insira a nota {i+1}: ")).replace("," , ".")
                nota = round(float(notainput), 2)
                if nota > 10 or nota < 0:
                    print("\nNúmero inválido: Utilize a escala 0 a 10.\n")
                    continue
                else:
                    somativa += nota
                    listanotas.append(nota)
                    break
            except ValueError:
                    print("\nDigite apenas números e, se necessário, com casas decimais.\n")
            except KeyboardInterrupt:
                    print("\nParece que você interrompeu a digitação. Caso necessário, diminua o número de notas.")
                    return False
                    
                
    media = round(somativa / numnotas, 2)

    print(f"\n{listanotas} = {media} \nAcima são todas as notas que você inseriu, {user}.")

    if media >= 7.0:
        print("A pontuação está aprovada!")
    elif media < 7.0 and media >= 5.0:
        print("A pontuação está em processo de recuperação...")
    else:
        print("A pontuação está reprovada :(")

    return True

def continuar(user):
    while True:
        try:
            decisao_continuar = input(f"\nDeseja continuar usando o programa, {user}?\nR: ").upper()
            if decisao_continuar not in alternativas:
                raise ValueError
        except (ValueError, KeyboardInterrupt):
            print("Por favor, digite 'sim' ou 'nao' para continuar ou encerrar o programa.")
            continue

        if decisao_continuar in negativas:
            print("Obrigado pela preferência!")
            return False
        elif decisao_continuar in positivas:
            print("Vamos continuar!")
            return True