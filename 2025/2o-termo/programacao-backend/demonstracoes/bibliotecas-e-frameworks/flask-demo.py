from flask import Flask

#1. Cria a instância de aplicativo Flask
app = Flask(__name__)

#2. Define a primeira rota para a URL base ('/')
# Quando alguém acessa a URL raiz, esta função é executada
@app.route('/')
def hello_world():
    return '<h1>Olá, Mundo Maravilhoso 🌏</h1><p>Bem-vindo à sua primeira página com Flask (Nice!!!) 😉.</p>'

#3. Define uma segunda rota que aceita um parâmetro na URL
# O <nome> na URL será passado como argumento para a função
@app.route('/ola/<nome>')
def ola_nome(nome):
    return f'<h1>Olá, {nome}! 👍😎</h1>'

# 4. Executa o servidor de desenvolvimento
# O código dentro desse bloco só roda quando você executa o arquivo diretamente

if __name__ == '__main__':
    app.run(debug=True)