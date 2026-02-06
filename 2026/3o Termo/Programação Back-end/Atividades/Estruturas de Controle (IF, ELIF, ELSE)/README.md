# Atividade: Estruturas de Controle - IF, ELIF, ELSE

## DIOGO TAKAMORI BARBOSA

Assista e Entenda: O Mapa das Decisões
ver a lógica "acontecendo" é fundamental. Recomendo estes vídeos que explicam de forma bem visual:

Explicação Direta e Visual: Python If Else: Estrutura de Condição - Este vídeo usa cores e exemplos claros para mostrar como o computador "pensa".
    https://www.youtube.com/watch?v=y03PKvxdnPc
Tutorial Passo a Passo: Como Usar IF em Python - Comece AQUI - Ideal para ver a digitação do código em tempo real.
    https://www.youtube.com/watch?v=w6M7eWFWZcc

### Explicação Reforçada: A Regra dos Três Amigos
Para não esquecer mais, vamos dar uma "personalidade" para cada comando:

- IF (O "Se..."): É o primeiro a perguntar. "Se o sinal estiver verde, eu passo".
- ELIF (O "E se não for esse, então..."): É o plano B, C ou D. Ele só fala se o IF estiver errado. "Se não estiver verde, mas estiver amarelo, eu vou devagar".
- ELSE (O "Caso contrário"): É o último recurso. Ele não pergunta nada, ele apenas aceita o que sobrou. "Se não for nem verde nem amarelo, eu paro (porque só pode ser vermelho)".

### Sequência de Exercícios: 

**Exercício 1: A Jornada do Código**

Peça para os alunos realizarem estas atividades no VS Code, um de cada vez.
Exercício 1: O Verificador de Humor (Foco em IF e ELSE)
O robô quer saber como você está. Se você digitar "feliz", ele comemora. Se digitar qualquer outra coisa, ele te dá um abraço.
Objetivo: Praticar a estrutura básica de duas opções.

``` python
humor = input("Como voce está hoje? ")
if humor == "feliz":
    print("Que bom! Continue assim! 😊")
else:
    print("Tudo bem, amanhã será um dia melhor! 🤗")
```

**Exercício 2: O Termômetro Mágico**
- Agora o robô vai decidir o que vestir baseado na temperatura.
- Regra: * Mais de 30 graus: "Use regata".
- Entre 15 e 30 graus: "Use camiseta".
- Menos de 15 graus: "Use casaco".
- Objetivo: Usar o elif para criar uma opção do meio.

**Exercício 3: O Quiz de Super-Herói (Decisões Múltiplas)**
- Crie um programa que pergunta qual o seu poder favorito:
- Voar
- Força
- Invisibilidade
Dica: Use um elif para cada poder e um else para caso a pessoa digite algo que não existe.

**Como demonstrar e ajudar na execução:**

- A Técnica do Fluxograma Físico: Antes de irem para o VS Code, use o caderno. e Desenhe em Fluxograma as Tomadas de Decisão para exemplificar seus códigos:  
- Cores no Editor: No VS Code, mostre que o if, elif e else mudam de cor. Diga para eles: "Se a palavra não mudou de cor, você pode ter digitado errado!".
- O Erro é um Aviso: Quando aparecer a linha vermelha de erro, chame de "O Robô pedindo ajuda". Ajude o aluno a ler o erro. Geralmente é falta de dois pontos : ou o espaço (indentação) no começo da linha.

Checklist de Entrega para o Aluno:
- [ ] Meu código tem um if.
- [ ] Usei : (dois pontos) depois das condições.
- [ ] O que o robô faz está "empurrado para a direita" (TAB/Espaço).
- [ ] O robô respondeu o que eu esperava no terminal.

Entrega:
- Entregar em um Arquivo ZIP os Códigos escritos para essa atividade
- Entregar as Imagens dos Fluxogramas das Atividades