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
- Inclusão do flutter na pasta  `C:\src`
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