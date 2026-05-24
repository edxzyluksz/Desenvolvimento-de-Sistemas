# Enunciado — Sistema de Gerenciamento de Biblioteca

Uma biblioteca deseja informatizar seu sistema de gerenciamento. Atualmente, todo o controle é feito manualmente, o que gera inconsistências e dificulta a busca por informações.

O novo sistema deve permitir o registro de:

- livros
- usuários
- empréstimos
- reservas

## Requisitos do Sistema

### Livros

- Cada livro possui um `ISBN` (identificador único), título, autor(es), ano de publicação, editora e número de exemplares disponíveis.
- Um livro pode ter múltiplos autores.

### Autores

- Cada autor possui um código de autor (identificador único), nome e nacionalidade.

### Editoras

- Cada editora possui um código de editora (identificador único), nome e endereço.

### Usuários

- Cada usuário possui um número de matrícula (identificador único), nome completo, endereço, telefone e e-mail.
- Um usuário pode ter vários telefones.

### Empréstimos

- Um empréstimo registra qual usuário pegou qual exemplar de livro, a data do empréstimo e a data de devolução prevista.
- Quando um exemplar é devolvido, a data de devolução efetiva deve ser registrada.
- Um exemplar de livro só pode ser emprestado se estiver disponível.
- Um usuário pode ter múltiplos empréstimos ativos.

### Exemplares

- Cada exemplar de um livro tem um código de exemplar (identificador único dentro do livro) e um status: disponível, emprestado, reservado ou danificado.

### Reservas

- Um usuário pode reservar um livro que não está disponível no momento.
- A reserva deve registrar qual usuário reservou qual livro e a data da reserva.
- Um livro pode ter múltiplas reservas.
- Quando um livro reservado se torna disponível, o primeiro usuário na fila de reserva deve ser notificado.

## O que deve ser feito

A partir do contexto acima:

1. Identifique as entidades principais.
2. Identifique os atributos de cada entidade.
   - Indique qual(is) atributo(s) servem como identificador(es) (chave primária).
   - Indique se há atributos multivalorados ou compostos.
3. Identifique os relacionamentos entre as entidades.
   - Entidades envolvidas.
   - Tipo de relacionamento (`1:1`, `1:N`, `N:M`).
   - Cardinalidade mínima e máxima de cada lado.
   - Se há atributos no relacionamento.

## Entregáveis

- Dicionário de dados — feito no Excel.
- Diagrama MER — feito no brModelo (entregue o arquivo gerado e um print da tela contendo o diagrama).
- Diagrama DER — feito no brModelo (entregue o arquivo gerado e um print da tela contendo o diagrama).

## Nomes dos arquivos

- `DD_SeuNome.xlsx` — arquivo Excel
- `MER_SeuNome.br3` — arquivo brModelo
- `MER_SeuNome.png` — print de tela do MER
- `DER_SeuNome.br3` — arquivo brModelo
- `DER_SeuNome.png` — print de tela do DER

Você pode subir os arquivos individualmente ou compactados.
