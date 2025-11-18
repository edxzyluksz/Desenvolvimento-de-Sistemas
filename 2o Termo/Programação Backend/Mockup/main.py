from autenticacao import AutenticaUsuario
import os

sucesso, cargo = AutenticaUsuario()

if sucesso:
    os.system('cls')
    print("=== Gestão Educacional ConEduc ===")
    print("Tornando a educação um processo automatizado em dobro!")

    if cargo == 1:
        print("")
        # MenuAluno()
    elif cargo == 2:
        print("")
        # MenuProfessor()
    elif cargo == 3:
        print("")
        # MenuGestor()
    else:
        print("Este cargo não existe.")
