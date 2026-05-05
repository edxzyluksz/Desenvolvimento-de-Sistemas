# Lógica de Programação e Algoritmos

## Conceitos e Fundamentos

### **Lógica de Programação e Algoritmos**

- **Lógica de Programação:** Consiste na lógica de produção para se desenvolver um sistema adequado.
- **Conceito de Algoritmo:** A automação. É o processo em que uma tarefa deixa de ser desempenhada pelo homem e passa a ser realizada por máquinas.
- **Especificação de Algoritmo:** A sequência ordenada de passos que deve ser seguida para a realização de uma tarefa, garantindo sua repetibilidade.

### **LPA - Termos da Programação e Retomada dos Pseudocódigos**

#### **Variáveis**

- Campo da memória onde são gravadas as informações.

- O dado pode ser alterado.
- **Variável:** Sempre começa com **letra minúscula**.

#### **Constantes**

- Dado **fixo**.

- Não pode ser alterado.
- Sempre todos os caracteres em **maiúsculo**.

#### **Escopo de Variável**

- Ao declarar a variável dentro de uma condição, ela só terá **utilidade dentro do bloco**.

- De declaração de variável em um bloco só é acessível no **bloco de comando**.

### **Variáveis Locais e Globais**

- **Variáveis Locais:** Manipulável somente em um bloco de código específico. Não existe;
- **Variáveis Globais:** Ao ser declarada, pode ser utilizada em qualquer bloco. Usualmente declarada no topo do código.

### **Regras de Declaração de Variáveis**

- **Nunca** inicia com **Nº** (ex: A9).
- Dependendo da LP, pode começar com **caracteres especiais**.
- **Não** começar com **operadores matemáticos** ($*, /, $ etc.).
- **Pode usar** (Sublinhado) `_`.
- **Pode usar** Letras + **Nº**.
- **Pode usar** Letras + **-** + **Nº**.

### **Sinal de Atribuição**

$$=$$

### **Pauta - 11/02 (Continuação)**

- Linguagem de Programação e Algoritmos
- Tomada de Decisões: Continuação
- Do Fluxograma na Praia
- Operação de Atribuição

### **Fluxograma (Elementos)**

- Início/Fim (Oval)
- Processamento (Retângulo)
- Operação de Entrada de Dados (Paralelogramo)
- Operação de Saída de Dados (Retângulo com vértice inferior esquerdo arredondado)
- Decisão (Losango)
- Operação de Atribuição (Setas)

### **Passos para a Solução de Problemas**

Sempre leia um enunciado de problema e se pergunte:

1. O que é **dado**? (**Entrada**)
2. O que é necessário encontrar? (**Saída**)
3. Quais são as **condições** e **restrições**? (**Processamento**)

## Estruturas de Dados (Vetores e Matrizes)

### **Vetores**

- Conjunto de **variáveis** no qual cada uma pode guardar um dado diferente, mas todas compartilham o **mesmo nome**.
- A esse nome são associados os **índices** que representam as posições do vetor.
- *Exemplo:* $\text{V} = [2, 4, 3, 8, 10]$.

### **Matrizes**

- São **estruturas de dados (arrays)** que precisam de **dois índices** para individualizar um elemento do conjunto.
- O **primeiro índice** representa as **linhas** e o **segundo índice** representa as **colunas**.
- *Exemplo:*
$$\text{M} = \begin{bmatrix} 4 & 8 & 4 & 7 & 6 \\ 2 & 7 & 3 & 2 & 5 \\ 1 & 4 & 1 & 2 & 1 \end{bmatrix}$$
- Acesso: $\text{M}[2][4] = 5$ (Assumindo índice base 1), $\text{M}[3][3] = 1$.

## Tipagem e Operadores

### **Declaração de Variáveis - Tipagem**

| Tipo | Sigla | Nome Completo |
| :--- | :--- | :--- |
| **Inteiro** | INT | Int - SmallInt - BigInt |
| **Real** | REAL | FLOAT - DECIMAL |
| **Data** | DATE | TIMESTAMP - DATETIME |
| **Caractere** | CHAR | |
| **Texto** | STRING | STRING - TEXT - VARCHAR |
| **Booleano** | BOO | BOOLEAN |

