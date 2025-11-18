dadosLogin = []

def AutenticaUsuario():
  while True:
    try:
      menu = input("1 - Registrar-se\n2 - Logar-se\nO que deseja fazer agora? R: ")
      if menu not in ["1", "2"]:
        raise ValueError
      
      if menu == "1":
        print("=== Registro ===")
        emailCad = input("Digite seu email: ")
        senhaCad = input("Digite sua senha: ")

        while True:
          cargo = int(input("Escolha sua função:\n1 - Aluno/Responsável\n2 - Professor\n3 - Gestor\nEscolha alternativa: "))
          if cargo not in [1, 2, 3]:
            print("Digite uma escolha válida.")
            continue
          else:
            dadosLogin.append(f"Email: {emailCad}; Senha: {senhaCad}; Cargo: {cargo}")
            print("Usuário registrado com sucesso!")
            break
        
        if not emailCad or not senhaCad:
          print("Falha no cadastro. Tente novamente.")

      if menu == "2":
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
              
          print("Erro. Não foi possível encontrar seus dados no sistema.")
            
        else:
          print("Não existem usuários registrados no sistemas.")
    except ValueError:
      print("Escolha uma das opções acima.")
                
