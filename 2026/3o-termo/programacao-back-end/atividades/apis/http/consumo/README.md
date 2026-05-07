# Jogo da Forca em Node.js

Um jogo da forca simples que busca palavras aleatórias da API [Dicionário Aberto](https://www.dicionario-aberto.net/) e permite que você jogue direto no terminal Node.js.

O jogo lida com **acentos e cedilha** usando normalização, e evita que você digite números ou letras repetidas.

## Pré-requisitos

- [Node.js](https://nodejs.org/) instalado na sua máquina.
- O pacote `prompt-sync` para capturar entrada do usuário no terminal.

## Instalação

1. Clone ou baixe este repositório.
2. Navegue até a pasta do projeto no terminal.
3. Instale o `prompt-sync`:

```bash
npm install prompt-sync
```

## Como jogar

Execute o jogo usando Node.js:

```bash
node jogodaForca.js
```

O jogo vai exibir a quantidade de letras da palavra oculta:
```output
Palavra: _ _ _ _ _
```

Digite uma letra por vez e pressione ENTER:

- Se a letra existir na palavra, ela será revelada.
- Se não existir, você perde uma chance.

O jogo termina quando:

- Você acertar todas as letras (vence)
- Suas chances acabarem (perde).
Ao final, você poderá escolher entre jogar novamente ou encerrar o jogo.

### Regras e funcionalidades

- Letras já tentadas não podem ser digitadas novamente.
- Apenas letras são válidas (números e caracteres especiais são ignorados).
- Letras com acento ou cedilha são normalizadas para comparação, mas exibidas corretamente.
- O jogador começa com 5 chances por palavra.
- Ao finalizar o jogo, a palavra correta e todas as letras tentadas são exibidas.

## Exemplo de jogo

``` output
==== Jogo da Forca ====

Palavra: _ _ _ _ _

Digite uma letra da palavra: a
Parabéns, você acertou uma letra!

Palavra: _ A _ _ _

Digite uma letra da palavra: z
Esta letra não existe na palavra!
Chances restantes: 4

...
=== JOGO ENCERRADO! ===
A palavra era: MÁSCARA
Estas foram suas letras tentadas: A, Z, M
Deseja continuar? [1] - Sim | [2] - Não
```

## Código

`jogodaForca.js`

Ele utiliza fetch para buscar palavras aleatórias na API, prompt-sync para entrada do usuário e funções auxiliares para validação e normalização das letras.