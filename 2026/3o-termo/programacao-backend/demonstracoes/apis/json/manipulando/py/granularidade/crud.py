import json
import os

# Menu Principal

def menu():
    print("\n === Menu de Contatos ===")
    print("1. Adicionar")
    print("2. Listar")
    print("3. Atualizar")
    print("4. Excluir")
    print("5. Sair")

# Função para escolher o grupo

def escolher_grupo():
    print("\nTipo de contato")
    print("1. Aluno")
    print("2. Professor")

    opcao = input("Escolha: ")

    match (opcao):
        case "1":
            return "alunos"
        case "2":
            return "professores"
        case _:
            print("Opção inválida.")
            return None

# Função para ler o JSON
def ler_dados():
    with open("contatos.json", "r", encoding="utf-8") as arquivo:
        return json.load(arquivo)

def salvar_dados(dados):
    with open("contatos.json", "w", encoding="utf-8") as arquivo:
        json.dump(dados, arquivo, indent=4, ensure_ascii=False)

# Adicionar dados
def adicionar():
    grupo = escolher_grupo()

    if not grupo: 
        return
    
    nome = input("Nome: ")
    telefone = input("Telefone: ")

    dados = ler_dados()

    dados[grupo].append({
        "nome": nome,
        "telefone": telefone
    })

    salvar_dados(dados)
    print("Contato adicionado com sucesso!")

# Função listar contatos
def listar():
    grupo = escolher_grupo()

    if not grupo:
        return

    dados = ler_dados()
    print(f"\nLista de {grupo.title()}")

    for index, contato in enumerate(dados[grupo], start=1):
        print(f"{index}. {contato['nome']} - {contato['telefone']}")

# Atualizar
def atualizar():
    grupo = escolher_grupo()

    if not grupo:
        return
    
    dados = ler_dados()

    index = int(input("Index do contato: ")) -1

    if index < 0 or index > len(dados[grupo]):
        print("ID inválido!")
        return

    nome = input("Novo nome:")
    telefone = input("Novo telefone: ")

    dados[grupo][index] = {
        "nome": nome,
        "telefone": telefone
    }

    salvar_dados(dados)
    print("Contato atualizado!")

def excluir():
    grupo = escolher_grupo()
    if not grupo:
        return
    
    dados = ler_dados()

    index = int(input("Índice do contato: ")) - 1

    # Verificar se o Index é valido
    
    if index < 0 or index > len(dados[grupo]):
        print("ID inválido!")
        return
    
    dados[grupo].pop(index)
    salvar_dados()
    print("Contato excluído com sucesso.")


def main():

    while True:
        menu()
        opcao = input("\nEscolha: ")
        
        match(opcao):
            case "1":
                adicionar()
            case "2":
                listar()
            case "3":
                atualizar()
            case "4":
                excluir
            case "5":
                print("Até mais!")
                break
            case _:
                print("Opção inválida!")
            
        input("Digite ENTER para continuar.\n")
        os.system('cls' if os.name == "nt" else 'clear')
