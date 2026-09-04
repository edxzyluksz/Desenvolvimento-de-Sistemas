# 📦 Sistema de Gerenciamento de Almoxarifado (SG Almoxarifado)

Sistema completo de controle de estoque e inventário desenvolvido com **React (Hooks)** e **json-server** como mock de API REST.

---

## 🚀 Como Executar o Projeto

### 1. Instalar as Dependências

Na raiz do projeto (`sg-almoxarifado`), execute:
```bash
npm install
npm --prefix frontend install
```

---

### 2. Iniciar os Serviços

Você pode iniciar tudo junto ou em terminais separados:

#### Opção A: Iniciar Tudo de Uma Vez (Recomendado)
```bash
npm run dev
```
> Isso iniciará o `json-server` na porta `3001` e o Front-end `Vite/React` na porta `5173` simultaneamente via `concurrently`.

---

#### Opção B: Terminais Separados

**Terminal 1 — Back-end Mock (`json-server`):**
```bash
npm run dev:server
# Ou: npx json-server --watch backend/db.json --port 3001
```

**Terminal 2 — Front-end (`React/Vite`):**
```bash
npm run dev:client
# Ou: cd frontend && npm run dev
```

---

## 🏛️ Estrutura do Projeto

```text
sg-almoxarifado/
├── backend/
│   └── db.json                    # Base de dados simulada (usuarios, produtos, movimentacoes)
├── frontend/                      # Aplicação React SPA
│   ├── src/
│   │   ├── components/
│   │   │   ├── Navbar.jsx                  # Cabeçalho com abas e indicador de status
│   │   │   ├── DashboardStats.jsx          # Cards de indicadores e estatísticas rápidas
│   │   │   ├── FormularioMovimentacao.jsx  # Registro de Entrada/Saída com regras de negócio
│   │   │   ├── ListaProdutos.jsx           # Tabela de inventário com busca e alertas
│   │   │   ├── HistoricoMovimentacoes.jsx  # Auditoria completa de movimentações
│   │   │   └── ModalNovoProduto.jsx        # Modal para cadastrar novos produtos
│   │   ├── services/
│   │   │   └── api.js                      # Camada de comunicação com a API REST
│   │   ├── App.jsx                         # Orquestrador de estado e layout
│   │   ├── index.css                       # Design System, variáveis CSS e responsividade
│   │   └── main.jsx                        # Ponto de entrada do React
│   ├── index.html
│   ├── package.json
│   └── vite.config.js
├── package.json                            # Scripts unificados na raiz
└── README.md
```

---

## 💡 Regras de Negócio Implementadas

1. **Entrada de Estoque**:
   - `POST /movimentacoes` registrando autor, produto, tipo `entrada` e quantidade.
   - `PATCH /produtos/:id` somando a quantidade movimentada ao saldo atual.

2. **Saída de Estoque**:
   - Validação de saldo: Se a quantidade solicitada for **maior que o estoque disponível**, a ação é **bloqueada** no Front-end e exibe um alerta explicativo.
   - `POST /movimentacoes` com tipo `saida`.
   - `PATCH /produtos/:id` subtraindo a quantidade movimentada do saldo.
