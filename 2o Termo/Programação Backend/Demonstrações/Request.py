import requests

    #1. Definir a URL da API que queremos acessar
# A URL aponta a postagem de ID 10 na API de exemplo
url = 'https://jsonplaceholder.typicode.com/posts/10'

    #2. Fazer a requisição HTTP GET
# A função requests.get() envia a requisição e retorna um objeto de resposta
response = requests.get(url)

    #3. Verificar se a requisição foi bem-sucedida (código de status 200)
if response.status_code == 200:
        #4. Acessar os dados da resposta no formato JSON
    # A função responde.json() converte a resposta para um dicionário Python
    post = response.json()

        #5. Imprimir os dados de forma legível
    print("--- Dados da Postagem ---")
    print(f"ID do Usuário: {post['userId']}")
    print(f"ID da Postagem: {post['id']}")
    print(f"Título: {post['title']}")
    print(f"Corpo: {post['body']}")
else:
     #Caso a requisição não seja bem sucedida, imprime o código de erro
    print(f"Erro ao buscar os dados. Código de status: {response.status_code}")