**Exemplos de Variáveis:**

- **Int** - Idade
- **Date** - DtNasc
- **Char** - Sexo
- **Bool** - Estudante
- **Real** - Salario
- **Time** - HoraNasc
- **VarChar(40)** - Nome_Usuario

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

- **SE (Condição) → IF**  
  Executa um bloco de comandos apenas se a condição for verdadeira.

- **Bloco de Comandos**  
  Conjunto de instruções executadas quando a condição é satisfeita.

- **SE / SENÃO → IF / ELSE**  
  Executa um bloco se a condição for verdadeira e outro se for falsa.

- **SE / SENÃO SE / SENÃO → IF / ELSE IF / ELSE**  
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

- **ENQUANTO (Loop)**
  - $\text{INÍCIO}$
  - $\text{X} = 1$
  - $\text{ENQUANTO} (\text{LOOP})$
    - $\text{X} = \text{X} + 1$
  - $\text{FIM ENQUANTO}$

  - A diferença do **While** vs **Do While** é que o primeiro testa se a **condição é verdadeira antes de executar o bloco**.

#### **Repetições Previsíveis (FOR)**

$$\text{for (i=0; i<x; i++) \{ print(i) \}}$$

- **P1:** Declara e inicializa o contador.
- **P2:** Condição. É repetida o bloco se for verdadeira.
- **P3:** Feito antes de repetir o bloco (subtrai ou adiciona).

## Procedimentos e Funções (27/05)

### **Procedimento**

- É um programa (subalgoritmo) que, para ser executado, tem que ser chamado pelo **algoritmo principal** que o constitui, ou por outro algoritmo.
- Quando o nome de um procedimento é localizado, acontece um **desvio no programa** para que os comandos do subalgoritmo sejam realizados.
- Quando o procedimento é finalizado, a execução **retornará ao ponto seguinte à chamada do procedimento**.

**Estrutura do Procedimento:**

$$\text{Procedimento NOME} (\text{Tipo P1}, \text{ Tipo P2}, \dots)$$
$$[\text{Bloco de Comando}]$$
$$\text{Fim Procedimento}$$

### **Funções**

- As funções são **iguais aos procedimentos** com apenas a diferença de **retornar o valor**.
- O nome representa a **linha** e força **algoritmos**.

**Estrutura da Função:**

$$\text{Função Tipo NOME} (\text{Tipo P1}, \text{ Tipo P2}, \dots)$$
$$[\text{Bloco de Comandos}]$$
$$\text{Retorno} <\text{Valor}>$$
$$\text{Fim Função}$$

## Exemplos de Algoritmos (Pseudocódigo e Fluxograma)

### **Exemplo - Atividades Diárias**

- Faça o algoritmo da sua atividade **após** o almoço de domingo.
  - *Exemplo:* Após o almoço de domingo tomei minha pílula de vitamina D e li algumas páginas do livro 'A Última Apostasia'. Depois, estou lendo no celular. Às 01:00 voltei para casa e me preparei para dormir. Minha janta foi pizza.

- Crie o **próprio projeto** enquanto trabalha dentro de uma empresa.

### **Exemplo - Viagem para a Praia (2 Horas) - Carro**

**Para uma viagem à praia com o carro, é necessário:**

- Ter **acordado**; caso contrário, **acordar**.
- Ter uma **habilitação de motorista**; caso contrário, **providenciar** uma.
- Estar com o **tanque de combustível cheio**; caso contrário, **reabastecer**.
- Se certificar de **alimentação**, **vestimentas** e **equipamentos**; caso algum valor esteja incompleto, **providenciar** ou **adiar** viagem.
- Ter **dinheiro** para o pedágio; senão, **ganhe**.
- Para agilizar a viagem: **realizar** o uso do **GPS** como guia.
- Seguir uma estrada menos movimentada.
- Ter a assinatura no Sem Parar.

#### Condições (Versão do Professor)

