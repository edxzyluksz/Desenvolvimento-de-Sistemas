# Introdução ao Desenvolvimento Mobile

## Sumário

- [Tipo de Desenvolvimento](#tipo-de-desenvolvimento)

## Tipo de Desenvolvimento

- Nativo
  - Android:
    - SDK : Android SDK;
    - IDE: Android Studio;
    - Linguagens : Kotlin e Java;
    - Ambientes: Mac, Windows, Linux.
  - IOS:
    - SDK: Cocoa Touch;
    - IDE: Xcode;
    - Linguagens: Swift / ObjectType-C;
    - Ambientes: Mac.

- Multiplataforma
  - React Native:
    - SDK: Node.JS;
    - IDE: VSCode;
    - Linguagens: JavaScript / TypeScript;
    - Ambientes: Mac, Win, Linux.
  - Flutter
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

- Downaload do Android SDK - Command Line Tools
- Adicionar o Command-line ao `C:\src\AndroidSDK`
- Adicionar o SDKManager as variáveis de ambiente (sistema)
- Download dos pacotes
  - emulator
  - platforms
  - platform-tools
  - build-tools
- Adicionar o ADB e o Emulator às variáveis de ambiente
- Criação da Imagem do Emulador - Via sdkmanager
- Build do Emulador - via sdkmanager

### Criação de Projetos e Códigos da Linha de Comando

- Criação de Projetos
  - `flutter create <nome_do_app>`
    - flags (parâmetros):
      - --empty : Cria um aplicativo "vazio" (Hello World!)
      - --platforms : Permite a seleção de uma plataforma de desenvolvimento
        - ex: `--platforms=android` (a criação do projeto será somente para a plataforma android)
  - exemplo de criação de uma aplicativo android vazio
    - `flutter create nome_do_app --empty --platforms=android`
    - obs: nome do aplicativo: Todas as letras minúsculas, separação de palavras com '\_';
  - `flutter doctor`
    - Permite correção de pequenos problemas no flutter e identificação dos parâmetros funcionais em relação as plataformas de desenvolvimento
    - Sempre rodar o `flutter doctor` no começo do desenvolvimento
  - `flutter clean`
    - limpa o cache do build (apaga o apk anterior)
  - `flutter run -v`
    - build do app (apk)
