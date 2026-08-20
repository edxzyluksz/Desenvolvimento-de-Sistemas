# Desenvolvimento de API Restful com Laravel

## Objetivo

Este curso tem como objetivo ensinar a instalar, configurar e desenvolver APIs robustas utilizando o framework Laravel. Uma solução completa para desenvolvimento de backend em PHP

Criar rotas, manipular o banco de dados via Eloquent ORM, construir controladores de API e proteger seus endpoints com autenticação via Tokens (Laravel Sanctum).

## Módulo 1: Fundamentos e Preparação do Ambiente

### O que é o Laravel?

Laravel é um framework PHP projetado para facilitar o processo de desenvolvimento, oferecendo uma sintaxe elegante e ferramentas robustas. Em uma arquitetura monolítica, ele utiliza o padrão MVC (Model-View-Controller). Porém, no contexto de **APIs**, a camada "View" é substituída por **respostas JSON**, que serão consumidas por aplicações Front-end (React, Vue, Angular) ou Mobile (Flutter, React Native).

#### Principais Características:

MVC: Arquitetura que separa a lógica de negócios, a apresentação e os dados da aplicação;

Eloquent ORM: Um mapeador objeto-relacional(ORM) que facilita a interação com banco de dados;

Artisan CLI: Uma interface de linha de comando que automatiza tarefas comuns de desenvolvimento;

Blade Template Engine: Um mecanismo de template simples para criação de views (FrontEnd);

Middleware: Interface que permite a filtragem de requisição HTTP.

#### Vantagens do uso do Laravel

Sintaxe Elegante: sintaxe limpa e expressiva, que facilita a escrita e manutenção de código

Ecossitema Rico: Pacotes, Bibliotecas que facilitam o desenvolvimento

Segurança: Proteção contra SQL Injection, XSS, CSRF

Flexibilidade e Performance

Atualizações Regulares

## Preparação do Ambiente de Desenvolvimento

Para desenvolver com Laravel, você precisa configurar o ambiente com os seguintes requisitos:
1. **PHP 8.x**
2. **Composer** (Gerenciador de dependências do PHP)
3. **Banco de Dados** (PostgreSQL ou MySQL)
4. **Postman, Insomnia ou ThunderClient** (Ferramentas para testar as requisições da API, já que não usaremos o navegador para ver telas).

### Verificar Versão do PHP e Instalar o Composer

```bash
php -v
composer --version
composer create-project --prefer-dist laravel/laravel restful-laravel
```

### Configuração Inicial com PostgreSQL
O arquivo `.env` na raiz do projeto é usado para configurar variáveis de ambiente. Ajuste as configurações de banco de dados:

```env

DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=nome_db
DB_USERNAME=postgres
DB_PASSWORD=postgres

```
### Módulo 2: Criando Minha Primeira Request 

#### Métodos HTTP Restful
O Laravel suporta todos os métodos HTTP usados em APIs:
* **GET**: Recuperar dados (ex: listar produtos).
* **POST**: Criar novos dados.
* **PUT/PATCH**: Atualizar dados existentes.
* **DELETE**: Remover dados.

#### Exemplo de Rota Simples
No arquivo `routes/web.php`

```php

Route::get("/ping", function() {
    return response()->json(["message" => "pong! Api Funcionando"], 200);
});

```

*Inicie o servidor (`php artisan serve`) e acesse `http://127.0.0.1:8000/ping` no Postman.*

## Módulo 3: Banco de Dados e Eloquent ORM

As **Migrations** fornecem uma maneira de criar e gerenciar o esquema do banco de dados de forma programática. O **Eloquent ORM** é o mapeador objeto-relacional do Laravel, permitindo interagir com as tabelas usando PHP orientado a objetos.

### Criando Model e Migration
Podemos criar o Model e a Migration simultaneamente usando o Artisan:
```bash
php artisan make:model Produto -m
```