- Tenho um carro? (**Sim/Não**) - Se **Não**, não providenciar.
- Tenho condições/desejos para viajar? (**Sim/Não**)
- Está em condições? (**Sim/Não**) - Se **Não**, enviar para revisão.
- Devidamente abastecido? (**Sim/Não**) - Se **Não**, providenciar.
- Estão prontas as malas? (**Sim/Não**) - Se **Não**, providenciar.
- Condições climáticas? Se tempo **bom e mais rápido**, seguir; se tempo **nublado e menor**, seguir.
- Itens de segurança e manutenção? (**S/N**) - Se **Não**, providenciar. Se **Sim**, ir para o próximo passo.
- Meios de pagamento/pedágio? (**S/N**) - Se **Não**, providenciar. Se **Sim**, ir para o próximo passo.
- Sabe o caminho para a praia? (**Sim/Não**) - Se **Não**, providenciar **GPS** ou **mapas** e voltar ao passo anterior.
- Chegou na praia? (**Sim/Não**) - Se **Sim**, parabéns. Se **Não**, continue o trajeto.

### **Exemplos de Exercícios - Resoluções**

#### **1. Máximo de Ingressos**

Um aluno tem **R$ 50,00** e quer comprar o máximo de ingressos para um show que custa **R$ 12,00** cada. Quantos ele comprará e quanto sobrará?

- **Dado:**
  - Total = **50**
  - Valor Ingresso = **12**
- **Início:**
  - Total Dinheiro = **50**
  - Valor Ingresso = **12**
  - Quantidade = Total Dinheiro / Valor Ingresso
  - Sobrou = Total Dinheiro - (Ingresso \* Quantidade)
  - Escreva a **Quantidade**
  - Escreva "**Sobrou R$**" + **Sobrou**
- **Fim**

#### **2. Média e Aprovação (Nota Mínima = 6)**

Planeje a solução para o seguinte: um aluno tem uma nota final de **5**, **7**, e **8**. Calcule a **média final** e verifique se o aluno **passou** (média maior ou igual a 6).

- **Dados:** 3 Notas (**5**, **7**, **8**). Média Mínima.
- **Processamento:** Calcular a Média.
- **Condição:** Média >= **6** -> Aprovado, Senão -> Reprovado.
- **Início:**
  - Solicitar a Nota 1
  - Solicitar a Nota 2
  - Solicitar a Nota 3
  - Solicitar a Nota Mínima (**6**)
  - Calcular a Média: (**Nota 1** + **Nota 2** + **Nota 3**) / **3**
  - Se Média >= Nota Mínima
    - Escrever "**Aprovado**"
  - Senão
    - Escrever "**Reprovado**"
- **Fim**

#### **3. Múltiplo de 3 e 5**

Escreva um algoritmo para verificar se um número dado é **múltiplo de 3 E 5**.

- **Dado:** Número que seja **múltiplo de 3 e 5**.
- **Início:**
  - Insira Número Qualquer
  - Calcule Número Qualquer / **3**
  - Calcule Número Qualquer / **5**
  - Caso Ambos os Resultados Forem **Valores Inteiros**:
    - Escrever "**Este número é múltiplo de 3 e 5**"
  - Senão:
    - Escrever "**Condição não aprovada**"
- **Fim**

### **Pseudocódigo Simples (Média de 4 Notas)**

- **Pseudocódigo:**
  - Início
  - Leia Número 1
  - Leia Número 2
  - Leia Número 3
  - Leia Número 4
  - Média = (**N1** + **N2** + **N3** + **N4**) / **4**
  - Escreva **Média**
  - Fim

## Outros Exercícios Propostos

- **Exercício 1 (Média e Resultado):** Que leia 4 notas, tire a média e apresentar o resultado.
- **Exercício 2 (Cálculo de Área):** Que recebe o dado necessário para calcular a **área** de um **quadrado**, **retângulo** e **triângulo**.
- **Exercício 3 (Cálculo Salário):** Que realize o cálculo do **salário líquido** do professor.

### **Exercício: Jogo da Cobrinha (20x20)**

Quadrado **20x20**. A cobra começa em **[1,1]** e termina em **[20, 20]**, passando por toda a área. Ela não aumenta de tamanho.

