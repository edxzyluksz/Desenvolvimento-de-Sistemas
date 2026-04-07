# 📚 Linguagens de Marcação

## 🌐 Introdução às Linguagens de Marcação e Estrutura Web

### Linguagens de Marcação

Sistemas para anotar um documento (texto) com **tags** para definir a **estrutura**, **layout** e **significado** do conteúdo.

* **Características:**
  * Uso de **tags**.
  * Estrutura **hierárquica**.
  * Separar **conteúdo**.
  * **Legibilidade**.

* **Tipos de Linguagem:**
  * **HTML (HyperText Markup Language):** Espinha dorsal do WWW.
    * Usa **tags pré-definidas**.
    * Suporta **Hyperlinks**.
    * Define a **estrutura e conteúdo** das páginas.
  * **XML (eXtensible Markup Language):**
    * **Armazenamento e transporte de dados**.
    * É **Case Sensitive**.
    * Tags dos **próprios usuários**.
    * **Aviso: Tag não é comando!**
  * **JSON (JavaScript Object Notation):**
    * **Evolução do XML**.
    * **Padrão das trocas de informação por API**.
    * **Leve e fácil de ler**.
  * **Outras Linguagens:**
    * **Markdown**.
    * **SVG**.
    * **YAML**.

### Estrutura da Web

* **Internet:** **Meio físico**.
* **WWW (World Wide Web):** Um dos **serviços da Internet**.

## 💻 Registro, Domínio e Hospedagem

### Registro

Processo formal de **reservar um nome único** para uso exclusivo.

* **Registro de Domínios:**
  * Verificar se o nome **não é usado**.
  * Usar **servidores DNS**.
  * Renovar os registros.
  * **Registradores:** **Registro.br**, **GoDaddy**, **HostGator**, **NameCheap**, etc.
  * Estudar o processo de **adquirir o domínio e registro de um site**.

### Domínio

O **nome amigável** feito para ser **memorizado facilmente**.

* **Domínio $\ne$ Hospedagem**.
* **Domínio de Primeiro Nível (TLD):** A **extensão** do nome (.com, .org, .br, etc.).
* **Domínio de Segundo Nível:** O **nome escolhido** pelo usuário.
* **Subdomínios:** (Ex.: blog.exemplo.com).
* **Importância:**
  * **Presença Online**.
  * **Proteção de Marca**.
  * **Encontrar o site na Web**.
  * **E-mails Personalizados**.

### Hospedagem

* **Hospedagem Compartilhada:**
  * **Vantagem:** Baixo custo, fácil uso.
  * **Efeito:** Recursos limitados, baixo desempenho, sites pequenos.
* **VPS (Virtual Private Server):**
  * **Vantagem:** Maior controle, alto custo.
  * **Efeito:** Instabilidade (?), sites médios/altos tráfegos.
* **Servidor Dedicado:**
  * **Vantagem:** Segurança, total controle.
  * **Efeito:** Alto custo, manutenção privada fixa, sites altos.
* **Cloud Hosting:**
  * **Vantagem:** Menor custo, flexibilidade, pagamento conforme uso.
  * **Efeito:** Confiabilidade, dependência de infraestrutura (AWS, Azure).
* **Conclusão:** Tipo ideal é **Cloud Hosting** por pagar somente o que usa.

## 📄 Boas Práticas e Validação de Código

* **W3C (World Wide Web Consortium):** Define **boas práticas** para as linguagens Web.
* Usar **[validator.w3.org]** para **verificar o código**.
* **MDN (Mozilla Developer Network):** Para **ler documentações**.
* HTML usa **hierarquia padrão**.
  * **`<HTML>` $\rightarrow$ Elemento Raiz**.
  * **`<HEAD>`:** Contém **metadados**.

## 📐 Tipos de Layout

* **Layout Fixo:**
  * Usa valores **absolutos em pixels**.
  * **Não adapta** com a tela.
* **Layout Fluido:**
  * Usa valores **relativos em %**.
* **Layout Responsivo:**
  * Combina o **fluido** com **Media Queries**.
  * Ajusta-se no **tamanho da tela**.
* **Layout Adaptativa:**
  * Versões **específicas** para diferentes tamanhos de tela.
  * **Detecta o dispositivo**.

## JavaScript

A linguagem de programação frontend na qual traz a interatividade para o usuário, sendo possível rodá-lo no navegador nativamente ou no servidor com Node.Js

**Frameworks mais usados:**

* React (Feito pela Meta)
* Angular (Feito pela Google)
* Vue.js (Feito por Evan You)

**Declaração de variáveis:**

* var - antigo, não recomendado
* let - variável com escopo de bloco
* const - valor fixo, não pode ser reatribuído

**Devtools**
Uma ferramenta poderosa e geralmente já presente nos navegadores, utilizado para ver a estruturação da página HTML, Cookies, Comandos, etc.

**Notação Húngara**
Prevalece uma forma de escrever nomes de variáveis, funções e classes, criando uma padronização do código

Exemplo:

* Todas as variáveis inteiras começam com "int"
* Todas as strings começam com "str"
* Todos os botões começam com "btn"
* Todas as divs começam com "div"
* Todos os inputs começam "inp"

E assim por diante, prevalecendo o trabalho em equipe e legibilidade do código.
