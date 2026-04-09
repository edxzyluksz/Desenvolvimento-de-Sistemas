import json
import os

def carregar_dados():
    # Se o arquivo não existir, retorna
    if not os.path.exists("./dados.json"):
        return []

    # Abre o arquivo em modo leitura
    with open(".\dados.json", "r", encoding="utf-8") as arquivo:
        # Onde o r é para abrir o arquivo somente leitura READ
        return json.load(arquivo)
    
def salvar_dados(dados):
    # Abre o arquivo em modo escrita
    with open(".\dados.json", "w", encoding="utf-8") as arquivo:
        # Onde w é escrita WRITE
        # Indent para deixar o json organizado
        json.dump(dados, arquivo, indent=4, ensure_ascii=False)

def criar_pessoa(nome, idade):
    dados = carregar_dados()
    # Gera um ID simples

    novo_id = 1
    if dados:
        novo_id = dados[-1]["id"] + 1

    pessoa = {
        "id": novo_id,
        "nome": nome,
        "idade": idade
    }

    dados.append(pessoa)
    salvar_dados(dados)

    print("Pessoa cadastrada com sucesso!")

def listar_pessoas():
    dados = carregar_dados()

    if not dados:
        print("Nenhum registro encontrado. ")
        return

    for pessoa in dados:
        print(f"ID: {pessoa["id"]} | Nome: {pessoa["nome"]} | Idade: {pessoa["idade"]}")


def atualizar_pessoa(id, novo_nome, nova_idade):
    dados = carregar_dados()

    for pessoa in dados:
        if pessoa["id"] == id:
            pessoa["nome"] = novo_nome
            pessoa["idade"] = nova_idade
            salvar_dados(dados)
        print("Pessoa atualizada com sucesso!")
        return
    print("ID não encontrado.")

def deletar_pessoa(id):
    dados = carregar_dados()
    # Cria nova lista sem o ID informado
    dados = [pessoa for pessoa in dados if pessoa["id"] != id]
    salvar_dados(dados)
    print("Pessoa deletada com êxito (Se existia).")

while True:

    print("\n=== Registro de Pessoa ===")
    print("1 - Cadastrar")
    print("2 - Listar")
    print("3 - Atualizar")
    print("4 - Deletar")
    print("5 - Sair")

    opcao = input("\nEscolha: ")

    match(opcao):
        case "1":
            nome = input("Nome: ")
            idade = int(input("Idade: "))
            criar_pessoa(nome, idade)
        case "2":
            listar_pessoas()
        case "3":
            id = int(input("Digite o ID a ser atualizado: "))
            nome = input("Nome: ")
            idade = input("Idade: ")
            atualizar_pessoa(id, nome, idade)
        case "4":
            id = int(input("Digite o ID a ser excluído:"))
            deletar_pessoa(id)
        case "5":
            print("Até mais!")
            break
        case _:
            print("Opção inválida!")
        
    input("Digite ENTER para continuar.\n")
    os.system('cls' if os.name == "nt" else 'clear')