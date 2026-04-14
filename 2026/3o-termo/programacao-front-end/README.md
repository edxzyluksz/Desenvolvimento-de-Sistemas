# Programação Front-End

## Sumário

- [Introdução aos conceitos](#aula-290126---introdução)

## Aula (29/01/26) - Introdução

- Instalação do Node.js (Permite a compilação do JavaScript na Máquina)
  - node -v (verifica a versão instalada do node)
  - npm -v (verifica a versão instalada do npm)
    - Node Package Manager (Gerenciador de Pacotes)
    - Set-ExecutionPolicy Unrestricted (Libera a execução de scripts do Node)
  - Sempre instalar a versão LTS (Long Term Support)

- Introdução ao JavaScript (JS)

- Informações importantes
  - Usa-se o ambiente de variáveis do sistema para possiblititar a compilação do JS no Windows

## Aula (24/02/26) - Arrays e Matrizes

O primeiro elemento de uma lista possui índice 0.
Considerando que um array sempre possui comprimento definido, usa-se o laço 'for' para percorrê-lo.

## Arrow Functions

As Arrow Functions são uma forma mais concisa de escrever funções em JavaScript, Dart, TypeScript e outras linguagens que suportam essa sintaxe.

Elas permitem criar funções anônimas de maneira mais simples e legível. A sintaxe básica é a seguinte:

```javascript
const nomeDaFuncao = (parametros) => {
  // corpo da função
};
```

### Diferença entre Arrow Functions e Funções Tradicionais

- **Sintaxe**: As Arrow Functions têm uma sintaxe mais curta e concisa em comparação com as funções tradicionais. Elas não possuem a palavra-chave `function` e usam a seta `=>` para separar os parâmetros do corpo da função.

- **Contexto de `this`**: As Arrow Functions não possuem seu próprio contexto de `this`. Em vez disso, elas herdam o valor de `this` do contexto em que foram definidas. Isso pode ser útil para evitar problemas relacionados ao escopo de `this` em funções tradicionais.

- **Uso de `arguments`**: As Arrow Functions não possuem o objeto `arguments`, que é uma coleção de todos os argumentos passados para a função. Se você precisar acessar os argumentos, pode usar o operador rest (`...`) para coletá-los em um array.

Exemplo:

```javascript
const minhaFuncao = (...args) => {
  console.log(args);
};
```

## MVC (Model-View-Controller)

O MVC é um padrão de arquitetura de software que separa a aplicação em três componentes principais: Model (Modelo), View (Visão) e Controller (Controlador). Cada componente tem uma responsabilidade específica, o que facilita a manutenção e a escalabilidade da aplicação.

- **Model (Modelo)**: Responsável por gerenciar os dados e a lógica de negócios da aplicação. Ele representa a estrutura dos dados e as regras de negócio.

- **View (Visão)**: Responsável por apresentar os dados ao usuário. Ela é a interface gráfica da aplicação, onde o usuário interage com os dados.

- **Controller (Controlador)**: Responsável por receber as entradas do usuário, processar as informações e atualizar o Model e a View de acordo. Ele atua como um intermediário entre o Model e a View.

O MVC é amplamente utilizado em desenvolvimento web e em outras áreas de desenvolvimento de software, pois promove a separação de preocupações e facilita a manutenção do código.
