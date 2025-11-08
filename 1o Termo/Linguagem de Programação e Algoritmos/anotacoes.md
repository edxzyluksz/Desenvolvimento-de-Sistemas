# Lógica de Programação e Algoritmos 👾

**💡 Conceitos Fundamentais**
- Lógica de Programação: A base do pensamento estruturado para desenvolver sistemas eficientes.
- Algoritmo: Uma sequência ordenada e finita de passos para realizar uma tarefa.
- Estrutura de Análise de Problemas:
- Entrada (Input): O que é dado.
- Processamento: O que precisa ser feito com os dados.
- Saída (Output): O resultado esperado.
- Elementos Essenciais: Entrada/Saída de Dados, Condicionais (SE/ENTÃO/SENÃO), e Laços de Repetição (ENQUANTO/PARA).

## 💻 Exercícios Resolvidos (Pseudocódigo)

**1. Média de Notas e Condição de Aprovação**

**Objetivo:** Calcular a média de três notas e verificar se o aluno está APROVADO (Média $\ge 6.0$) ou REPROVADO.

```
VARIÁVEIS:
"Nota1, Nota2, Nota3", Real, Notas do aluno.
Media, Real, Média aritmética das notas.
MediaMinima, Real, Média mínima necessária para aprovação (Ex: 6.0).
```

```
INICIO
    // ENTRADA
    SOLICITAR Nota1
    SOLICITAR Nota2
    SOLICITAR Nota3
    DEFINIR MediaMinima = 6.0 // Ou valor solicitado

    // PROCESSAMENTO
    Media = (Nota1 + Nota2 + Nota3) / 3

    // SAÍDA E CONDICIONAL
    SE Media >= MediaMinima ENTÃO
        ESCREVER "APROVADO"
    SENÃO
        ESCREVER "REPROVADO"
    FIM SE
FIM
```

**2. Cálculo de Saldo e Quantidade (Ingressos)**

**Objetivo:** Calcular a quantidade máxima de ingressos que podem ser comprados com um valor total e o troco resultante.

```
VARIÁVEIS:
TotalDinheiro, Real, O dinheiro total disponível (Ex: 50.00).
ValorIngresso, Real, O preço de um único ingresso (Ex: 12.00).
Quantidade, Inteiro, Número de ingressos comprados.
Sobrou, Real, O troco/valor restante.
```

```
INICIO
    // ENTRADA/DADOS
    TotalDinheiro = 50.00
    ValorIngresso = 12.00

    // PROCESSAMENTO
    // Uso de divisão inteira para obter a quantidade máxima
    Quantidade = TotalDinheiro / ValorIngresso 
    
    // Cálculo do troco
    Sobrou = TotalDinheiro - (ValorIngresso * Quantidade)

    // SAÍDA
    ESCREVER "Quantidade de Ingressos:", Quantidade
    ESCREVER "Sobrou R$", Sobrou
FIM
```

**3. Laço de Repetição: Tabuada de 1 a 10**

**Objetivo:** Imprimir a tabuada de 1 a 10 (múltiplos de 1 a 10).

```
VARIÁVEIS:
X, Inteiro, O número base da tabuada (de 1 a 10).
Y, Inteiro, O multiplicador (de 1 a 10).
```

```
INICIO
    X = 1
    // Loop principal para o número base
    ENQUANTO X <= 10 FAÇA
        Y = 1
        // Loop aninhado para o multiplicador
        ENQUANTO Y <= 10 FAÇA
            // Imprime "X x Y = Resultado"
            IMPRIMA (X, "x", Y, "=", X * Y)
            Y = Y + 1
        FIM ENQUANTO
        X = X + 1
    FIM ENQUANTO
FIM
```

**4. 🗺️ Fluxograma (Exemplo: Pedido de Pizzaria)**

O fluxo abaixo ilustra a lógica de um sistema de pedidos, com seleção de itens, cálculo de total e decisão de finalizar ou continuar comprando.

```
INÍCIO
  |
  V
EXIBIR CARDÁPIO
  |
  V
ESCOLHA CLIENTE (A, B, C, D, ou Fechar)
  |
  V
[DECISÃO: OPÇÃO VÁLIDA?] -- NÃO --> VOLTA CARDÁPIO
  |
  |
  -- SIM --> V
[DECISÃO: SELEÇÃO ITEM (A, B, C, D)]
  |
  V
ATUALIZAR QUANTIDADE E VALOR TOTAL
  |
  V
[DECISÃO: DESEJA FECHAR A CONTA?] -- NÃO --> VOLTA CARDÁPIO
  |
  |
  -- SIM --> |
             |
             V
      COBRAR CLIENTE
            |
            V
           FIM
```

## 📝 Variáveis e Tipos de Dados
**🔠 Declaração e Regras de Variáveis**

