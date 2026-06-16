# EcoTrack – Controle de Hábitos Sustentáveis

## 1. Introdução

### 1.1 Propósito

Este documento descreve os requisitos e a estrutura do aplicativo EcoTrack, um protótipo funcional desenvolvido em Flutter. O objetivo principal é capacitar usuários a monitorar e melhorar seus hábitos sustentáveis diários, visualizando o impacto positivo gerado ao meio ambiente.

### 1.2 Escopo

O sistema abrange o registro de ações ecológicas, gerenciamento de estado global para acompanhamento de metas, visualização de indicadores em um dashboard e personalização de preferências do usuário.

O sistema será uma aplicação mobile para Android, utilizando:

- Flutter
- Dart
- Arquitetura MVC
- Provider

## 2. Descrição Geral

### 2.1 Perspectiva do Produto

O EcoTrack surge de uma demanda de uma startup de tecnologia ambiental. O foco é a responsividade e a experiência do usuário (UX), garantindo que a interface seja intuitiva tanto em dispositivos móveis quanto em diferentes resoluções.

### 2.2 Funções do Software

- Gerenciamento de Hábitos: Listagem, conclusão e histórico de ações sustentáveis.
- Monitoramento de Impacto: Dashboard visual com indicadores de desempenho e pontuação.
- Personalização: Ajuste de temas (Dark Mode) e dados de perfil.
- Navegação Estruturada: Acesso rápido via menu lateral (Drawer) e barra inferior (BottomNavigationBar).

## 3. Requisitos do Sistema (ISO 29148)

### 3.1 Requisitos Funcionais (RF)

| ID | Requisito | Descrição |
| --- | --- | --- |
| RF01 | Acesso Inicial | O app deve apresentar uma tela de boas-vindas com a proposta de valor e botão de acesso. |
| RF02 | Lista de Hábitos | "Exibir hábitos pendentes (economia de água, reciclagem, etc.) em formato de lista." |
| RF03 | Conclusão de Ações | "Permitir que o usuário marque um hábito como concluído, movendo-o automaticamente de categoria." |
| RF04 | Dashboard | "Apresentar cards com total de hábitos, pontuação verde e progresso da meta semanal." |
| RF05 | Configurações | Permitir alternância entre tema claro e escuro. |

### 3.2 Requisitos Não Funcionais (RNF)

| ID | Requisito | Descrição |
| --- | --- | --- |
| RNF01 | Gerenciamento de Estado | Uso obrigatório do pacote Provider para sincronização de dados entre telas. |
| RNF02 | Usabilidade | Utilização de Widgets de estrutura padrão (Scaffold, AppBar, TabBar). |
| RNF03 | Arquitetura | Código organizado em pastas (models, providers, screens, widgets). |

## 4. Protótipos de Interface

O aplicativo é composto por quatro módulos principais:

- Tela 1: Página inicial, com os botões que redirecionam para "Meus Hábitos" ou "Meu Dashboard". Após pressionados, não é permitido voltar para esta tela.
- Tela 2: "Meus Hábitos", com dois Containers principais (Pendentes/Concluídos), que possuem uma lista de cards com somente título em exibição do hábito.
- Tela 3: Dashboard com GridView exibindo:
  - Hábitos (%)
  - Pontuação Verde (100.00)
  - Meta Semanal (n + hábito(s))
  - Meu nível (n)
  - Impacto (-n% CO2)
- Tela 4: Aba de configurações simples, com um único slider que permite a troca do tema do body para #8C8C8C

A paleta de cores será:

- AppBar: #69D463
- Body: #F3F3F3
- BnBar: #3A8136

Informações adicionais:

- O AppBar deverá conter somente a logo do EcoTrack
- o BottomNavigationBar deverá contemplar

[Link Figma](https://www.figma.com/design/nPgpdeXOR8IWWQe2veQCWr/EcoTrack?node-id=0-1&t=WwVM8ZPPgNvOtkl6-1)

## 5. Organização do Projeto

A estrutura de arquivos segue o padrão recomendado para escalabilidade:

``` plaintext
lib/
├── main.dart             # Ponto de entrada da aplicação e configuração do Provider
├── models/               # Classes de dados (ex: Habit, User)
├── providers/            # Lógica de estado (ex: HabitProvider, ThemeProvider)
├── views/                # Telas principais da aplicação
└── utils/                # Constantes e estilos de cores/temas
```

## 6. Implementação do Provider

- `habitList`: Lista dinâmica de hábitos.
- `toggleHabitStatus()`: Método para mover itens entre pendentes/concluídos.
- `calculateImpact()`: Lógica para atualizar o Dashboard em tempo real.
- `currentTab`: Controle do index da BottomNavigationBar.

## 7. Critérios de Entrega

O ChangeNotifierProvider é utilizado para:

- [ ] Código fonte funcional e comentado.
- [ ] Documentação técnica conforme padrão ISO 29148.
- [ ] Protótipos de média fidelidade anexados.

**Desenvolvido por:** EdxzyLuksz
**Disciplina:** Programação para Dispositivos Móveis
**Data:** 2026-04-28
