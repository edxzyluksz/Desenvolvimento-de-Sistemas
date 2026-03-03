import os
from autenticacao import AutenticaUsuario
from usuario import FinalizarCadastro, MenuAluno, MenuGestor, MenuProfessor

sucesso, cargo = AutenticaUsuario()

def main():
    if sucesso:
        nome = FinalizarCadastro(cargo)
        os.system('cls')
        print("=== Gestão Educacional ConEduc ===")
        print("Tornando a educação um processo automatizado em dobro!")

        try:
            if cargo == 1:
                MenuAluno(nome)
            elif cargo == 2:
                MenuProfessor(nome)
            elif cargo == 3:
                MenuGestor(nome)
            else:
                print("Este cargo não existe. Algo deu errado.")
        except KeyboardInterrupt:
            while True:
                try:
                    print("Olá. Você entrou secreto do sistema. Esse modo não existirá na versão final e foi criado apenas para testes internos do mockup.")
                    cargo_teste = int(input("Digite o cargo que deseja testar (1 - Aluno/Responsável, 2 - Professor, 3 - Gestor): "))
                    if cargo_teste == 1:
                        MenuAluno(nome)
                    elif cargo_teste == 2:
                        MenuProfessor(nome)
                    elif cargo_teste == 3:
                        MenuGestor(nome)
                except KeyboardInterrupt:
                    print("Saindo do modo de teste secreto.")
                    break
    
if __name__ == "__main__":
    main()