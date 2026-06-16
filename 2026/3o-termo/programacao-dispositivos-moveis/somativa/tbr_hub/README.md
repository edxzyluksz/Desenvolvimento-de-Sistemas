# TBRHub - Um Sistema de Gerenciamento de Biblioteca

Aplicativo mobile desenvolvido em Flutter com persistência local de dados via SQLite, com o objetivo de gerenciar o acervo de uma biblioteca, diferenciando livros físicos e e-books, e controlando o fluxo de empréstimos e devoluções com regras rígidas de estoque e validação.

## Como Executar o Projeto

1. Certifique-se de ter o [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado na sua máquina.
2. Clone este repositório.
3. Abra o terminal na raiz do projeto e execute `flutter pub get` para instalar as dependências.
4. Conecte um dispositivo físico ou inicie um emulador.
5. Execute o comando `flutter run`.

## Documentação de Requisitos (Baseado na ISO/IEC/IEEE 29148:2018)

### 1. Introdução

#### 1.1 Propósito

Este documento especifica os requisitos de software para o "Sistema de Gerenciamento de Biblioteca". O objetivo é definir as funcionalidades esperadas do aplicativo mobile, garantindo o registro eficiente de obras literárias e o controle de circulação (empréstimos) de exemplares físicos.

#### 1.2 Escopo

O software é um aplicativo móvel local focado em bibliotecários e administradores de pequenos acervos. Ele permite o cadastro detalhado de livros (físicos e digitais), visualização do acervo e registro de empréstimos e devoluções especificamente para itens físicos. Os dados são armazenados localmente no dispositivo via SQLite.

### 2. Descrição Geral

#### 2.1 Perspectiva do Produto

O aplicativo opera de forma autônoma (offline), sem dependência de serviços em nuvem ou APIs externas, garantindo alta disponibilidade e resposta rápida por meio da persistência local.

#### 2.2 Características dos Usuários

Administradores do acervo que necessitam de uma interface intuitiva, com validação de dados em tempo real e tratamento avançado de strings para evitar registros inconsistentes ou duplicados.

### 3. Requisitos Específicos

#### 3.1 Requisitos Funcionais (RF)

| ID | Descrição |
| --- | --- |
| **RF01** | O sistema deve permitir o cadastro de um livro informando Título, Autor, ISBN, Ano, Editora, Gênero, Tipo (Físico ou E-book) e Quantidade. |
| **RF02** | O sistema deve listar todos os livros cadastrados na tela principal. |
| **RF03** | O sistema deve exibir os detalhes completos de um livro selecionado através de uma interface baseada em blocos informativos (*Dashboard Cards*). |
| **RF04** | O sistema deve permitir atualizar (Editar) ou remover (Excluir) um livro diretamente pela tela de detalhes, aplicando caixas de diálogo (*Alert Dialog*) estilizadas com a identidade visual do app. |
| **RF05** | O sistema deve permitir o registro de um empréstimo exclusivamente para livros do tipo "Físico", fornecendo o nome do locatário e a data de devolução através de um seletor de calendário nativo e customizado. |
| **RF06** | O sistema deve permitir registrar a devolução de um empréstimo ativo diretamente pela listagem histórica do livro, identificando o registro pelo ID numérico do empréstimo. |
| **RF07** | O sistema deve gerenciar dinamicamente o estoque: decrementando a quantidade disponível ao realizar um empréstimo, incrementando-a ao registrar uma devolução e bloqueando novos empréstimos caso o estoque chegue a zero. |
| **RF08** | O sistema deve impedir cadastros duplicados baseando-se na restrição de ISBN único no banco de dados e no bloqueio lógico de combinações idênticas de Título + Tipo de livro. |
| **RF09** | O sistema deve realizar a sanitização de strings (remoção de espaços duplicados) e formatação automática (*Title Case*) para garantir que a primeira letra de cada palavra em Títulos, Autores, Editoras e Gêneros seja salva em maiúsculo. |
| **RF10** | O sistema deve oferecer um mecanismo de *Autocomplete* que sugere dados históricos conforme o usuário digita nos campos de Título, Autor, Editora, Gênero e Locatário. |

#### 3.2 Requisitos Não Funcionais (RNF)

| ID | Descrição |
| --- | --- |
| **RNF01** | O sistema deve ser desenvolvido em Dart utilizando o framework Flutter. |
| **RNF02** | O armazenamento de dados deve ser feito utilizando o banco de dados relacional SQLite (`sqflite`), implementando o padrão estrutural *Singleton*. |
| **RNF03** | O sistema deve lidar com exceções de restrição do banco de dados (ex: `UNIQUE constraint failed`) por meio de blocos `try-catch`, exibindo mensagens amigáveis via *SnackBars* estilizados. |
| **RNF04** | O código deve seguir o padrão de arquitetura em camadas (Models, Screens/UI, Database) para promover a modularidade e reusabilidade. |
| **RNF05** | A interface do usuário deve validar os formulários de maneira silenciosa, destacando as bordas do campo em vermelho sem deslocar ou quebrar o layout da tela. |
| **RNF06** | O sistema deve implementar persistência de estado em cache estático por instância, retendo rascunhos de novos cadastros e empréstimos caso o usuário navegue para trás antes de salvar. |
| **RNF07** | O campo "Ano" deve aceitar valores negativos (tratamento para obras escritas Antes de Cristo - A.C.) e bloquear via máscara lógica qualquer inserção de anos superiores ao ano corrente. |
