## 💾 BANCO DE DADOS: ANOTAÇÕES DE ESTUDO

### **Conceitos Fundamentais**

#### **Componentes de um SGBD**

* **Itens Individuais:** Linhas - Registros ou Tuplas.
* **Colunas:** Atributos ou Campos.
* **Características:** Propriedades.
* **Ações:** Restaurar, fazer *overwrite*, adicionar e excluir informações.

#### **MER - Modelo Entidade Relacional**
Uma forma de **representar a realidade em termos de dados**.
* Modelo Visual.

#### **DER - Diagrama Entidade Relacional**
* **Normalização:**
    1. O que o sistema precisa guardar? (**LR** - Levantamento de Requisitos).
    2. Criar um **Modelo Conceitual**.
    3. Organizar e descrever a **estrutura do Banco de Dados**.
    4. Criar o Banco de Dados usando um **SGBD**.

### **Estrutura de Tabelas e Chaves**

#### **Tabela Cliente (Exemplo)**
| CAMPO | TIPO DE DADOS |
| :--- | :--- |
| NOME | VARCHAR |
| CPF | CHAR |
| EMAIL | VARCHAR |

#### **Chave Primária (Primary Key - PK)**
Um campo (ou conjunto de campos) que **identifica unicamente cada registro em uma tabela**. Basicamente, o **ID**.

* **Características:**
    * Uma para cada registro.
    * Não pode ser **nula**.
    * Garante a **identificação exclusiva** de cada linha na tabela.
* **Importância:**
    * Facilita a **busca e atualização** de dados.
    * Mantém a **integridade dos dados**.
    * Base para **relacionamento entre tabelas**.
* **Tipos:**
    * **Chave Simples:** Atributo único.
    * **Chave Composta:** Dois ou mais atributos, para formar **unicidade**.

#### **Chave Estrangeira (Foreign Key - FK)**
Um campo em uma tabela que **aponta para a chave primária de outra tabela**.

* **Função:**
    * Estabelecer **vínculos entre tabelas**.
    * **Integridade Relacional**.
    * Navegação e consulta integrada em conjuntos de dados relacionados.

#### **Exemplo de Relacionamento (Autor e Livro)**
1. A tabela **AUTOR** é **PAI**, sendo assim, a tabela **LIVRO** é **FILHO** do **AUTOR**.
2. A tabela **AUTOR** possui somente uma chave, sendo esta **primária** "ID\_AUTOR", enquanto a tabela **LIVRO** possui chave **primária** "ID\_LIVRO" e chave **estrangeira** "ID\_AUTOR".
3. Se não existe um autor atribuído a nenhum livro, este pode ser apagado sem problemas, caso contrário, o SGBD **proibiria a ação** (Integridade Referencial).

### **Normalização**

#### **Modelo Físico**
É interessante **DESNORMALIZAR** um BD para **RELATÓRIOS MAIS PESADOS** e para **FACILITAR IMPRESSÃO**.

#### **Desnormalização**
* Permite **redundância de dados**.
* **Inconsistência** - ao apagar determinada informação, outras também podem ser excluídas ou mantidas isoladamente.

#### **1ª Forma Normal (1FN)**
Ao seguir a 1FN, estas considerações serão impostas:
* Para **atributos multivalorados** (que podem ter vários valores para um mesmo registro), **duplica-se as linhas** para evitar desnormalização.
* Para **atributos compostos**, este atributo transforma-se em **vários campos**.

#### **Exemplo 1FN (Pessoa e Cursos)**
| NOME | ENDEREÇO | NIF | CURSOS |
| :--- | :--- | :--- | :--- |
| ANA | COVILHÃ | 123456789 | PROGRAMADOR |
| ANA | FUNDÃO | 999999999 | OPERADOR |
| ANA | FUNDÃO | 000000000 | PROGRAMADOR |
| CARLOS | COVILHÃ | 222333444 | ANALISTA |
| CARLOS | COVILHÃ | 222333444 | PROGRAMADOR |
| CARLOS | COVILHÃ | 222333444 | OPERADOR |
| PAULO | GUARDA | 555666777 | OPERADOR |
| PAULO | GUARDA | 555666777 | ANALISTA |

#### **Exemplo 1FN (Pedido de Produtos)**
| PEDIDO | PRODUTO | QTD | PREÇO |
| :--- | :--- | :--- | :--- |
| 1001 | CAMISA | 2 | 50 |
| 1001 | TÉNIS | 1 | 100 |

#### **2ª Forma Normal (2FN)**
* Obrigatoriamente precisa da **1FN**.
* Consiste basicamente em **atribuir as tabelas corretamente**.

### **SGBD e Dificuldades**

#### **Aplicações**
* **TCCs** (Trabalhos de Conclusão de Curso) deverão ser documentados e possuir **MER** e **DER**.
* **SQL:** DDL (Data Definition Language), DML (Data Manipulation Language).

#### **SGBD (Sistema Gerenciador de Banco de Dados)**
Um Banco de Dados atual com SGBD é exponencialmente **mais veloz** do que uma planilha/Excel, e mais ainda que escrito com papel e caneta.

#### **Dificuldades Encontradas**
Aprender a manipular e criar ambientes como esse (Banco de Dados) significa estar disputando lado a lado com seus concorrentes e **abraçar o futuro**. As folhas físicas são mais **obsoletas** e difíceis de...

## MySQL

O comando SELECT "*" é ideal apenas em ambiente de testes, visto que em uma aplicação real isto traria mais processamento para o banco de dados.
