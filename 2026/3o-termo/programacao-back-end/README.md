# 🧑‍🍳 Programação Back-end

## 📋 Sumário

- [☕ Programação Orientada a Objetos (c/ Java)](#-programação-orientada-a-objetos-c-java)
  - [💊 Encapsulamento](#-encapsulamento)
  - [⚖️ Herança](#️-herança)
  - [🐛 Polimorfismo](#-polimorfismo)
  - [😵‍💫 Abstração](#-abstração)
  - [🛏️ API REST](#️-api-rest)
  - [🧲 Springboot](#-springboot)
  - [🛠️ Maven](#️-maven)
  - [🌿 Thymeleaf](#-thymeleaf)
  - [⚙️ .env](#️-env)
  - [🐳 Docker](#-docker)
    - [🐋📄 Dockerfile](#-dockerfile)
  - [🌐 Render](#-render)
  - [🗄️ JSON](#️-json)
- [Comparação: Express (JavaScript) × Flask (Python)](#comparação-express-javascript--flask-python)
- [Rotas da API – CRUD de Contatos](#rotas-da-api--crud-de-contatos)
- [Códigos de Status HTTP comuns](#códigos-de-status-http-comuns)

## ☕ Programação Orientada a Objetos (c/ Java)

### 💊 Encapsulamento

Uma forma de proteger os atributos de uma classe, tornando-os privados, e com métodos públicos

### ⚖️ Herança

Instanciar uma super classe (geralmente abstrata) que possui atributos que classes filha herdam

### 🐛 Polimorfismo

Métodos com o mesmo nome mas que executam ações diferentes, essas  podem ser:

- Polimorfismo de Classe: Mesmo método reescrito
- Polimorfismo de Parâmetros: Veremos em breve

### 😵‍💫 Abstração

Uma classe que não deve ser instanciada diretamente, tornando o código seguro que impede o programa de criar um objeto com atributos genéricos.

### 🛏️ API REST

Esta é a forma pela qual o Backend e o Frontend se conversam, enviando requisições específicas que acionam cada etapa CRUD do backend:

- Post - Create
- Get - Read
- Patch - Update
- Delete

## 🧲 Springboot

O Java Spring Framework (Spring Framework) é uma framework popular, de código aberto, de nível corporativo para criar aplicações de nível de produção que executam na máquina virtual (JVM). O Spring Boot otimiza e simplifica o desenvolvimento do Spring Framework por meio de três funcionalidades principais:

- Autoconfiguração
- Uma abordagem opinativa para configuração
- A capacidade de criar aplicações independentes

## 🛠️ Maven

O Maven é uma ferramenta de automação de construção e gerenciamento de dependências para projetos Java. Ele simplifica o processo de construção, teste e implantação de aplicativos Java, fornecendo uma estrutura padronizada para organizar o código-fonte, as dependências e as tarefas de construção. O Maven utiliza um arquivo de configuração chamado `pom.xml` (Project Object Model) para definir as dependências do projeto, as fases de construção e outras configurações necessárias para o desenvolvimento e a implantação do aplicativo. Ele também facilita a integração com repositórios de dependências, como o Maven Central, para baixar e gerenciar as bibliotecas necessárias para o projeto.

## 🌿 Thymeleaf

O Thymeleaf é um motor de templates moderno e versátil para Java, projetado para ser utilizado tanto em ambientes web quanto em ambientes que não sejam web.

Em ambientes web, ele é comumente usado para gerar páginas HTML dinâmicas, atualizadas em tempo real, nas quais adicionamos valores e informações vindas do banco de dados.

> Projetos de Teste: `rh`, `teste_thymeleaf`

## ⚙️ .env

O arquivo `.env` é um arquivo de texto simples que contém variáveis de ambiente e seus valores correspondentes. Ele é usado para armazenar informações sensíveis, como credenciais de banco de dados, chaves de API e outras configurações que não devem ser hardcoded no código-fonte. O arquivo `.env` é geralmente colocado na raiz do projeto e é lido pelo aplicativo durante a inicialização para configurar o ambiente de execução.

## 🐳 Docker

O Docker é uma plataforma de software que permite criar, implantar e executar aplicativos em contêineres. Os contêineres são unidades leves e portáteis que empacotam o código do aplicativo, suas dependências e o ambiente de execução necessário para que ele funcione de maneira consistente em qualquer ambiente.

O tamanho de um container Docker gira em torno de 10 a 100 MB, dependendo da base da imagem e das dependências incluídas. O Docker é amplamente utilizado para facilitar o desenvolvimento, a implantação e a escalabilidade de aplicativos, permitindo que os desenvolvedores criem ambientes isolados e consistentes para suas aplicações.

### 🐋📄 Dockerfile

O Dockerfile é um arquivo de texto que contém uma série de instruções para construir uma imagem Docker. Ele define o ambiente, as dependências e as etapas necessárias para criar um contêiner a partir dessa imagem. Ele utiliza uma sintaxe específica para descrever como a imagem deve ser construída, incluindo a base da imagem, as instruções de instalação, as variáveis de ambiente e os comandos a serem executados quando o contêiner for iniciado.

Ex:

```Dockerfile
FROM openjdk:17
COPY . /app
WORKDIR /app
RUN javac Main.java
CMD ["java", "Main"]
```

## 🌐 Render

Render é uma plataforma de hospedagem em nuvem que permite implantar aplicativos web, APIs e serviços de backend de forma rápida e fácil. Ele oferece uma interface amigável para gerenciar e escalar suas aplicações, além de suporte para várias linguagens de programação e frameworks. Com o Render, você pode implantar seu aplicativo diretamente do repositório do GitHub, configurar variáveis de ambiente, monitorar o desempenho e escalar automaticamente conforme a demanda. É uma opção popular para desenvolvedores que desejam uma solução de hospedagem simples e eficiente para seus projetos.

## 🗄️ JSON

JSON (JavaScript Object Notation) é um formato leve de troca de dados que é fácil de ler e escrever para humanos, e fácil de analisar e gerar para máquinas. Ele é amplamente utilizado para transmitir dados entre um servidor e um cliente em aplicações web. O JSON é baseado em uma estrutura de chave-valor, onde os dados são organizados em objetos (delimitados por chaves `{}`) e arrays (delimitados por colchetes `[]`). Ele suporta tipos de dados como strings, números, booleanos, nulos, objetos e arrays, tornando-o uma escolha popular para a representação de dados estruturados em APIs e outras aplicações.

Usa-se o módulo padrão `fs` do Node.js para ler e escrever arquivos JSON, permitindo que os desenvolvedores manipulem dados de forma eficiente em suas aplicações. O JSON é amplamente adotado devido à sua simplicidade e compatibilidade com várias linguagens de programação, tornando-se um formato de dados universalmente aceito para a comunicação entre sistemas.

Em python, a biblioteca `json` é usada para ler e escrever arquivos JSON, facilitando a manipulação de dados estruturados em aplicações Python. Com a função `json.load()`, é possível carregar dados de um arquivo JSON para um objeto Python, enquanto a função `json.dump()` permite escrever um objeto Python em um arquivo JSON, tornando o processo de leitura e escrita de dados JSON simples e eficiente em Python.

## Comparação: Express (JavaScript) × Flask (Python)

| Conceito | Express | Flask |
| --- | --- | --- |
| Criar servidor | express() | Flask(__name__) |
| JSON no body | req.body | request.json |
| GET | app.get() | methods=["GET"] |
| POST | app.post() | methods=["POST"] |
| PUT | app.put() | methods=["PUT"] |
| DELETE | app.delete() | methods=["DELETE"] |
| Resposta | res.json() | jsonify() |

## Rotas da API – CRUD de Contatos

| Método | URL | Descrição |
| --- | --- | --- |
| GET | /contatos/alunos | Listar contatos |
| POST | /contatos/alunos | Criar contato |
| PUT | /contatos/alunos/0 | Atualizar contato |
| DELETE | /contatos/alunos/0 | Excluir contato |

## Códigos de Status HTTP comuns

- 400 - Bad Request: Requisição malformada ou inválida.
- 404 - Not Found: Recurso não encontrado.
- 500 - Internal Server Error: Erro no servidor.
- 200 - OK: Requisição bem-sucedida.
- 201 - Created: Recurso criado com sucesso.
- 501 - Not Implemented: Método HTTP não suportado.

## Ambientes virtuais

Ambientes virtuais são uma prática recomendada para isolar as dependências de um projeto, garantindo que as bibliotecas e pacotes necessários para um projeto específico não entrem em conflito com os de outros projetos. Eles permitem que você crie um ambiente separado para cada projeto, onde você pode instalar as dependências necessárias sem afetar o sistema global ou outros projetos.

Situações em que ambientes virtuais são úteis:

- **Gerenciamento de dependências**: Permite instalar pacotes específicos para um projeto sem afetar outros projetos ou o ambiente global.
- **Isolamento de projetos**: Evita conflitos entre diferentes versões de pacotes usados
em projetos diferentes.
- Facilidade de desenvolvimento: Facilita a configuração e o gerenciamento de dependências, tornando o processo de desenvolvimento mais eficiente e organizado.

### .venv (Python)

```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate  # Windows
```

## PHP - PHP: Hypertext Preprocessor

PHP é uma linguagem de script de código aberto amplamente utilizada para desenvolvimento web. Ela é especialmente adequada para criar páginas web dinâmicas e interativas, permitindo que os desenvolvedores integrem facilmente o código PHP com HTML. O PHP é executado no servidor, o que significa que o código é processado antes de ser enviado ao navegador do usuário, tornando-o ideal para tarefas como manipulação de formulários, acesso a bancos de dados e geração de conteúdo dinâmico. Com uma ampla comunidade de desenvolvedores e uma vasta gama de bibliotecas e frameworks disponíveis, o PHP continua sendo uma escolha popular para o desenvolvimento web em todo o mundo.

### php.init

O arquivo `php.ini` é o arquivo de configuração principal do PHP, onde você pode definir várias diretivas que controlam o comportamento do PHP em seu ambiente de execução. Ele é usado para configurar aspectos como:

- Configurações de exibição de erros
- Configurações de upload de arquivos
- Configurações de tempo de execução
- Configurações de extensão
- Configurações de segurança

O `php.ini` é essencial para personalizar o ambiente PHP de acordo com as necessidades do seu projeto, permitindo que você ajuste as configurações para otimizar o desempenho, a segurança e a funcionalidade do seu aplicativo PHP. Ele é geralmente localizado na pasta de instalação do PHP ou em um diretório específico do servidor web, dependendo da configuração do ambiente.

### index.php

Nome comum para o arquivo principal de um projeto PHP, que serve como ponto de entrada para a aplicação. Ele é responsável por processar as requisições do usuário, interagir com o banco de dados e gerar a resposta adequada, geralmente em formato HTML, para ser exibida no navegador. O `index.php` é frequentemente usado para lidar com rotas e controlar o fluxo da aplicação, tornando-se um componente central na estrutura de muitos projetos PHP.

Se o nome do arquivo for diferente de `index.php`, é necessário configurar o servidor web para reconhecer o nome do arquivo como ponto de entrada, ou seja, como a página inicial da aplicação ou colocar o novo nome do arquivo na URL para acessar a aplicação, por exemplo: `http://localhost/novo_nome.php`.
