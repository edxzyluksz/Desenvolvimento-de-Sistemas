# 🥊 Granularidade de Brawlers

## 📄Descrição
Este projeto tem como objetivo fornecer uma API que retorna a granularidade de cada brawler no jogo Brawl Stars. A granularidade é uma medida que indica a quantidade de detalhes ou informações disponíveis sobre um brawler específico.

## 📖 Contextualização

Brawl Stars é um jogo de ação multiplayer desenvolvido pela Supercell. Cada brawler possui características únicas, habilidades e estatísticas que os tornam distintos uns dos outros. A granularidade de um brawler pode ser útil para jogadores que desejam entender melhor as nuances de cada personagem e tomar decisões informadas sobre quais brawlers usar em diferentes situações.

## 🔑 Tipos de Brawlers (Chaves) Utilizadas

- "Algoz" - Brawlers que se destacam em causar dano rápido e eliminar inimigos rapidamente.
- "Destruidor" - Brawlers que possuem habilidades de destruição em massa, causando dano em área.
- "Tanque" - Brawlers que têm alta resistência e podem absorver muito dano, protegendo seus aliados.
- "Suporte" - Brawlers que possuem habilidades de cura, escudo ou outras formas de suporte para a equipe.
- "Sniper" - Brawlers que se destacam em causar dano a longo alcance com alta precisão.
- "Controlador" - Brawlers que possuem habilidades para controlar o campo de batalha, como congelar inimigos ou controlar seus movimentos.

## 🔥 Elementos das classes

- Nome
- Raridade
- Vida
- Ataque
- Descrição
- Poder Estelar
- Descrição do Poder Estelar
- Estilo

Exemplo de um brawler:

```json
{
  "nome": "Pam",
  "raridade": "Épico",
  "vida": 4800,
  "ataque": "Sucata",
  "descricao": "Dispara vários projéteis espalhados.",
  "poder_estelar": "Mãe de Todos",
  "descricao_poder_estelar": "Cria um campo de cura que regenera a vida dos aliados dentro dele.",
  "estilo": "Suporte"
}
```

## 🛠️ Tecnologias usadas

[![Tecnologias Utilizadas](https://skillicons.dev/icons?i=npm,nodejs,js&perline=13)](#)

## 💻 CRUD

Para manipular os dados contidos no arquivo `brawlers.json`, utilizamos as seguintes operações CRUD:

- Create (Criar): Adicionar um novo brawler ao arquivo JSON.
- Read (Ler): Ler os dados dos brawlers existentes no arquivo JSON.
- Update (Atualizar): Modificar as informações de um brawler existente no arquivo JSON.
- Delete (Excluir): Remover um brawler do arquivo JSON.

## ⚙️ Funções do código

### 📋 `menu()`
Exibe o menu principal no terminal com as opções disponíveis para o usuário:
- Adicionar
- Atualizar
- Listar
- Excluir
- Sair

---

### 🤷 `chooseClass()`
Responsável por permitir que o usuário escolha uma das classes de brawlers.

📌 **Retorna:**
- Uma string com o nome da classe (`algoz`, `tanque`, etc.)
- `false` caso a opção seja inválida

---

### 🏠 `main()`
Função principal que controla o fluxo da aplicação.

- Exibe o menu
- Captura a opção do usuário
- Chama a função correspondente
- Mantém o programa rodando até o usuário sair

---

### 🤓 `readData()`
Lê o arquivo `brawlers.json`.

📌 **Comportamento:**
- Se o arquivo existir → retorna os dados convertidos de JSON
- Se não existir → cria uma estrutura padrão com todas as classes

---

### 📝 `writeData(dados)`
Salva os dados no arquivo `brawlers.json`.

📌 **Observação:**
- Os dados são formatados com indentação para melhor leitura (`JSON.stringify(..., null, 4)`)

---

### ➕ `addBrawler()`
Responsável por adicionar um novo brawler.

📌 **Fluxo:**
1. Usuário escolhe a classe  
2. Insere os dados do brawler  
3. Validação da vida (deve ser número)  
4. Salva no JSON  

---

### 🗓️ `updtBrawler()`
Atualiza um brawler existente.

📌 **Fluxo:**
1. Escolha da classe  
2. Seleção do ID  
3. Validação do ID  
4. Entrada de novos dados  
5. Atualização do registro  

---

### 🧺 `getBrawlers()`
Lista todos os brawlers de uma classe específica.

📌 **Exibe:**
- ID  
- Nome  
- Raridade  
- Vida  
- Ataque  
- Descrição  
- Poder Estelar  
- Estilo  

---

### 🗑️ `delBrawlers()`
Remove um brawler do sistema.

📌 **Fluxo:**
1. Escolha da classe  
2. Seleção do ID  
3. Validação do ID  
4. Remoção com `splice()`  

---

## ❓ Como executar o projeto

### 1. Clone o repositório
```bash
git clone https://github.com/edxzyluksz/JSON-Crud.git JSON_Crud
cd JSON_Crud
```

### 2. Instale as dependências

```bash
npm install prompt-sync
```

### 3. Execute o programa
```bash
node crud.js
```

## 🌲 Estrutura do projeto

```
📁 projeto
 ├── crud.js
 ├── brawlers.json
 └── README.md
```
