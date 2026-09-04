import time, os
os.system('cls')

estoqueAtual = ["Camisa", "Calça", "Meia"]

print(f"O estoque atual possui {estoqueAtual}")
print(f"Existem {len(estoqueAtual)} itens disponíveis no momento.\n")

estoqueAtual.append("Sapato")
estoqueAtual.append("Cinto")
estoqueAtual.append("Gravata")

# Melhor opção seria o extend para vários itens de uma só vez

print(f"O estoque atual possui alterou, resultando em {estoqueAtual}")
print(f"Agora existem {len(estoqueAtual)} produtos no estoque!")

print("\nAgora é sua vez de criar um estoque!")
time.sleep(15)

for i in range(3):
    print(f"{i+1}...")
    time.sleep(1)
    os.system('cls')

os.system('cls')

estoqueUsuario = []

while True: 
    print("_____________________________________________________")
    print("1 - Adicionar item\n2 - Ver estoque\n3 - Excluir item\nX - Sair")
    print("_____________________________________________________")

    menu = input("Escolha aqui: ").upper()

    if menu not in ["1", "2", "3", "X"]:
        print("Selecione uma das opções acima!")
        os.system('cls')
        continue
    elif menu == "1":
        novoItem = input("Nome do item: ").title()
        estoqueUsuario.append(novoItem)
        print("Concluído com êxito! Espere alguns segundos...")
    elif menu == "2":
        if not estoqueUsuario:
            print("Não existem itens no estoque atual. Tente adicionar algum.")
        else:
            print(f"O estoque atual é:\n {estoqueUsuario}")
            print("Espere alguns segundos para prosseguir...")
    elif menu == "3":
        item = input("Digite o nome do item a ser excluído: ").title()
        if item not in (estoqueUsuario):
            print("Esse item não existe no estoque. Tente denovo")
        else:
            estoqueUsuario.remove(item)
            print("Concluído com êxito! Espere alguns segundos...")
    else:
        print("Obrigado por experimentar!")
        break

    time.sleep(3)
    os.system('cls')




