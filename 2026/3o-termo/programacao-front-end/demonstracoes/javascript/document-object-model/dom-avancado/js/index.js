// Criando elementos para a página index

// Clone elementos com DOM
let card = document.createElement("div");
card.classList.toggle("card"); // Adicionando a classe 'card' ao meu div = div.card <div class = "card">

// Criar um container para adicionar os cards
let container = document.createElement("div");
container.classList.add("container"); // Adicionando a classe container ao div

// Criar um botão para clonar elementos
let btnClonar = document.createElement("button");
btnClonar.innerText = "Clonar"; // Adicionando texto ao botão
btnClonar.id = "btnClonar"; // Adicionando um identificador ao botão

// Adicionar elementos a página
document.body.appendChild(btnClonar);
document.body.appendChild(container); // Add container ao body
container.appendChild(card); // Add card ao container 

btnClonar.addEventListener("click", () => {
	let clonar = card.cloneNode(true); // Clonar o objeto Card
	container.appendChild(clonar) // Adicionar ao container
});

// Criar uma Chave para Dark Mode
let chave = document.createElement("input");
chave.type = "checkbox"; // Mudando o tipo do input
chave.id = "darkMode";
document.body.appendChild(chave); // Add chave ao body

let label = document.createElement("label")
label.htmlFor = chave

// Criar o evento para modo claro e modo escuro
chave.addEventListener("change", () => {
	// Adicionando ou removendo a classe darkMode ao Body
	document.body.classList.toggle("darkMode");
});