Uma variável é um campo na memória que pode ter seu conteúdo alterado durante a execução do algoritmo. Uma constante é um campo que não pode ser alterado.

**Regras para Nomes de Variáveis**

- Nunca inicia com um número;
- Não pode começar com operadores matemáticos (+, -, *, /);
- Permite underline (_);
- Permite letras e números;
- Pode começar com caracteres especiais (dependendo da linguagem) Ex: $ em PHP.

**Convenções (Estilo de Codificação)**

- Variável: Sempre começa com letra minúscula. (Ex: nomeUsuario, idade);
- Constante: Sempre em MAIÚSCULO. (Ex: PI, LIMITE_CARACTERES).

**Escopo e Atribuição**

- Variável Local: Declarada dentro de um bloco (ex: SE, ENQUANTO, Função), sua utilidade fica restrita àquele bloco.
- Variável Global: Deve ser declarada antes do bloco principal e é acessível em qualquer parte do código.
- Sinal de Atribuição: O símbolo = é usado para atribuição de valor (e.g., X = 10).

**🏷️ Tipagem de Variáveis (Exemplos)**

A tipagem define o tipo de dado que a variável pode armazenar:

- Inteiro (Números sem casas decimais), "INT, SMALLINT, BIGINT", int, idade
- Real (Números com casas decimais), "REAL, FLOAT, DECIMAL", "float, double", salario
- Data/Hora, "DATE, TIMESTAMP, DATETIME","Date, DateTime", dtNasc
- Caractere (Letra ou símbolo único), "CHARACTER, CHAR", char, sexo
- Texto (Cadeia de caracteres), "STRING, TEXT, VARCHAR", string, nomeUsuario
- Booleano (Verdadeiro ou Falso), "BOO, BOOLEAN", bool, estudante



## ⚙️ Operadores

**Operadores Relacionais (Condição)**

Usados para fazer comparações em estruturas de decisão:
```
OPERADOR > SIGNIFICADO

>, Maior que
<, Menor que
>=, Maior ou igual a
<=, Menor ou igual a
==, Igual a
!= ou <>, Diferente de
```


**Operadores Lógicos (Decisão)**

Usados para combinar múltiplas condições (Tabela Verdade):

```
E (AND), V e V = V, Só é Verdadeiro se ambos forem Verdadeiros.
OU (OR), V ou F = V, É Verdadeiro se pelo menos um for Verdadeiro.
NÃO (NOT), NÃO F = V, Inverte o valor lógico.
```


**🔁 Estruturas de Controle**

ENQUANTO (WHILE) - Testa a condição antes de executar o bloco. O bloco só executa se a condição for Verdadeira.
REPITA (DO-WHILE) - Executa o bloco pelo menos uma vez, e só depois testa a condição.
PARA (FOR) - Estrutura aninhada comum para tabuadas ou iteração com contadores definidos.

## 👨‍💼 Procedimentos e Funções (Sub-rotinas)

Ambos são sub-algoritmos (Sub-rotinas) que podem ser chamados pelo algoritmo principal ou por outro sub-algoritmo para realizar tarefas específicas.

**Procedimento (SUB-ALGORITMO):**

- É um programa ou sub-algoritmo que, ao ser chamado, causa um desvio no programa para que os comandos do sub-algoritmo sejam executados.
- Ao finalizar, a execução retorna ao ponto seguinte à chamada do procedimento.
- Estrutura: PROCEDIMENTO NOME (TIPO P1, TIPO P2...) | BLOCO DE COMANDO | FIM.

**Função:**

- São iguais aos procedimentos, mas com a diferença de retornar um valor.
- Estrutura: FUNÇÃO TIPO NOME (TIPO P1, TIPO P2...) | BLOCO DE COMANDO | RETORNO <VALOR> | FIM.

  ## 📊 Estruturas de Dados

**Vetores (Arrays)**

- Conceito: Um conjunto de variáveis que compartilham o mesmo nome, mas cada uma armazena um dado diferente.
- Posições: As posições são representadas por índices associados ao nome do vetor.

```
V = [ 2 | 4 | 3 | 8 | 10 ]
Índice: 0   1   2   3   4
```

**Matrizes (Arrays Multidimensionais)**

- Conceito: Estruturas de dados que precisam de dois índices para localizar um elemento.
- Indices:
  1. O primeiro índice representa as LINHAS.
  2. O segundo índice representa as COLUNAS.

```
M = [ 4  8  4  7 ]
    [ 2  7  3  2 ]
    [ 1  4  1  2 ]
```

**Exemplos de Acesso:**

- M[0][3] = 7 (Linha 0, Coluna 3)
- M[2][0] = 1 (Linha 2, Coluna 0)
