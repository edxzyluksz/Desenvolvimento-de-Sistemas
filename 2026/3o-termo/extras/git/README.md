# Como usar git e enviar corretamente para o GitHub

## Configurações Iniciais

1. Instalar o Git: Baixe e instale o Git em seu computador a partir do site oficial: https://git-scm.com/downloads
2. Configurar o Git: Após a instalação, abra o terminal e configure seu nome de usuário e email usando os seguintes comandos:

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@exemplo.com"
```

## Criar um Repositório Local

1. Navegue até o diretório onde deseja criar o repositório usando o terminal.
2. Execute o comando para inicializar um repositório Git:

```bash
git init
```
3. Adicione os arquivos ao repositório:

Você pode adicionar arquivos usando o Git Bash e com os comandos:

``` bash
touch nome_do_arquivo.extensão # Cria um novo arquivo vazio
cat > nome_do_arquivo.extensão # Atenção: Esse comando reescreve o conteúdo do arquivo se já possuir conteúdo, então use com cuidado.
```

4. Para ler o conteúdo do arquivo, use:

```bash
cat nome_do_arquivo.extensão
```

Outras opções:

```bash
nano nome_do_arquivo.extensão
vim nome_do_arquivo.extensão
```

Estes são editores de texto que permitem criar e editar arquivos diretamente no terminal. O nano é mais simples e fácil de usar, enquanto o vim é mais poderoso, mas tem uma curva de aprendizado mais íngreme.

5. Faça um commit das alterações:

```bash
git commit -m "Mensagem do commit"
```

## Criar um Repositório no GitHub

1. Acesse o GitHub e faça login em sua conta.
2. Clique no botão "New" para criar um novo repositório.
3. Preencha o nome do repositório, adicione uma descrição (opcional) e escolha se deseja que o repositório seja público ou privado.
4. Clique em "Create repository".

## Conectar o Repositório Local ao GitHub

1. No terminal, adicione o repositório remoto do GitHub usando o comando:

```bash
git remote add origin https://github.com/seu_usuario/nome_do_repositorio.git
```

2. Envie as alterações para o GitHub:

```bash
git push -u origin main
```

O -u flag define a branch upstream, o que significa que as próximas vezes que você usar `git push` ou `git pull`, o Git saberá para qual branch enviar ou de onde puxar as alterações.

3. Para enviar alterações futuras, basta usar:

```bash
git push
```

o upstream já estará configurado, então o Git saberá para onde enviar as alterações sem precisar especificar a branch e o repositório remoto novamente.

## Licenças de Código

Ao criar um repositório no GitHub, é importante escolher uma licença de código para proteger seus direitos autorais e definir as condições de uso do seu código. Algumas licenças populares incluem:
- MIT License: Permite que outros usem, modifiquem e distribuam seu código, desde que atribuam crédito a você.
- GNU General Public License (GPL): Exige que qualquer código derivado seja distribuído sob a mesma licença, garantindo que as modificações também sejam de código aberto.
- Apache License 2.0: Permite o uso, modificação e distribuição do código, mas inclui uma cláusula de patente que protege os contribuidores de ações judiciais relacionadas a patentes.
- Creative Commons: Oferece várias opções de licenciamento para diferentes tipos de conteúdo, incluindo código, imagens e texto.

Escolha a licença que melhor se adequa às suas necessidades e adicione um arquivo LICENSE ao seu repositório com o texto da licença escolhida. Isso ajudará a proteger seus direitos autorais e a esclarecer as condições de uso do seu código para outros desenvolvedores.

## Diretório .git

A pasta `.git` é onde o Git armazena todas as informações do repositório, incluindo o histórico de commits, branches, tags e configurações. Se você apagar a pasta `.git`, perderá todo o histórico do repositório e não poderá mais usar os comandos do Git para gerenciar seu código. O diretório se tornará um diretório comum sem controle de versão, e você não poderá mais rastrear alterações, criar branches ou fazer commits. Portanto, é importante ter cuidado ao manipular a pasta `.git` para evitar a perda de dados importantes do seu projeto.

## Branches

As branches são ramificações do código que permitem trabalhar em diferentes funcionalidades ou correções de bugs sem afetar o código principal (geralmente a branch main ou main). Para criar uma nova branch, use o comando:

```bash
git checkout -b nome_da_branch
```

Isso criará uma nova branch e mudará para ela. Para voltar para a branch principal, use:

```bash
git checkout main
```

Para mesclar as alterações de uma branch para a branch principal, use:

```bash
git checkout main
git merge nome_da_branch
```

### Checkout em um hash

O comando `git checkout` pode ser usado para navegar para um commit específico usando seu hash. Para fazer isso, use o comando:

```bash
git checkout <hash_do_commit>
```
Isso permitirá que você veja o estado do código naquele commit específico. No entanto, é importante notar que isso colocará o repositório em um estado "detached HEAD", o que significa que você não estará em uma branch ativa. Se você fizer alterações nesse estado, elas não serão associadas a nenhuma branch e podem ser perdidas se você mudar para outra branch ou fizer checkout de outro commit. Portanto, é recomendado criar uma nova branch a partir desse commit se você planeja fazer alterações:

```bash
git checkout -b nome_da_nova_branch <hash_do_commit>
```

Isso é útil para revisar o código em um commit específico, comparar mudanças entre commits ou criar uma nova branch a partir de um commit antigo para desenvolver uma nova funcionalidade ou corrigir um bug.

Você pode navegar para um commit específico e usar o comando `cat nome_do_arquivo.extensão` para visualizar o conteúdo do arquivo naquele commit. Isso permitirá que você veja exatamente o que estava escrito no arquivo naquele ponto específico da história do repositório. No entanto, lembre-se de que, ao fazer isso, você estará em um estado "detached HEAD", então qualquer alteração que você fizer não será associada a uma branch ativa, a menos que você crie uma nova branch a partir desse commit.

Para voltar para a branch principal depois de fazer checkout em um hash, você pode usar o comando:

```bash
git checkout main
```

### Referências relativas

O Git também suporta referências relativas, que permitem navegar para commits anteriores ou posteriores em relação ao commit atual. Por exemplo, `HEAD~1` se refere ao commit pai do commit atual, `HEAD~2` se refere ao avô do commit atual, e assim por diante. Você pode usar essas referências relativas com o comando `git checkout` para navegar para um commit específico:

```bash
git checkout HEAD~1
```



### Enviar para o GitHub

Depois de criar uma branch e fazer as alterações necessárias, você pode enviar a branch para o GitHub usando o comando:

```bash
git push -u origin nome_da_branch
```
Isso enviará a branch para o repositório remoto no GitHub e definirá a branch upstream, permitindo que você use `git push` e `git pull` sem precisar especificar a branch e o repositório remoto novamente.

O Git entende qual branch você está usando para dar o pull sem precisar especificar a branch e o repositório remoto novamente, desde que você tenha configurado a branch upstream corretamente usando o comando `git push -u origin nome_da_branch`. Isso permite que o Git saiba para onde enviar ou de onde puxar as alterações quando você usar `git push` ou `git pull` sem argumentos adicionais.

## Pull Requests

Os pull requests são uma forma de solicitar que suas alterações sejam revisadas e mescladas em um repositório. Para criar um pull request, siga estes passos:
1. Faça um fork do repositório original para sua conta do GitHub.
2. Clone o repositório forkado para sua máquina local.
3. Crie uma nova branch para suas alterações.
4. Faça as alterações necessárias e faça commit delas.
5. Envie a branch para o seu repositório forkado no GitHub.
6. Vá para o repositório original no GitHub e clique em "New Pull Request
7. Selecione a branch que você criou e envie o pull request para revisão.
O proprietário do repositório original pode revisar suas alterações, discutir sobre elas e decidir se deseja mesclá-las ao código principal. Os pull requests são uma parte fundamental do fluxo de trabalho colaborativo no GitHub, permitindo que os desenvolvedores contribuam para projetos de código aberto e trabalhem juntos em projetos privados.

## Issues

As issues são uma forma de rastrear tarefas, bugs ou solicitações de recursos em um repositório. Para criar uma issue, vá para a aba "Issues" do repositório no GitHub e clique em "New Issue". Preencha o título e a descrição da issue, e adicione quaisquer etiquetas ou atribuições necessárias. As issues ajudam a organizar o trabalho em um projeto, permitindo que os desenvolvedores discutam e acompanhem o progresso das tarefas.

## GitHub Actions

O GitHub Actions é uma plataforma de integração contínua e entrega contínua (CI/CD) que permite automatizar fluxos de trabalho de desenvolvimento diretamente no GitHub. Com o GitHub Actions, você pode criar pipelines de automação para compilar, testar e implantar seu código sempre que ocorrerem eventos específicos, como push ou pull request. Isso ajuda a garantir que seu código seja testado e implantado de maneira consistente, melhorando a qualidade do software e acelerando o processo de desenvolvimento.

### O que é um pipeline (CI/CD)

É um conjunto de etapas automatizadas que são executadas em resposta a eventos específicos, como push ou pull request. Essas etapas podem incluir a compilação do código, execução de testes, análise de qualidade do código e implantação do aplicativo. O objetivo de um pipeline CI/CD é garantir que o código seja testado e implantado de maneira consistente, melhorando a qualidade do software e acelerando o processo de desenvolvimento.

Simplificando, o GitHub Actions é uma ferramenta que permite automatizar tarefas relacionadas ao desenvolvimento de software, como testes e implantações, diretamente no GitHub, tornando o processo de desenvolvimento mais eficiente e confiável.

Exemplo de um arquivo de configuração do GitHub Actions (`.github/workflows/ci.yml`):

Entendendo GitHub Actions:
- `name`: O nome do workflow.
- `on`: Os eventos que acionam o workflow (neste caso, push e pull_request).
- `jobs`: Define os trabalhos que serão executados no workflow.
- `build`: O nome do trabalho.
- `runs-on`: O ambiente onde o trabalho será executado (neste caso, a última versão do Ubuntu).
- `steps`: As etapas que compõem o trabalho, como checkout do código, configuração do JDK e execução do comando Maven para construir o projeto.
- `uses`: Especifica uma ação pré-construída a ser usada em uma etapa (por exemplo, actions/checkout@v2 para fazer o checkout do código).
- `run`: Especifica um comando a ser executado em uma etapa (por exemplo, mvn clean install para construir o projeto usando Maven).

```yaml
name: CI
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Set up JDK 11
        uses: actions/setup-java@v1
        with:
          java-version: 11
      - name: Build with Maven
        run: mvn clean install
```

O que faz: Este workflow é acionado sempre que há um push ou pull request. Ele executa um job chamado "build" em um ambiente Ubuntu, onde faz o checkout do código, configura o JDK 11 e executa o comando Maven para construir o projeto.

## GitHub Pages

O GitHub Pages é um serviço gratuito oferecido pelo GitHub que permite hospedar sites estáticos diretamente a partir de um repositório. Ele é comumente usado para criar portfólios, blogs e documentação de projetos. Para usar o GitHub Pages, basta criar um repositório com o nome `username.github.io` (substituindo "username" pelo seu nome de usuário do GitHub) e adicionar os arquivos do site ao repositório. O site será automaticamente publicado em `https://username.github.io`. Você também pode configurar o GitHub Pages para usar uma branch específica ou uma pasta dentro do repositório para hospedar o site.