- **Início:**
  - X = **1**
  - Y = **1**
  - Posição = (**X**, **Y**)
  - Enquanto Posição < **20**
    - Faça Enquanto Y < **20**
      - Y = Y + **1**
    - Fim Faça
    - X = X + **1**
  - Faça Enquanto Y > **1**
    - Y = Y - **1**
  - Fim Faça
  - Enquanto X < **20**
    - X = X + **1**
- **Fim**

### **Exercício: Tabuada**

Imprimir a **tabuada do 1 ao 10** com seus múltiplos de 1 a 10, respectivamente.

- **Início:**
  - X = **1**
  - Faça Enquanto X < **11**
    - Y = **1**
    - Faça Enquanto Y < **11**
      - Imprima (**X** \* **Y**)
      - Y = Y + **1**
    - Fim Faça
    - X = X + **1**
  - Fim Faça
- **Fim**

### **Exercícios Adicionais**

#### **1. Par ou Ímpar**

Faça um algoritmo que leia um número e escreva se é **par ou ímpar**.

#### **2. Média e Situação (4 números)**

Faça um algoritmo que leia **4 números**, calcule a **média** e se:

- Maior **7,00** = **Aprovado**
- Entre **5,00** e **6,99** = **Recuperação**
- Abaixo de **5,00** = **Reprovado**

#### **3. Expressão Matemática e Resultado Percentual**

Faça um algoritmo que resolva a seguinte **expressão matemática**:
$$\frac{((A^2 + B^3) + C^4)}{19.0} + 1$$
**Se o resultado:**

- $\le 10$: Expressão **10%**
- $11 - 20$: Expressão **20%**
- $21 - 50$: Expressão **50%**
- $51 - 75$: Expressão **45%**
- $> 76$: **Estranha**

## Fluxograma - Exercício da Pizzaria (18/03)

### **Dados**

- 4 Queijos - **50 A**
- Frango - **45 B**
- Peperoni - **65 C**
- Coca - **5 D**
- **Quantidade**
- **Valor Total**

### **Estrutura do Fluxograma**

1. **Início**
2. **Exibir Cardápio**
3. **Opção Cliente** (Decisão: Deseja fechar conta? Sim/Não)
    - Se **Não**, segue para **Escolha Cliente**
    - Se **Sim**, segue para **Cobra Cliente** -> **Fim**
4. **Escolha Cliente** (Decisão/Escolha: A, B, C, D)
    - **A (4 Queijos):**
        - Qt + **1**
        - Vt + **50**
    - **B (Frango):**
        - Qt + **1**
        - Vt + **45**
    - **C (Peperoni):**
        - Qt + **1**
        - Vt + **65**
    - **D (Coca):**
        - Qt + **1**
        - Vt + **5**
5. **Exibir Total**
6. Retorna para a **Opção Cliente** (ponto Z).

## Testes e Análise de Linguagem

### **Teste de Mesa (Exemplo com Palavra/Símbolo)**

- **Início**
  - X = **1**
  - Imprima **Digite a Palavra**
  - Leia **Palavra**
  - Enquanto X < Total Símbolos
    - Se Símbolo \[X] = **2**
      - Total de **2** = Total de **2** + **1**
    - Se Símbolo \[X] = **3**
      - Total de **3** = Total de **3** + **1**
    - Se Símbolo \[X] = **4**
      - Total de **4** = Total de **4** + **1**
    - X = X + **1**
  - Fim Enquanto
  - Se Total **2** = **1** E Total **3** = **2** E Total **4** = **3**
    - Imprima **Palavra Correta**
  - Senão
    - Imprima **Palavra Incorreta**
- **Fim**

### **Pesquisas e Tópicos**

- Pesquisar [Backtracking](https://pt.wikipedia.org/wiki/Backtracking) e [Força Bruta](https://pt.wikipedia.org/wiki/Ataque_de_for%C3%A7a_bruta) na Programação e Algoritmos.
- Programação [Fibonacci](https://en.wikipedia.org/wiki/Fibonacci_sequence).
- **Complexidade Algorítmica** [Wikipedia](https://pt.wikipedia.org/wiki/Complexidade_computacional).
