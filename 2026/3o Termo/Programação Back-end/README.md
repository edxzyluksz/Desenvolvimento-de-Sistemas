# Programação Back-end

## Sumário

- [Programação Orientada a Objetos (c/ Java)](#programação-orientada-a-objetos-c-java)
  - [API REST](#api-rest)
  - [Springboot](#springboot)
  - [Thymeleaf](#thymeleaf)

## Programação Orientada a Objetos (c/ Java)

**Encapsulamento**
Uma forma de proteger os atributos de uma classe, tornando-os privados, e com métodos públicos

**Herança**
Instanciar uma super classe (geralmente abstrata) que possui atributos que classes filha herdam

**Polimorfismo**
Métodos com o mesmo nome mas que executam ações diferentes, essas ações podem ser:

- Polimorfismo de Classe: Mesmo método reescrito
- Polimorfismo de Parâmetros: Veremos em breve

**Abstração**
Uma classe que não deve ser instanciada diretamente, tornando o código seguro que impede o programa de criar um objeto com atributos genéricos.

### API REST

Esta é a forma pela qual o Backend e o Frontend se conversam, enviando requisições específicas que acionam cada etapa CRUD do backend:

- Post - Create
- Get - Read
- Patch - Update
- Delete

## Springboot

O Java Spring Framework (Spring Framework) é uma framework popular, de código aberto, de nível corporativo para criar aplicações de nível de produção que executam na máquina virtual (JVM). O Spring Boot otimiza e simplifica o desenvolvimento do Spring Framework por meio de três funcionalidades principais:

- Autoconfiguração
- Uma abordagem opinativa para configuração
- A capacidade de criar aplicações independentes

## Thymeleaf

O Thymeleaf é um motor de templates moderno e versátil para Java, projetado para ser utilizado tanto em ambientes web quanto em ambientes que não sejam web.

Em ambientes web, ele é comumente usado para gerar páginas HTML dinâmicas, atualizadas em tempo real, nas quais adicionamos valores e informações vindas do banco de dados.

> Projetos de Teste: `rh`, `teste_thymeleaf`
