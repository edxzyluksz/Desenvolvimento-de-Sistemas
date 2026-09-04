# Internet das Coisas (IoT)

## 🔨 Ferramentas

Tinkercad - Site de simulação eletrônica
Wokwi - Outra alternativa de simulação eletrônica
Espressif - Fabricante da linha ESP
Arduinocc - Site do Arduino

> Projetos presentes em Tinkercad e Wokwi

## 💡 Fundamentos Elétricos

### 🥣 Principais Grandezas

**Ampéres (A):** Corrente eléttrica
**Ohms (Ω):** Resistência
**Volts (V):** Tensão
**Watts (W):** Potência elétrica

<img width="20%" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjPjyh4hzeDS6mRDbo4Ukum1uoinqfNkBUKuDJvmfGZTuFzi3J5FlsN2ahmpNvwdJRHibQj-SZ9KaX48nE6NIlSq6U6jNMNmlKzNdSYl90mkt7BHBrCiSkrUbWHG7HqfvTMTmj5_Mx-ADba/s1600/10373651_657546340998471_8642577972045171287_n.png">

## 🧲 Polaridade

<img width="20%" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgZgulibNIcKmd4QnGuRWJ38c_lp95WORsXLQALV69NO2ABiYISs6SzqaYPmxFUs0biuZEqn4K_nO9AMpEp3CSFUvj2PMmIriBoCF26Lx6UZV-V-MvV9EQ1WGUxRoGeeWyK8Buew1wN89Q/s1600/1.jpg">

O átomo de hidrogênio é um íon, pois não possui estabilidade em suas camadas.

Ânion (-) -> Anôdo
Cátion (+) -> Catôdo

Para entender as polaridades de um LED, é necessário lembrar as relações da química.

### ✖️ Múltiplos e Sub-Múltiplos

| Letra | Significado | Base 10 | Valor |
| --- | --- | --- | --- |
| G | Giga | 10^9 | 1.000.000.000 |
| M | Mega | 10^6 | 1.000.000 |
| k | Quilo | 10^3 | 1.000 |
| - | Unidade | 10^0 | 1 |
| m | Mili | 10^-3 | 0,001 |
| μ | Micro | 10^-6 | 0,000001 |
| n | Nano | 10^-9 | 0,000000001 |

## 📄 2ª Lei de Kirchhoff

"A soma de todas as tensões em uma malha (circuito fechado) é igual a zero."

## 🪧 Protoboard (Placa de Ensaio)

Utilizada para testes eletrônicos, esta placa segue coordenadas baseadas em números e letras. As colunas representam uma ligação sequencial.

<img width="20%" src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F1.bp.blogspot.com%2F-xTczv2OrB5w%2FX6cDy7H4KPI%2FAAAAAAAGOO4%2FVmfhaOwDs8wGdJyLiJ5826wt-2Lj5pqcwCLcBGAsYHQ%2Fs1130%2Fprotoboard_01.png&f=1&nofb=1&ipt=ce3290840e9c57720bd71199fae3151585b3a0f24ce73e50aa2b7f58a7f01086">

## 💻 Conversores A.D.C e D.A.C

Existem dois tipos de sinais, com a relação a amplitude (tensão ou corrente), são eles:

1. Tensão ou corrente alternada: Este tipo de sinal inverte o sentido da corrente, ou seja, ora ela está em um sentido, ora no sentido oposto.
2. Tensão ou corrente contínua: Este tipo de sinal a corrente flui em apenas um sentido, não alternando o sentido da corrente

- Os sinais analógicos são sinais que variam a amplitude, mas não o seu sentido (corrente)
- Sinais digitais são sinais, geralmente em tensão que possuem apenas duas tensões ou 0 volts ou um nível máximo único que pode ser de 5V ou outra tensão específica, como por exemplo 3,3V.

<img width="20%" src="https://oficinabrasil.com.br/uploads/images/tecnica/Sinais-eletricos-transportam-informacoes-geradas-pelos-sensores-2.jpg">

> Um sinal alternado é quando ocorre a mudança de direção da corrente, ou seja o sinal varia de positivo para negativo

<img width="20%" src="https://i.ytimg.com/vi/yq5j7REF8Vg/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBz1nUV9a-rHiLQEnudKpmI-zy1vg">

### A.D.C (Analógico para Digital)

- Resolução: É a capacidade de fazer leituras em pedaços de amplitude, quanto mais pedaços melhor a leitura de amplitude (Y - Amplitude)

- Frequência de leitura: É a capacidade de "ler" o sinal no eixo do tempo, para uma leitura fiel, e para que o sinal possa ser reproduzido, com mais fidelidade ao original, devemos observar o Teorema de Nyquist, que diz, que a frequência de conversão deve ser pelo menos 2y maior que o sinal a ser convertido (X - Tempo)

### Exemplo

ADC com amostra de 3 bits = 2^3 = 8 amostras
VRef = 5V
Vmin = 5/8 = 0,625V

## Von Neumann x Harvard

**O que é a Arquitetura de Von Neumann?**

