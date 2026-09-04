import os
dadosLogin = [f"Email: admin; Senha: senhasecreta123; Cargo: {3}"] # Login de gestor padrão para testes
# Essa lista armazena os dados de login dos usuários, mas não funciona na memória volátil.

def CriarDadosLogin():
  while True: 
    print("=== Registro ===")
    print("AVISO: ESSE PROCEDIMENTO DEVE SER FEITO COM CONSENTIMENTO DO USUÁRIO.")

    cargo = int(input("Escolha a função do usuário:\n1 - Aluno/Responsável\n2 - Professor\nEscolha alternativa: "))
    if cargo not in [1, 2]:
        print("Digite uma escolha válida.")
        continue

    emailCad = input("Digite o email da conta: ")
    senhaCad = input("Digite a senha (Tenha ciência que o usuário poderá alterá-la posteriormente): ")
    dadosLogin.append(f"Email: {emailCad}; Senha: {senhaCad}; Cargo: {cargo}")
    print("Usuário registrado com sucesso!")

    if not emailCad or not senhaCad:
      os.system('cls')
      print("Falha no cadastro. Tente novamente.")
      continue



def AutenticaUsuario():
  while True:
    try:
        if dadosLogin:
          print("Digite seus dados de acesso.")
          emailInput = input("Email: ")
          senhaInput = input("Senha: ")
          credenciais = f"Email: {emailInput}; Senha: {senhaInput}"
          for item in dadosLogin:
            if credenciais in item:
                cargo_str = item.split("Cargo: ")[1]
                cargo = int(cargo_str)
                return True, cargo
          print("Erro. Login ou senha incorretos.")     
        else:
          print("Não existem usuários registrados no sistemas.")
    except ValueError:
      print("Escolha uma das opções apresentadas.")

                
