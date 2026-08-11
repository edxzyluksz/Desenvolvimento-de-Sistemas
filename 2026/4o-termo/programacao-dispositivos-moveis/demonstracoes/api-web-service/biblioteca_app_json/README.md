# Fluliterry

# 1. Identificação do Projeto

- **Nome do Projeto**: Fluliterry
- **Descrição**: Aplicativo móvel multiplataforma (Flutter) para gerenciamento de bibliotecas, com funcionalidade de CRUD (Create, Read, Update, Delete) para usuários, livros e empréstimos

## 2. Propósito e Escopo

O sistema tem como objetivo digitalizar e simplificar a gestão de acervos bibliotecários. ELe permite o cadastro e controle de livros, usuários e empréstimos, oferecendo uma interface intuitiva para administradores. O escopo atual inclui operações básicas de gerenciamento, com dados persistidos em um backend simulado via `json-server`

## 3. Requisitos Funcionais (RF)

| ID | Requisito | Descrição |
| --- | --- | --- |
| RF01 | Gerenciar livros | Listar, cadastrar, editar e excluir livros do acervo |
| RF02 | Gerenciar usuários | Listar, cadastrar, editar e excluir usuários do sistema |
| RF03 | Gerenciar empréstimos (de livros) |  |
| RF04 | Navegação | Interface com navegação para abas (livros, empréstimos) | 

## 4. Requisitos Não Funcionais (RNF)

| ID | Requisito | Descrição |
| --- | --- | --- |
| RNF01 | Arquitetura | Baseada em camadas (Model, Service, Controllers, Views) seguindo o padrão MVC |
| RNF02 | Persistência | Utilizar um arquivo db.json como fonte de dados acessando via REST |
| RNF03 | Tecnologia | Desenvolvimento em Flutter/Dart, com consumo de API via pacote HTTP |
| RNF04 | Comunicação | A comunicação com o backend é feita através de requisições HTTP síncronas (GET, POST, PUT, DELETE) |

## 5. Endpoints da API (Backend)

| Método | Endpoint | Descrição |
| --- | --- | --- |
| GET | /users | Lista todos os usuários |
| GET | /users/{id} | Busca um usuário por ID |
| POST | /users | Cria um novo usuário |
| PUT | /users/{id} | Atualiza um usuário |
| DELETE | /users/{id} | Remove um usuário |

| GET | /books | Lista todos os livros |
| GET | /books/{id} | Busca um livro por ID |
| POST | /books | Cria um novo livro |
| PUT | /books/{id} | Atualiza um livro |
| DELETE | /books/{id} | Remove um livro |

| GET | /loans | Lista todos os empréstimos |
| POST | /loans | Registra um novo empréstimo |

## 6. Diagramas

### 6.1 Diagramas de Entidade Relacionamento (DER)

```mermaid
erDiagram
    users {
        int id PK
        string name
        string email
    }

    books {
        int id pk
        string title
        string author
        boolean available
    }

    loans {
        int id PK
        int userId FK
        int bookId FK
        date startDate
        date dueDate
        boolean returned
    }

    user ||--o{ loan : "do"}
    book ||--o{ loan : "is loan in"}
```

### 6.2 Diagrama de Classe

```mermaid
classDiagram
    class ApiService {
        <<static>>
        _String _baseURL
        +getList(String path) Future~List~
        +getOne(String path, String id) Future~Map~
        +post(String path, Map body) Future~Map~
        +put(String path, Map body, String id) Future~Map~
        +delete(String path, String id) Future~void~
    }

    class User {
        String id
        String name
        String email
    }

    class Book {
        String id
        String title
        String author
        bool available
    }

    class Loan {
        String id
        String userId
        String bookId
        String loanDate
        String returnDate
        bool returned
    }

```