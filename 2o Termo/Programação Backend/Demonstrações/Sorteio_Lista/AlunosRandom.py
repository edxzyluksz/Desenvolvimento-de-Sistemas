import random
import os # Importamos a biblioteca 'os' para verificar o tamanho do arquivo
os.system("cls")

# Nome do arquivo que contém a lista de nomes
nome_arquivo = "nomes.txt"
nomes_limpos = [] # Inicializa a lista de nomes

# Tenta ler o arquivo de nomes
try:
    # Verifica se o arquivo existe e não está vazio
    if not os.path.exists(nome_arquivo) or os.path.getsize(nome_arquivo) == 0:
        if not os.path.exists(nome_arquivo):
            print(f"Erro: O arquivo '{nome_arquivo}' não foi encontrado.")
        else:
            print(f"Erro: O arquivo '{nome_arquivo}' está vazio.")
        exit()

    with open(nome_arquivo, 'r', encoding='utf-8') as arquivo:
        nomes_sujos = arquivo.readlines()
   
    # Processa e limpa a lista de nomes, removendo espaços e linhas vazias
    nomes_limpos = [nome.strip() for nome in nomes_sujos if nome.strip()]

    # Verifica se a lista de nomes está vazia após a limpeza
    if not nomes_limpos:
        print("O arquivo não contém nomes válidos após a limpeza.")
        exit() # Encerra o programa se a lista estiver vazia

except Exception as e:
    print(f"Ocorreu um erro inesperado durante a leitura do arquivo: {e}")
    exit()

# --- Início do Programa ---

print("--- Programa de Sorteio Aleatório de Nomes ---")
print(f"Um total de {len(nomes_limpos)} nome(s) foi(ram) carregado(s).")
print("\nLista de nomes para o sorteio:")

# *** Exibe a lista de nomes ***
for nome in nomes_limpos:
    print(f"- {nome}")
print("---------------------------------------")

# Usa um loop 'while' para permitir múltiplos sorteios
while True:
    input("\nPressione ENTER para sortear um nome...")
   
    # Realiza o sorteio
    nome_sorteado = random.choice(nomes_limpos)
    print(f"O nome escolhido foi: {nome_sorteado}")

    # Pergunta ao usuário se ele quer continuar
    resposta = input("Deseja sortear outro nome? (s/n): ").lower()
   
    # Se a resposta for 'n' ou 'não', o loop é quebrado
    if resposta in ['n', 'nao']:
        print("Saindo do programa. Até mais!")
        break