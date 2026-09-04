# sqflite_exemplo

## Arquitetura e Modelagem: Módulo de Persistência Local (Armazenamento Local)

Este projeto descreve as decisões de modelagem de dados e fluxo de peristência local utilizando o pacote ``sqflite` integrado ao ecossistema Flutter.

## 1. Mapeamento Objeto-Relacional (ORM)

O `sqflite` se comunica nativamente com dados estruturas na forma de pares de linha/coluna (`Map`<String, dynamic>`). Abaixo o diagrama ilustra o ciclo de vida e a transformação sofrida pelo dado desde a memória da aplicação (Objeto) até o disco de armazenamento (Tabela SQLite).

```mermaid
graph TD
    subgraph Memória Dart
        A[Instância da Classe Nota]
    end

    subgraph Serialização
        B["nota.toMap()"]
        C["Nota.fromMap(map)"]
    end

    subgraph Persistência SQLite
        D[("Tabela: nota<br>Colunas: id, titulo, conteudo")]
    end

    %% Fluxo de Escrita (INSERT/UPDATE)
    A -->|1. Transforma em Map| B
    B -->|2. Executa INSERT/UPDATE| D

    %% Fluxo de Leitura (SELECT)
    D -->|3. Executa QUERY retorna Map| C
    C -->|4. Instancia Novo Objeto| A
```

> Para ler o Mermaid via VS Code, instalar a extensão 'Markdown Preview Github Styling'

## Modelagem de Entidade e Relacionamento (MER)

O banco de dados SQLite armazena a estrutura da tabela utilizando restrições (constraints) e tipos primitivos de dados relacionais

```mermaid
erDiagram 
    NOTA {
        INTEGER id PK "AUTOINCREMENT"
        TEXT titulo "NOT NULL"
        TEXT conteudo "NOT NULL"
    }
```