# Introdução ao Desenvolvimento Mobile 📱

## Sumário

- [Aviso](#-aviso)
- [Tipo de Desenvolvimento](#tipo-de-desenvolvimento)
- [Preparação de Ambiente: Dart e Flutter](#preparação-de-ambiente-dart-e-flutter)
- [Instalação do Flutter SDK](#instalação-do-flutter-sdk)
- [Instalação do Android SDK](#instalação-do-android-sdk)
- [Linha de Comando](#linha-de-comando)
- [Gerenciamento de dependências do PubSec()](#gerenciamento-de-dependências-do-pubsec)
- [Estrutura Básica de um Aplicativo em Flutter](#estrutura-básica-de-um-aplicativo-em-flutter)
  - [Árvore de Widgets](#árvore-de-widgets)
  - [Tipos de Janelas](#tipos-de-janelas)
    - [Stateless](#stateless)
    - [Stateful](#stateful)
    - [Comparativo VS](#comparativo-vs)

## ⚠️ Aviso

Projetos Flutter **não funcionarão corretamente** se estiverem dentro de pastas que contenham:

- Espaços
- Acentuação (á, é, í, ç, etc.)
- Caracteres especiais

O Flutter e o Gradle podem apresentar erros inesperados quando o caminho do projeto não utiliza apenas caracteres ASCII simples.

## Tipo de Desenvolvimento

### Nativo

#### Android

- SDK : Android SDK;
- IDE: Android Studio;
- Linguagens : Kotlin e Java;
- Ambientes: Mac, Windows, Linux.

#### IOS

- SDK: Cocoa Touch;
- IDE: Xcode;
- Linguagens: Swift / ObjectType-C;
- Ambientes: Mac.

### Multiplataforma
  
#### React Native

- SDK: Node.JS;
- IDE: VSCode;
- Linguagens: JavaScript / TypeScript;
- Ambientes: Mac, Win, Linux.

#### Flutter

- SDK: Flutter SDK;
- IDE: VSCode, Android Studio;
- Linguagens: Dart;
- Ambientes: Mac, Win, Linux.

## Preparação de Ambiente: Dart e Flutter

Dart: É uma linguagem orientada a objetos
Flutter: É um framework que usa a linguagem Dart

**O que é um framework?**

Um conjunto de bibliotecas voltado para uma solução completa de um problema. Nesse caso, para as aplicações mobile.

## Instalação do Flutter SDK

- Download do arquivo .zip na página flutter.dev
- Inclusão do flutter na pasta `C:\src`
- Inclusão do flutter/bin nas variáveis de ambiente (sistema)
- use o comando `flutter --version` para verificar

### Instalação do Android SDK

- Download do Android SDK - Command Line Tools
- Adicionar o Command-line ao `C:\src\AndroidSDK`
- Adicionar o SDKManager as variáveis de ambiente (sistema)

#### Download dos pacotes

- emulator
- platforms
- platform-tools
- build-tools

- Adicionar o ADB e o Emulator às variáveis de ambiente
- Criação da Imagem do Emulador - Via sdkmanager
- Build do Emulador - via sdkmanager

### Linha de Comando

#### `flutter create <nome_do_app>`

##### flags (parâmetros)

- --empty : Cria um aplicativo "vazio" (Hello World!)
- --platforms : Permite a seleção de uma plataforma de desenvolvimento

ex: `--platforms=android` (a criação do projeto será somente para a plataforma android)

##### Exemplo de Criação

- `flutter create nome_do_app --empty --platforms=android`

  obs: nome do aplicativo: Todas as letras minúsculas, separação de palavras com '\_';

##### `flutter doctor`

Permite correção de pequenos problemas no flutter e identificação dos parâmetros funcionais em relação as plataformas de desenvolvimento

Sempre rodar o `flutter doctor` no começo do desenvolvimento

##### `flutter clean`

limpa o cache do build (apaga o apk anterior)

##### `flutter run -v`

build do app (apk)

#### Gerenciamento de dependências do PubSec()

##### Instalação

`flutter pub add <nome_dependencia>`

##### Baixar e instalar dependências projetadas

`flutter pub get`

##### Outros comandos do flutter pub (dependências)

`flutter pub outdated` (verifica se as dependências estão desatualizadas)

`flutter pub upgrade` (atualiza as dependências do flutter pub)

### Estrutura Básica de um Aplicativo em Flutter

#### Árvore de Widgets

``` mermaid
flowchart TD
  subgraph MaterialApp["MaterialApp"]
  end
  subgraph Janelas["Janelas"]
    StateLess["StateLess"]
    StateFull["StateFull"]
  end
  subgraph Scaffold["Scaffold"]
    AppBar["Appbar"]
    Body["Body"]
    BNBar["BNBar"]
    Drawer["Drawer"]
    FAButton["FAButton"]
  end
  MaterialApp --> Janelas
  Janelas --> Scaffold
```

#### Tipos de Janelas

##### Stateless

Janelas imutáveis - Uma vez construída ela não se altera. Apesar disso, pode ser reescrita caso ocorra uma troca de janelas no processo.

OBS: Pode ter movimento (GIFs, Movies, Carousels, Cards), mas não consegue alterar imagens, os vídeos e os elementos de movimento depois de construídos. Para isso, é necessário o uso de uma janela statefull.

##### Stateful

Janelas dinâmicas que permitem mudança de estado (setState)

OBS: Permite adicionar elementos a janela, como novas imagens, novos textos, entre outros.

##### Comparativo VS

|Característica|Stateless|Stateful|
|-|-|-|
|Mutabilidade|Não|Sim|
|Uso Ideal|Layouts Fixos e exibição de dados estáticos|Interações do Usuário, ANimações e Dados Dinâmicos|
|Método Principal|build()|build() + setState()|
