# Resumo do 1º dia de aula SENAI 2026 - Desenvolvimento de Sistemas

Para o conteúdo de hoje, realizou-se inicialmente como a criação de um novo perfil nas máquinas A58 e A59 com o nome padrão 2DevSESI para cada aluno.
Isso resultou no fato de que o professor Diogo precisou passar senhas sensíveis da administração da instituição, demandando grande responsabilidade caso esta informação seja comprometida.

Os avisos iniciais se tratavam sobre como a conduta do docente e estudantes devem ser, e no caso específico do curso, caso algum software não permitido pela rede SENAI seja detectado em algum dispositivo, este será reportado para a matriz de São Paulo.

O cronograma de aulas para o 3º termo consistem em:
- Programação Frontend
- Programação Backend 2
- Projeto de Software 2
- Programação para Dispositivos Móveis

**Após criação do usuário**
Com o usuário criado, o primeiro passo foi instalar Git para futuro versionamentos de projetos e Visual Studio Code, um editor de texto que tecnicamente não é uma IDE, porém uma ferramenta poderosa com as inúmeras extensões publicadas.

Uma extensão em particular instalada oficialmente na aula de hoje foi o Live Share, que, com um código de sala e conexão de rede, usuários conseguem ler (e às vezes editar) um terminal compartilhado, o que facilita também o aprendizado na sala da aula, evitando a visualização constante do monitor projetado na televisão.

Foi-se também explorado uma feature do VS Code que são os Perfis (Profiles), e com estes, é possível instalar determinadas extensões e configurar especificamente para cada tipo de projeto que realizar. Em nosso caso, estes no momento são: 
- Web (com node.js)
- Flatter (dev mobile)

## Para relembrar

### Git
- Configurar sua máquina globalmente com seu nome e email do GitHub - `git config --global`: `user.name "seu_nome"` ou `user.email "seu@email.com` 

### Gerenciamento de arquivos básica no cmd:
- Ver todo o conteúdo em determinado diretório: `dir`
- Navegar entre pastas: `cd <nome_da_pasta>` ou `cd ..` (para voltar)
- Criar uma pasta: `mkdir <nome_da_pasta>`
- Criar um arquivo VAZIO: `type nul > <nome_do_arquivo.extensao>`
- Criar um arquivo sem caracteres, mas com uma linha vazia: `echo "mensagem" > <nome_do_arquivo.extensao>`

# Introdução ao Desenvolvimento Mobile

### Tipo de Desenvolvimento

- Nativo
    - Android:
        - SDK : Android SDK;
        - IDE: Android Studio;
        - Linguagens : Kotlin e Java;
        - Ambientes: Mac, Windows, Linux.
    - IOS:
        - SDK: Cocoa Touch;
        - IDE: Xcode;
        - Linguagens: Swift / ObjectType-C;
        - Ambientes: Mac.

- Multiplataforma
    - React Native:
        - SDK: Node.JS;
        - IDE: VSCode;
        - Linguagens: JavaScript / TypeScript;
        - Ambientes: Mac, Win, Linux.
    - Flutter
        - SDK: Flutter SDK;
        - IDE: VSCode, Android Studio;
        - Linguagens: Dart;
        - Ambientes: Mac, Win, Linux.