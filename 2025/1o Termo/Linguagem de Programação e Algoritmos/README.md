# Lógica de Programação e Algoritmos 🤖

## Sumário
- [Conceitos e Fundamentos](#conceitos-e-fundamentos)
    - [Lógica de Programação e Algoritmos](#lógica-de-programação-e-algoritmos)
    - [LPA - Termos da Programação e Retomada dos Pseudocódigos](#lpa---termos-da-programação-e-retomada-dos-pseudocódigos-2503)
        - [Variáveis](#variáveis)
        - [Constantes](#constantes)
        - [Escopo de Variável](#escopo-de-variável)
    - [Variáveis Locais e Globais](#variáveis-locais-e-globais)
    - [Regras de Declaração de Variáveis](#regras-de-declaração-de-variáveis)
    - [Sinal de Atribuição](#sinal-de-atribuição)
    - [Pauta - 11/02 (Continuação)](#pauta---1102-continuação)
    - [Fluxograma (Elementos)](#fluxograma-elementos)
    - [Passos para a Solução de Problemas](#passos-para-a-solução-de-problemas)
- [Estruturas de Dados (Vetores e Matrizes)](#estruturas-de-dados-vetores-e-matrizes)
    - [Vetores](#vetores)
    - [Matrizes](#matrizes)
- [Tipagem e Operadores](#tipagem-e-operadores)
    - [Declaração de Variáveis - Tipagem](#declaração-de-variáveis---tipagem)
    - [Operadores](#operadores)
        - [Operadores Matemáticos](#operadores-matemáticos)
        - [Operadores Relacionais](#operadores-relacionais)
        - [Operadores Lógicos](#operadores-lógicos)
    - [Tabela Verdade](#tabela-verdade)
        - [Operador OR](#operador-or)
        - [Operador AND](#operador-and)
- [Estruturas de Controle](#estruturas-de-controle)
    - [Estruturas de Decisão](#estruturas-de-decisão)
    - [Estruturas de Repetição](#estruturas-de-repetição)
        - [Repetições Indefinidas (WHILE)](#repetições-indefinidas-while)
        - [Repetições Previsíveis (FOR)](#repetições-previsíveis-for)
- [Procedimentos e Funções (27/05)](#procedimentos-e-funções-2705)
    - [Procedimento](#procedimento)
    - [Funções](#funções)
- [Exemplos de Algoritmos (Pseudocódigo e Fluxograma)](#exemplos-de-algoritmos-pseudocódigo-e-fluxograma)
    - [Exemplo - Atividades Diárias](#exemplo---atividades-diárias)
    - [Exemplo - Viagem para a Praia (2 horas) - Carro](#exemplo---viagem-para-a-praia-2-horas---carro)
    - [Exemplos de Exercícios - Resoluções](#exemplos-de-exercícios---resoluções)
        - [1. Máximo de Ingressos](#1-máximo-de-ingressos)
        - [2. Média e Aprovação (Nota Mínima = 6)](#2-média-e-aprovação-nota-mínima--6)
        - [3. Múltiplo de 3 e 5](#3-múltiplo-de-3-e-5)
    - [Pseudocódigo Simples (Média de 4 Notas)](#pseudocódigo-simples-média-de-4-notas)
- [Outros Exercícios Propostos](#outros-exercícios-propostos)
    - [Exercício: Jogo da Cobrinha (20x20)](#exercício-jogo-da-cobrinha-20x20)
    - [Exercício: Tabuada](#exercício-tabuada)
    - [Exercícios Adicionais](#exercícios-adicionais)
        - [1. Par ou Ímpar](#1-par-ou-ímpar)
        - [2. Média e Situação (4 números)](#2-média-e-situação-4-números)
        - [3. Expressão Matemática e Resultado Percentual](#3-expressão-matemática-e-resultado-percentual)
- [Fluxograma - Exercício da Pizzaria (18/03)](#fluxograma---exercício-da-pizzaria-1803)
    - [Dados](#dados)
    - [Estrutura do Fluxograma](#estrutura-do-fluxograma)
- [Testes e Análise de Linguagem](#testes-e-análise-de-linguagem)
    - [Teste de Mesa (Exemplo com Palavra/Símbolo)](#teste-de-mesa-exemplo-com-palavrasímbolo)
    - [Pesquisas e Tópicos](#pesquisas-e-tópicos)

## Conceitos e Fundamentos

### **Lógica de Programação e Algoritmos**

* **Lógica de Programação:** Consiste na lógica de produção para se desenvolver um sistema adequado.
* **Conceito de Algoritmo:** A automação. É o processo em que uma tarefa deixa de ser desempenhada pelo homem e passa a ser realizada por máquinas.
* **Especificação de Algoritmo:** A sequência ordenada de passos que deve ser seguida para a realização de uma tarefa, garantindo sua repetibilidade.

### **LPA - Termos da Programação e Retomada dos Pseudocódigos (25/03)**

#### **Variáveis**
* Campo da memória onde são gravadas as informações.
* O dado pode ser alterado.
* **Variável:** Sempre começa com **letra minúscula**.

#### **Constantes**
* Dado **fixo**.
* Não pode ser alterado.
* Sempre todos os caracteres em **MAIÚSCULO**.

#### **Escopo de Variável**
* Ao declarar a variável dentro de uma condição, ela só terá **utilidade dentro do bloco**.
* De declaração de variável em um bloco só é acessível no **bloco de comando**.

### **Variáveis Locais e Globais**

* **Variáveis Locais:** Manipulável somente em um bloco de código específico. Não existe;
* **Variáveis Globais:** Ao ser declarada, pode ser utilizada em qualquer bloco. Usualmente declarada no topo do código. 

### **Regras de Declaração de Variáveis**

* **Nunca** inicia com **Nº** (ex: A9).
* Dependendo da LP, pode começar com **caracteres especiais**.
* **Não** começar com **operadores matemáticos** ($*, /, $ etc.).
* **Pode usar** (Sublinhado) `_`.
* **Pode usar** Letras + **Nº**.
* **Pode usar** Letras + **-** + **Nº**.

### **Sinal de Atribuição**
$$=$$

### **Pauta - 11/02 (Continuação)**

* Linguagem de Programação e Algoritmos
* Tomada de Decisões: Continuação
* Do Fluxograma na Praia
* Operação de Atribuição

### **Fluxograma (Elementos)**

* Início/Fim (OVAL)
* Processamento (RETÂNGULO)
* Operação de Entrada de Dados (PARALELOGRAMO)
* Operação de Saída de Dados (RETÂNGULO COM VÉRTICE INFERIOR ESQUERDO ARREDONDADO)
* Decisão (LOSANGO)
* Operação de Atribuição (SETAS)

### **Passos para a Solução de Problemas**

Sempre leia um enunciado de problema e se pergunte:

1.  O que é **dado**? (**ENTRADA**)
2.  O que é necessário encontrar? (**SAÍDA**)
3.  Quais são as **condições** e **restrições**? (**PROCESSAMENTO**)

## Estruturas de Dados (Vetores e Matrizes)

### **Vetores**

* Conjunto de **variáveis** no qual cada uma pode guardar um dado diferente, mas todas compartilham o **mesmo nome**.
* A esse nome são associados os **índices** que representam as posições do vetor.
* *Exemplo:* $\text{V} = [2, 4, 3, 8, 10]$.

### **Matrizes**

* São **estruturas de dados (arrays)** que precisam de **dois índices** para individualizar um elemento do conjunto.
* O **primeiro índice** representa as **linhas** e o **segundo índice** representa as **colunas**.
* *Exemplo:*
$$\text{M} = \begin{bmatrix} 4 & 8 & 4 & 7 & 6 \\ 2 & 7 & 3 & 2 & 5 \\ 1 & 4 & 1 & 2 & 1 \end{bmatrix}$$
* Acesso: $\text{M}[2][4] = 5$ (Assumindo índice base 1), $\text{M}[3][3] = 1$.

## Tipagem e Operadores

### **Declaração de Variáveis - Tipagem**

| Tipo | Sigla | Nome Completo |
| :--- | :--- | :--- |
| **Inteiro** | INT | INT - SMALLINT - BIGINT |
| **Real** | REAL | FLOAT - DECIMAL |
| **Data** | DATE | TIMESTAMP - DATETIME |
| **Caractere** | CHAR | |
| **Texto** | STRING | STRING - TEXT - VARCHAR |
| **Booleano** | BOO | BOOLEAN |

**Exemplos de Variáveis:**

* **INT** - IDADE
* **DATE** - DTNASC
* **CHAR** - SEXO
* **BOOL** - ESTUDANTE
* **REAL** - SALARIO
* **TIME** - HORANASC
* **VARCHAR(40)** - NOME\_USUARIO

### **Operadores**

#### **Operadores Matemáticos**
$$*, /, +, -, \text{ e } \text{ \%}$$

#### **Operadores Relacionais**
$$>, <, >=, <=, = \text{ e } \neq \text{ (ou } \text{!)}$$

#### **Operadores Lógicos**
$$\text{E}, \text{ OU}, \text{ XOR}, \text{ e } \text{ NÃO}$$

### **Tabela Verdade**

#### Operador OR

| V | V | = V |
| :--- | :--- | :--- |
| V | F | = V |
| F | V | = V |
| F | F | = F |

#### Operador AND

| V | V | = V |
| :--- | :--- | :--- |
| V | F | = F |
| F | V | = F |
| F | F | = F |

## Estruturas de Controle

---

### **Estruturas de Decisão**

* **SE (Condição) → IF**  
  Executa um bloco de comandos apenas se a condição for verdadeira.

* **Bloco de Comandos**  
  Conjunto de instruções executadas quando a condição é satisfeita.

* **SE / SENÃO → IF / ELSE**  
  Executa um bloco se a condição for verdadeira e outro se for falsa.

* **SE / SENÃO SE / SENÃO → IF / ELSE IF / ELSE**  
  Permite testar múltiplas condições em sequência.

**Exemplo:**
```c
if (condicao1) {
    // bloco 1
} else if (condicao2) {
    // bloco 2
} else {
    // bloco padrão
}
```

### **Estruturas de Repetição**

#### **Repetições Indefinidas (WHILE)**

* **ENQUANTO (Loop)**
    * $\text{INÍCIO}$
    * $\text{X} = 1$
    * $\text{ENQUANTO} (\text{LOOP})$
        * $\text{X} = \text{X} + 1$
    * $\text{FIM ENQUANTO}$

    * A diferença do **$\text{WHILE}$** vs **$\text{DO WHILE}$** é que o primeiro testa se a **condição é verdadeira antes de executar o bloco**.

#### **Repetições Previsíveis (FOR)**

$$\text{for (i=0; i<x; i++) \{ print(i) \}}$$

* **P1:** Declara e inicializa o contador.
* **P2:** Condição. É repetida o bloco se for verdadeira.
* **P3:** Feito antes de repetir o bloco (subtrai ou adiciona).

## Procedimentos e Funções (27/05)

### **Procedimento**

* É um programa (subalgoritmo) que, para ser executado, tem que ser chamado pelo **algoritmo principal** que o constitui, ou por outro algoritmo.
* Quando o nome de um procedimento é localizado, acontece um **desvio no programa** para que os comandos do subalgoritmo sejam realizados.
* Quando o procedimento é finalizado, a execução **retornará ao ponto seguinte à chamada do procedimento**.

**Estrutura do Procedimento:**

$$\text{PROCEDIMENTO NOME} (\text{TIPO P1}, \text{ TIPO P2}, \dots)$$
$$[\text{BLOCO DE COMANDO}]$$
$$\text{FIM PROCEDIMENTO}$$

### **Funções**

* As funções são **iguais aos procedimentos** com apenas a diferença de **retornar o valor**.
* O nome representa a **linha** e força **algoritmos**.

**Estrutura da Função:**

$$\text{FUNÇÃO TIPO NOME} (\text{TIPO P1}, \text{ TIPO P2}, \dots)$$
$$[\text{BLOCO DE COMANDOS}]$$
$$\text{RETORNO } <\text{VALOR}>$$
$$\text{FIM FUNÇÃO}$$

## Exemplos de Algoritmos (Pseudocódigo e Fluxograma)

### **Exemplo - Atividades Diárias**

* Faça o algoritmo da sua atividade **após** o almoço de domingo.
    * *Exemplo:* Após o almoço de domingo tomei minha pílula de vitamina D e li algumas páginas do livro 'A Última Apostasia'. Depois, estou lendo no celular. Às 01:00 voltei para casa e me preparei para dormir. Minha janta foi pizza.

* Crie o **próprio projeto** enquanto trabalha dentro de uma empresa.

### **Exemplo - Viagem para a Praia (2 Horas) - Carro**

**Para uma viagem à praia com o carro, é necessário:**

* Ter **acordado**; caso contrário, **ACORDAR**.
* Ter uma **habilitação de motorista**; caso contrário, **PROVIDENCIAR** uma.
* Estar com o **tanque de combustível cheio**; caso contrário, **REABASTECER**.
* Se certificar de **alimentação**, **vestimentas** e **equipamentos**; caso algum valor esteja incompleto, **PROVIDENCIAR** ou **ADIAR** viagem.
* Ter **dinheiro** para o pedágio; senão, **GANHE**.
* Para agilizar a viagem: **REALIZAR** o uso do **GPS** como guia.
* Seguir uma estrada menos movimentada.
* Ter a assinatura no Sem Parar.

**Condições (Versão do Professor)**

* Tenho um carro? (**SIM/NÃO**) - Se **NÃO**, não providenciar.
* Tenho condições/desejos para viajar? (**SIM/NÃO**)
* Está em condições? (**SIM/NÃO**) - Se **NÃO**, enviar para revisão.
* Devidamente abastecido? (**SIM/NÃO**) - Se **NÃO**, providenciar.
* Estão prontas as malas? (**SIM/NÃO**) - Se **NÃO**, providenciar.
* Condições climáticas? Se tempo **bom e mais rápido**, seguir; se tempo **nublado e menor**, seguir.
* Itens de segurança e manutenção? (**S/N**) - Se **NÃO**, providenciar. Se **SIM**, ir para o próximo passo.
* Meios de pagamento/pedágio? (**S/N**) - Se **NÃO**, providenciar. Se **SIM**, ir para o próximo passo.
* Sabe o caminho para a praia? (**SIM/NÃO**) - Se **NÃO**, providenciar **GPS** ou **mapas** e voltar ao passo anterior.
* Chegou na praia? (**SIM/NÃO**) - Se **SIM**, parabéns. Se **NÃO**, continue o trajeto.

### **Exemplos de Exercícios - Resoluções**

#### **1. Máximo de Ingressos**
Um aluno tem **R$ 50,00** e quer comprar o máximo de ingressos para um show que custa **R$ 12,00** cada. Quantos ele comprará e quanto sobrará?

* **DADO:**
    * TOTAL = **50**
    * VALOR INGRESSO = **12**
* **INÍCIO:**
    * TOTAL DINHEIRO = **50**
    * VALOR INGRESSO = **12**
    * QUANTIDADE = TOTAL DINHEIRO / VALOR INGRESSO
    * SOBROU = TOTAL DINHEIRO - (INGRESSO \* QUANTIDADE)
    * ESCREVA A **QUANTIDADE**
    * ESCREVA "**SOBROU R$**" + **SOBROU**
* **FIM**

#### **2. Média e Aprovação (Nota Mínima = 6)**
Planeje a solução para o seguinte: um aluno tem uma nota final de **5**, **7**, e **8**. Calcule a **média final** e verifique se o aluno **passou** (média maior ou igual a 6).

* **DADOS:** 3 Notas (**5**, **7**, **8**). Média Mínima.
* **PROCESSAMENTO:** Calcular a Média.
* **CONDIÇÃO:** MÉDIA >= **6** -> APROVADO, SENÃO -> REPROVADO.
* **INÍCIO:**
    * SOLICITAR A NOTA 1
    * SOLICITAR A NOTA 2
    * SOLICITAR A NOTA 3
    * SOLICITAR A NOTA MÍNIMA (**6**)
    * CALCULAR A MÉDIA: (**NOTA 1** + **NOTA 2** + **NOTA 3**) / **3**
    * SE MÉDIA >= NOTA MÍNIMA
        * ESCREVER "**APROVADO**"
    * SENÃO
        * ESCREVER "**REPROVADO**"
* **FIM**

#### **3. Múltiplo de 3 e 5**
Escreva um algoritmo para verificar se um número dado é **múltiplo de 3 E 5**.

* **DADO:** Número que seja **múltiplo de 3 e 5**.
* **INÍCIO:**
    * INSIRA NÚMERO QUALQUER
    * CALCULE NÚMERO QUALQUER / **3**
    * CALCULE NÚMERO QUALQUER / **5**
    * CASO AMBOS OS RESULTADOS FOREM **VALORES INTEIROS**:
        * ESCREVER "**ESTE NÚMERO É MÚLTIPLO DE 3 E 5**"
    * SENÃO:
        * ESCREVER "**CONDIÇÃO NÃO APROVADA**"
* **FIM**

### **Pseudocódigo Simples (Média de 4 Notas)**

* **PSEUDOCÓDIGO:**
    * INÍCIO
    * LEIA NÚMERO 1
    * LEIA NÚMERO 2
    * LEIA NÚMERO 3
    * LEIA NÚMERO 4
    * MÉDIA = (**N1** + **N2** + **N3** + **N4**) / **4**
    * ESCREVA **MÉDIA**
    * FIM

## Outros Exercícios Propostos

* **Exercício 1 (Média e Resultado):** Que leia 4 notas, tire a média e apresentar o resultado.
* **Exercício 2 (Cálculo de Área):** Que recebe o dado necessário para calcular a **área** de um **quadrado**, **retângulo** e **triângulo**.
* **Exercício 3 (Cálculo Salário):** Que realize o cálculo do **salário líquido** do professor.

### **Exercício: Jogo da Cobrinha (20x20)**

Quadrado **20x20**. A cobra começa em **[1,1]** e termina em **[20, 20]**, passando por toda a área. Ela não aumenta de tamanho.

* **INÍCIO:**
    * X = **1**
    * Y = **1**
    * POSIÇÃO = (**X**, **Y**)
    * ENQUANTO POSIÇÃO < **20**
        * FAÇA ENQUANTO Y < **20**
            * Y = Y + **1**
        * FIM FAÇA
        * X = X + **1**
    * FAÇA ENQUANTO Y > **1**
        * Y = Y - **1**
    * FIM FAÇA
    * ENQUANTO X < **20**
        * X = X + **1**
* **FIM**

### **Exercício: Tabuada**

Imprimir a **tabuada do 1 ao 10** com seus múltiplos de 1 a 10, respectivamente.

* **INÍCIO:**
    * X = **1**
    * FAÇA ENQUANTO X < **11**
        * Y = **1**
        * FAÇA ENQUANTO Y < **11**
            * IMPRIMA (**X** \* **Y**)
            * Y = Y + **1**
        * FIM FAÇA
        * X = X + **1**
    * FIM FAÇA
* **FIM**

### **Exercícios Adicionais**

#### **1. Par ou Ímpar**
Faça um algoritmo que leia um número e escreva se é **par ou ímpar**.

#### **2. Média e Situação (4 números)**
Faça um algoritmo que leia **4 números**, calcule a **média** e se:
* Maior **7,00** = **APROVADO**
* Entre **5,00** e **6,99** = **RECUPERAÇÃO**
* Abaixo de **5,00** = **REPROVADO**

#### **3. Expressão Matemática e Resultado Percentual**
Faça um algoritmo que resolva a seguinte **expressão matemática**:
$$\frac{((A^2 + B^3) + C^4)}{19.0} + 1$$
**Se o resultado:**
* $\le 10$: Expressão **10%**
* $11 - 20$: Expressão **20%**
* $21 - 50$: Expressão **50%**
* $51 - 75$: Expressão **45%**
* $> 76$: **ESTRANHA**

## Fluxograma - Exercício da Pizzaria (18/03)

### **Dados**

* 4 Queijos - **50 A**
* Frango - **45 B**
* Peperoni - **65 C**
* Coca - **5 D**
* **QUANTIDADE**
* **VALOR TOTAL**

### **Estrutura do Fluxograma**

1.  **INÍCIO**
2.  **EXIBIR CARDÁPIO**
3.  **OPÇÃO CLIENTE** (Decisão: Deseja fechar conta? SIM/NÃO)
    * Se **NÃO**, segue para **ESCOLHA CLIENTE**
    * Se **SIM**, segue para **COBRA CLIENTE** -> **FIM**
4.  **ESCOLHA CLIENTE** (Decisão/Escolha: A, B, C, D)
    * **A (4 Queijos):**
        * QT + **1**
        * VT + **50**
    * **B (Frango):**
        * QT + **1**
        * VT + **45**
    * **C (Peperoni):**
        * QT + **1**
        * VT + **65**
    * **D (Coca):**
        * QT + **1**
        * VT + **5**
5.  **EXIBIR TOTAL**
6.  Retorna para a **OPÇÃO CLIENTE** (ponto Z).

## Testes e Análise de Linguagem

### **Teste de Mesa (Exemplo com Palavra/Símbolo)**

* **INÍCIO**
    * X = **1**
    * IMPRIMA **DIGITE A PALAVRA**
    * LEIA **PALAVRA**
    * ENQUANTO X < TOTAL SÍMBOLOS
        * SE SÍMBOLO \[X] = **2**
            * TOTAL DE **2** = TOTAL DE **2** + **1**
        * SE SÍMBOLO \[X] = **3**
            * TOTAL DE **3** = TOTAL DE **3** + **1**
        * SE SÍMBOLO \[X] = **4**
            * TOTAL DE **4** = TOTAL DE **4** + **1**
        * X = X + **1**
    * FIM ENQUANTO
    * SE TOTAL **2** = **1** E TOTAL **3** = **2** E TOTAL **4** = **3**
        * IMPRIMA **PALAVRA CORRETA**
    * SENÃO
        * IMPRIMA **PALAVRA INCORRETA**
* **FIM**

### **Pesquisas e Tópicos**

* Pesquisar <a href="https://pt.wikipedia.org/wiki/Backtracking" target="_blank">Backtracking</a> e <a href="https://pt.wikipedia.org/wiki/Ataque_de_for%C3%A7a_bruta" target="_blank">Força Bruta</a> na Programação e Algoritmos.
* Programação <a href="https://en.wikipedia.org/wiki/Fibonacci_sequence">Fibonacci.</a>
* **Complexidade Algorítmica** <a href="https://pt.wikipedia.org/wiki/Complexidade_computacional" target="_blank">(Wikipedia).</a>