A arquitetura de Von Neumann é o modelo clássico de computação, proposto pelo matemático John Von Neumann em 1945. Este modelo define que os dados e as instruções são armazenados na mesma memória, e o processador os acessa sequencialmente por meio de um único barramento.

*Principais Características:*

Uso de um barramento único para transferir dados e instruções.
Dados e instruções compartilham o mesmo espaço de memória.
Execução sequencial das instruções.
Maior simplicidade no design do sistema.

Desvantagem: O modelo sofre do chamado gargalo de Von Neumann, onde a CPU frequentemente precisa esperar pelo acesso à memória.

**O que é a Arquitetura Harvard?**

A arquitetura Harvard, por outro lado, utiliza memórias separadas para dados e instruções, permitindo que a CPU acesse ambos simultaneamente.

*Principais Características:*

Memórias separadas para dados e instruções.
Dois barramentos independentes: um para dados e outro para instruções.
Maior eficiência na execução de instruções.
Usada amplamente em microcontroladores e sistemas embarcados.

Desvantagem: Maior complexidade no design, o que pode aumentar o custo de implementação.

*Comparando os Modelos:*

| Característica | Von Neumann | Harvard |
| --- | --- | --- |
| Memória | Compartilhada | Separada |
| Barramento | Único | Independente |
| Complexidade | Simples | Alta |
| Desempenho | Impactado pelo gargalo | Alto |
| Uso Típico | Computadores gerais | Microcontroladores |

**Fonte:** [Arquiteturas de Memórias Computacionais](https://tiparafiscos.com.br/arquitetura/von-neumann-harvard.html)

## Shields em Arduino

Os shields são placas que se encaixam ao Arduino para acrescentar funcionalidades de uma forma simples e confiável. A padronização elétrica e mecânica dos shields possibilitou que, de um lado, uma variedade grande de shields fossem oferecidos e, de outro, que placas com microcontroladores diferentes dos usados nos Arduinos originais pudessem suportar a maioria dos shields.

<img width="20%" src="https://www.makerhero.com/wp-content/uploads/2021/01/shield-arduino-3.jpg.webp">

## Aplicação prática - RoboCore Blackboard

### Diferenças entre DHT11 e DHT22

<img width="20%" src="https://i0.wp.com/autocorerobotica.blog.br/wp-content/uploads/2017/08/comparativo-1-300x156.jpg?resize=427%2C222">

### Explicações

Existem 2 tipos de comunicação binária:

- USB (Universal Serial Bus)
- Comunicação Paralela

A principal diferença entre ambos é como a forma que os bits são enviados!

Clock - Sincronismo

## Arquitetura Cliente-Servidor

### Sistema Crítico

Um sistema que pode pô em risco a vida de um ou mais indivíduos se mal executado

### HTTP

Em sistemas críticos, o protocolo HTTP não é a opção ideal, dado sua latência.

Em redes locais, seu tempo de resposta leva de 1 a 3 segundos (localmente), podendo levar mais de acordo com as variáveis.

> Deve atentar-se com o nível de importância dos sistemas em que serão implementados o IoT

### MQTT

## Arquitetura Publisher-Subscriber

TCP/IP MQTT

Características
* Protocolo leve para IoT
* Ideal em redes instáveis
* Comunicação assíncrona (Todos os processos podem acontecer ao mesmo tempo)

Vantagens
* Baixo consumo de dados
* Escalável e flexivel
* Fácil implementação

<img width="20%" src="https://media2.dev.to/dynamic/image/width=1000,height=420,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2F53dn3nemlvy0d8v66gnu.png">

### Camadas de Comunicação

Percepção (Sensores) -> Input

Computação de borda (Rede) -> Protocolos (Wi-fi, ZigBee, LoRa, 5G)
    - O envio através de gateways e roteadores
Responsável por agrupar os dados percebidos

Aplicação (Dashboards, Apps móveis, Sistemas de análise) -> Output (Pós-Envio)

Em sistemas críticos, dificilmente o acionamento remoto é externo ao local no IoT. Nesses casos, somente dashboards, por exemplo, caso não haver uma infraestrura com monitoramento integrado severo para garantir os procedimentos de segurança.

## Node-red

O Node-RED é uma ferramenta de programação visual baseada em fluxo, desenvolvida pela IBM, que permite a criação de aplicações de Internet das Coisas (IoT) de forma intuitiva. Ele utiliza uma interface gráfica onde os usuários podem arrastar e soltar blocos (nós) para criar fluxos de dados entre dispositivos, serviços e APIs.

### Gauge

Gauge é um tipo de nó no Node-RED que permite a visualização de dados em tempo real em forma de medidor ou indicador. Ele é útil para monitorar valores contínuos, como temperatura, pressão, velocidade, entre outros.

#### Dashboard

O Dashboard no Node-RED é uma interface gráfica que permite aos usuários criar painéis de controle interativos para visualizar e controlar dispositivos IoT. Ele oferece uma variedade de widgets, como gráficos, medidores, interruptores e sliders, que podem ser configurados para exibir dados em tempo real e permitir a interação do usuário com os sistemas conectados.