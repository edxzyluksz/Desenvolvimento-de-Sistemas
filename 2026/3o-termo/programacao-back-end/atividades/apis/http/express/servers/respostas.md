## Qual a diferença entre biblioteca e framework?

Uma biblioteca representa um conjunto de funções externas ao código que os importa para realizar tarefas simples, geralmente desenvolvida por terceiros, que possuem soluções eficazes para o que propõem a fazer. Não é tão diferente de importar um próprio arquivo de código e reaproveitar as funções feitas naquele local. Neste cenário, você possui melhor autonomia para lidar os conteúdos internos.

Um framework é marcado pela inversão de controle, convenções e fluxo de execução estruturados, e muitas vezes com um grande agrupamento de bibliotecas, porém não definidos por isso. Sendo direcionado a resolver problemas específicos, exemplos como o Express, que executa um servidor backend que recebe e responde solicitações de cliente, se diferenciam das bibliotecas tradicionais por serem específicos para uma solução, o que reduz a liberdade de criação. No entanto, o nível de impacto depende do tipo, existindo uma divisão entre **opinativos** e **leves**: Os leves permitem que o desenvolvedor tenha suas ideias trabalhando em conjunto com as ferramentas (Express, Flask), enquanto os opinativos escolhem guiar decisões arquiteturais.

Exemplos mentais:

- A biblioteca representa a ferramenta singular, como um martelo
- O framework acoberta a caixa de ferramentas completa, desde ferramentas até parafusos, por exemplo 

A partir disso, os desenvolvedores escolhem o caminho que precisam seguir no projeto sem a necessidade de reinventar a roda com problemas já testados e solucionados há muito tempo.