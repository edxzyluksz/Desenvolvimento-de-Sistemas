# Linguagens de Marcação (Principais)

XML: Extensible Markup Language 

HTML: Hypertext Markup Language 

JSON: JavaScript Object Notation 

## Diferenças

O HTML é utilizado para estruturar páginas na web, como textos, links e imagens, dito isso, sua função é ser uma linguagem de marcação amplamente usada e entendida por várias máquinas. Suas tags são pré-definidas: Podem até ser alteradas mas não é o convencional do mercado, graças à problemas de compatibilidade entre vários dispositivos.  

O XML possui a função-chave o transporte de dados estruturado , para que diferentes sistemas possam trocar informações de maneira padronizada. No entanto, diferente do HTML, suas tags são personalizáveis em todos os casos e o desenvolvedor deve ser instruir o sistema o que cada uma irá exibir.  

O JSON possui tags personalizáveis tal como o XML, no entanto compactas com o uso de pares chave-valor e mais leve para a troca de dados entre sistemas, onde encontra-se o foco em APIs ou aplicações web em geral. 

HTML -> Construtor de páginas web 

XML e JSON -> Transporte de dados entre os servidores 

 

## Estrutura Básica do HTML

 
```
<html>
  <head>
    <title> Título da Página </title>
  </head> 
  <body>
    <h1> Olá mundo! </h1>
    <p> Conheça o básico da linguagem HTML </p>
  </body>
</html>
```
 

## Exemplos de Tags Containers semânticas e não semânticas 

**Semânticos**

&lt;header&gt; Representa o cabeçalho ou início de uma seção ou página. 

&lt;nav&gt; Define um bloco para navegação, ideal para listas e links como um menu principal 

&lt;main&gt; Representa o conteúdo principal de uma página. Pode-se ter apenas um tag main. 

&lt;article&gt; Representa um conteúdo autônomo independente ou independente, como uma notícia ou um post de blog. Pode ser distribuido independentemente 

&lt;section&gt; Define uma seção genérica de um documento, e deve ser usada para agrupar conteúdo relacionados tematicamente 

&lt;footer&gt; Define o conteúdo que será exibido no rodapé da página, tudo que estará no final do conteúdo apresentado. 

&lt;aside&gt; Define um conteúdo que está separado dos demais, é comumente usado em barras laterais (sidebars) 

&lt;figure&gt; Usada para um bloco de imagem, ilustrações, gráficos, etc. Pode-se utilizar uma tag auxiliar como a &lt;figcaption&gt; para colocar a legenda na tag. 

**Não semânticos**

&lt;div&gt; Usada para agrupar blocos de conteúdo que possam ser manipulados com CSS ou JavaScript.

&lt;span&gt; Tag usada para agrupar e estilizar pequenas partes de texto dentro de um paragráfo 

## Ponto Crucial

O que definirá se o contêiner a ser utilizado é semântico ou não se trata do plano de desenvolvimento, mais especificamente na parte da Experiência do Usuário (UX). Quando o contêiner é semântico, os chamados Leitores de Tela para acessibilidade conseguirão identificar mais facilmente do que cada trecho da marcação se tratam.
