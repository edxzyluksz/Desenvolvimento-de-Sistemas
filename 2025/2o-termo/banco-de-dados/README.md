# Banco de Dados

## Conceitos fundamentais

### Componentes de um SGBD

* Itens individuais: linhas - registros ou tuplas.
* Colunas: atributos ou campos.
* Características: propriedades.
* Ações: restaurar, sobrescrever, adicionar e excluir informações.

### MER - Modelo entidade-relacional

Uma forma de representar a realidade em termos de dados.

* modelo visual.

### DER - Diagrama entidade-relacional

* Normalização:
    1. O que o sistema precisa guardar? (LR - levantamento de requisitos).
    2. Criar um modelo conceitual.
    3. Organizar e descrever a estrutura do banco de dados.
    4. Criar o banco de dados usando um SGBD.

### Estrutura de tabelas e chaves

#### Tabela cliente (exemplo)

| Campo | Tipo de dados |
| :--- | :--- |
| nome | VARCHAR |
| cpf | CHAR |
| email | VARCHAR |

#### Chave primária (primary key - PK)

Um campo (ou conjunto de campos) que identifica unicamente cada registro em uma tabela. Basicamente, o id.

* Características:
  * uma para cada registro.
  * não pode ser nula.
  * garante a identificação exclusiva de cada linha na tabela.
* Importância:
  * facilita a busca e atualização de dados.
  * mantém a integridade dos dados.
  * base para relacionamento entre tabelas.
* Tipos:
  * chave simples: atributo único.
  * chave composta: dois ou mais atributos, para formar unicidade.

#### Chave estrangeira (foreign key - FK)

Um campo em uma tabela que aponta para a chave primária de outra tabela.

* Função:
  * estabelecer vínculos entre tabelas.
  * integridade referencial.
  * navegação e consulta integrada em conjuntos de dados relacionados.

#### Exemplo de relacionamento (autor e livro)

1. A tabela autor é pai, sendo assim, a tabela livro é filho do autor.
2. A tabela autor possui somente uma chave, sendo esta primária `id_autor`, enquanto a tabela livro possui chave primária `id_livro` e chave estrangeira `id_autor`.
3. Se não existe um autor atribuído a nenhum livro, este pode ser apagado sem problemas; caso contrário, o SGBD proibiria a ação por integridade referencial.

### Normalização

#### Modelo físico

É interessante desnormalizar um banco de dados para relatórios mais pesados e para facilitar impressão.

#### Desnormalização

* permite redundância de dados.
* inconsistencia - ao apagar determinada informação, outras também podem ser excluídas ou mantidas isoladamente.

#### 1ª forma normal (1FN)

Ao seguir a 1FN, estas considerações serão impostas:

* para atributos multivalorados (que podem ter vários valores para um mesmo registro), duplica-se as linhas para evitar desnormalização.
* para atributos compostos, este atributo transforma-se em vários campos.

#### Exemplo 1FN (pessoa e cursos)

| Nome | Endereço | NIF | Cursos |
| :--- | :--- | :--- | :--- |
| Ana | Covilhã | 123456789 | Programador |
| Ana | Fundão | 999999999 | Operador |
| Ana | Fundão | 000000000 | Programador |
| Carlos | Covilhã | 222333444 | Analista |
| Carlos | Covilhã | 222333444 | Programador |
| Carlos | Covilhã | 222333444 | Operador |
| Paulo | Guarda | 555666777 | Operador |
| Paulo | Guarda | 555666777 | Analista |

#### Exemplo 1FN (pedido de produtos)

| Pedido | Produto | Qtd | Preço |
| :--- | :--- | :--- | :--- |
| 1001 | Camisa | 2 | 50 |
| 1001 | Tênis | 1 | 100 |

#### 2ª forma normal (2FN)

* obrigatoriamente precisa da 1FN.
* consiste basicamente em atribuir as tabelas corretamente.

### SGBD e dificuldades

#### Aplicações

* TCCs (trabalhos de conclusão de curso) deverão ser documentados e possuir MER e DER.
* SQL: DDL (Data Definition Language), DML (Data Manipulation Language).

#### SGBD (Sistema Gerenciador de Banco de Dados)

Um banco de dados atual com SGBD é exponencialmente mais veloz do que uma planilha/Excel, e mais ainda do que escrito com papel e caneta.

#### Dificuldades encontradas

Aprender a manipular e criar ambientes como esse (banco de dados) significa estar disputando lado a lado com seus concorrentes e abraçar o futuro. As folhas físicas são mais obsoletas e difíceis de...

## MySQL

O comando `SELECT *` é ideal apenas em ambiente de testes, visto que em uma aplicação real isto traria mais processamento para o banco de dados.
