// DOM => Document Object Model

// Script de Manipulação DOM

// getElementById => Variável Simples - ID é sempre único

// Usar sempre o document para manipular DOM
let titulo = document.getElementById("titulo"); // Busca no HTML o elemento com o id correspondente
console.log(titulo);
titulo.innerHTML = "Outra Título para o Site"; // Modifica o conteúdo do ID

// getElementByTagName => Vetor (Array) de elementos 
let paragrafo = document.getElementsByTagName("p"); // HTML => p
paragrafo[0].innerText = "Exemplo de Parágrafo Modificado por JS (DOM)"; // Modificar elemento
paragrafo[1].style.color = "red"; // Modificar o Style do Elemento

// getElementByClassName => Vetor de Elementos
let descricao = document.getElementsByClassName("descricao");
// Modificar elementos do array
for (let i=0; i < descricao.length; i++){
    descricao[i].style.color = "blue"
}

// querySelector => Variável Simples = Seleciona sempre o primeiro elemento com a selector
let p = document.querySelector("p");
// Modificar a fonte
p.style.fontWeight = "bold";

// querySelectorAll => Vetor de Elementos => Seleciona todos os elementos
let descricaoAll = document.querySelectorAll(".descricao");
descricaoAll.forEach(e => e.style.fontWeight = "bold");

// Eventos Listener (Ouvintes)

// Chamar pelo nome da função
function MudarCorFundo(){
    let body = document.querySelector("body");
    body.style.backgroundColor = "green";
}

// Chamar diretamente no script o ouvinte
document.getElementById("btnColor").addEventListener("click", OutraCor);

function OutraCor(){
    let body = document.querySelector("body");
    body.style.backgroundColor = "orange"
}