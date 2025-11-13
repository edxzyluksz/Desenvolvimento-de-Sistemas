from autenticacao import AutenticaUsuario


print("=== Gestão Educacional ConEduc ===")
print("Tornando a educação um processo automatizado em dobro!")


sucesso, cargo = AutenticaUsuario()

if sucesso:
    if cargo == 3:
        print("")
        # MenuAluno()
    elif cargo == 2:
        print("")
        # MenuProfessor()
    elif cargo == 1:
        print("")
        # MenuGestao()
    else:
        print("Este cargo não existe.")
