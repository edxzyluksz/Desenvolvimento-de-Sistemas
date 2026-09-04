# Fetchvie

Buscando filmes e séries de com [tmdb](https://api.themoviedb.org) API

## Funcionalidades

Registrar/Login: O usuário deve ser capaz de criar uma conta.

Buscar Filmes/Séries: Implementar uma barra de pesquisa que consulta a API do TMDB em tempo real.

Adicionar aos Favoritos: Ao clicar em um filme, o sistema deve salvar o título, ID e o caminho do poster no Base de Dados.

Listar Favoritos: Exibir uma galeria (Grid) com os filmes salvos pelo usuário logado.

Avaliação: Permitir que o usuário atribua uma nota (rating) aos seus filmes favoritos (Opcional).

Remover Favorito: Opção para excluir um item da lista pessoal.

## Ferramentas (Dependências)

`'http'` - Realizar requisições RESTful`

`flutter_dotenv` - Carregar informações do arquivo .env

`sqflite` - Persistência de usuário de cache leve para dados de filmes
