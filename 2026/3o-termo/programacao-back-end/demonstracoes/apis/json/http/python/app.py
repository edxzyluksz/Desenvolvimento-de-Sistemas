from flask import Flask, request, jsonify

#Importar o módulo json
import json

# Cria a aplicação Flask
app = Flask(__name__)

# Chama o arquivo contato.json
ARQUIVO = "../contatos.json"

# Função Ler os Dados
def ler_dados():
    # Abre o arquivo como somente leitura
    with open(ARQUIVO, "r", encoding="utf-8") as arquivo:
        return json.load(arquivo)

def salvar_dados(dados):
    #Recebe um dicionário Python e grava no arquivo JSON
    with open(ARQUIVO, "w", encoding="utf-8") as arquivo:
        json.dump(dados, arquivo, ensure_ascii=False, indent=2)

# Rota para listar contatos (GET)
@app.route("/contatos/<grupo>", methods=["GET"])
def listar_contatos(grupo):
    dados = ler_dados()

    #Verifica se o grupo existe
    if (grupo not in dados):
        return jsonify({"erro": "Grupo não encontrado"}), 404
    
    return jsonify(dados[grupo])

# Rota para adicionar um contato (POST - Adiciona)
@app.route("/contatos/<grupo>", methods=["POST"])
def adicionar_contato(grupo):
    dados = ler_dados()
    if (grupo not in dados):
        return jsonify({"erro": "Grupo não encontrado"}), 404
    # Obtém o JSON enviado no corpo da requisição
    body = request.json

    if (not body) or ("nome" not in body) or ("telefone" not in body):
        return jsonify({"erro": "Campos 'nome' e 'telefone' são obrigatórios"}), 400

    novo_contato = {
        "nome": body["nome"],
        "telefone": body["telefone"]
    }

    dados[grupo].append(novo_contato)
    salvar_dados(dados)

    return jsonify({
        "mensagem": "Contato adicionado com sucesso",
        "contato": novo_contato
    }), 201

# Rota para atualizar contato (PUT)
@app.route("/contatos/<grupo>/<int:index>", methods=["PUT"])
def atualizar_contato(grupo, index):
    dados = ler_dados()

    if (grupo not in dados):
        return jsonify({"erro": "Grupo não encontrado"}), 404
    
    # Verifica se o índice existe
    if (index < 0 or index >= len(dados[grupo])):
        return jsonify({"erro": "Contato não encontrado"}), 404
    
    body = request.json

    if (not body) or ("nome" not in body) or ("telefone" not in body):
        return jsonify({"erro:" "O campo 'nome' e 'telefone' são obrigatórios"}), 400

    #Atualiza o contato
    dados[grupo][index] = {
        "nome": body["nome"],
        "telefone": body["telefone"]
    }

    salvar_dados(dados)

    return jsonify({
        "mensagem": "Contato atualizado com êxito",
        "contato": dados[grupo][index]
    }), 200

# Deletar contato
@app.route("/contatos/<grupo>/<int:index>", methods=["DELETE"])
def excluir_contato(grupo, index):
    dados = ler_dados()

    if (grupo not in dados):
        return jsonify({"erro": "Grupo não encontrado"}), 404
    
    if (index < 0 or index >= len(dados[grupo])):
        return jsonify({"erro": "Contato não encontrado"}), 404
    
    contato_removido = dados[grupo][index]
    dados[grupo].pop(contato_removido)

    salvar_dados(dados)

    return jsonify({
        "sucesso": "Contato excluído com êxito.",
        "contato": contato_removido
    }), 200

# Inicia servidor 
if __name__ == "__main__":
    print("API rodando em http://localhost:3000/contatos")
    app.run(host="0.0.0.0", port=3000)