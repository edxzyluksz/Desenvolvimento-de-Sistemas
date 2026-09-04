# Projeto de Software 2

## Introdução

O projeto de software é uma disciplina que tem como objetivo ensinar os alunos a desenvolverem um projeto de software completo, desde a concepção até a entrega final. O curso aborda as principais etapas do desenvolvimento de software, incluindo levantamento de requisitos, design, implementação, testes e manutenção.

> O curso de Desenvolvimento de Sistemas não possui Trabalho de Conclsão de Curso (TCC) por não seguir os princípios das metodologias ágeis.

Não adianta ser o melhor programador do mundo. Se você não entendeu a necessidade do stakeholder, você entregará um produto incorreto para ele.
A base principal do nosso curso é fazer levantamento de requisitos

Os pilares:

- Levantamento de Requisitos;
- Desenvolvimento;
- Testes.

### Requisitos

#### O que é requisito

Uma necessidade ou condição que um software deve atender para resolver um problema do stakeholder
Geralmente, o analista de requisitos é o Product Owner

#### Documentação de Requisito

##### Como Registrar

| Campo | Conteúdo | Exemplo |
| --- | --- | --- |
| ID | Código Único | RF-001 |
| Nome | Verbo no Infinitivo + Objetivo | Cadastro de Usuários |
| Descrição | O ... Deve ser capaz de ... | O Cliente deve ser capaz de realizar seu Cadastro na Plataforma |
| Prioridade | Importância para o negócio | Alta (Precisa Ter) |
| Regras Vinculadas | Referência à a RNF | RNF - Banco de Dados |

Processo simplificado:

> Product Owner ⟷ Stakeholder ⟷ Dev

O product owner precisa ser uma pessoa dinâmica, um tradutor que media o meio técnico (de produção) e o meio de interesse (demanda)

> Conhecimento técnico e habilidades socioemocionais mutuamente.

### Product Owner

Seu papel é intermediar a comunicação entre stakeholders e a equipe de desenvolvimento, gerenciando o backlog do produto

### Metodologias Tradicionais

São longas, desenvolvimento em cascata (WaterFall), com maior foco no planejamento que na execução (modelo sequencial linear)
Ou seja, essa sequência de eventos resulta em somente uma entrega final, com um projeto concluído e com riscos elevados de não atender as necessidades constantes dos clientes, visto que o contato ocorre somente no início

- Foco no projeto
- Uma etapa após a outra

### Metodologias Ágeis

Conjunto de comportamentos, processos e feramentas utilizados para criar e disponibilizar produtos ou serviços com entregas incrementais. Ou seja, desenvolver uma versão inicial, apresentá-la e evoluir o produto ou serviço ao longo do tempo, de aordo com o feedback do usuário.

As etapas de desenvolvimento são mais curtas, e o foco é a presença do usuário nesse processo.

- Comunicação mais rápida;
- Identificação e correção de erros menos custosos;
- Projeto mais flexível e colaborativo.

#### Os quatro princípios das metodologias ágeis

Indivíduos e interações mais processos e ferramentas
Software em funcionamento mais que documentação abrangente
Colaboração com o cliente mais que negociação de contratos
Responder as mudanças mais que seguir um plano

#### Atividade: Desenvolver um jogo de Pong simples (Scratch)

**Requisitos Funcionais:**

- O jogo inicialmente deverá possuir:
  - Uma bola que quica sobre a tela;
  - Uma raquete que se movimenta horizontalmente;
  - Colisão entre os dois objetos.

Após entregue a primeira versão: - Caso a bola colidir com o chão, o jogo acaba; - Aumentar a velocidade da bola a cada defesa.

**Requisitos Não-Funcionais:**

- Após o jogador defender a bola 10 vezes, o fundo de tela muda;
- Se o jogo acaba com a colisão da bola no chão, exibe "Game Over" na tela.

## Levantamento de Requisitos em PSOFT

### Dinâmica de jogo - Divisão da sala

**Analisar textos e definí-los como Regra de Negócio, Requisito ou Restrição.**

### Divisão de grupos - Cliente com Contratados

Grupos de clientes devem propor uma ideia gerada pelo professor e exibir de maneira precária as necessidades do software e suas vontades. Este processo de grupos revezavam, sendo ora cliente e ora contratado.

## Técnicas de Levantamento de Requisto

- Briefing:
  - Coleta de Dados Inicial do Projeto
  - Não Existe um Formato Único:
    - Relatório
    - Reunião
    - Telefonema,
    - Email

- BrainStorm
  - Reunião Rápida entre uma Equipe Multidisciplinar com Objetivo de Resolver um ou mais Problemas
  - Pode acontecer de Forma Estruturada ou Não

- Questionário
  - Perguntas Direcionadas com Objetivo de Obter Informações Relevantes para Montagem do Escopo do Projeto

- Entrevistas
  - Coleta de Dados com os StakeHoldes (Pessoas Interessadas no Projeto)

- Etnografia
  - Ato de Observar o Dia-a-Dia dos Envolvidos no Projeto (CLientes e Usuários)
  - Entender a Cultura de Empresa

- Workshop
  - Apresentação do Projeto em Feiras, Eventos e Workshops com Inturio de Apresentar informações sobre o Produto desenvolvido
  - necessário de um MVP para apresentação

- Prototipagem
  - Criação de um Protótipo do Produto para Apresentação e Feedback dos StakeHoldes
  - Pode ser um Protótipo de Baixa Fidelidade (Desenho) ou Alta Fidelidade (Funcional)
