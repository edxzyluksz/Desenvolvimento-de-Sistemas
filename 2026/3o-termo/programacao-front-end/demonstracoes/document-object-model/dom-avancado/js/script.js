// Estudo de DOM Avançado
// Adicionar elementos com DOM em Páginas HTML

// Construir um Header com DOM

let header = document.createElement("header"); // Criação de uma tag header

// Estilização do Header
header.style.backgroundColor = "black";
header.style.height = "8vh";
header.style.width = "100%";
header.style.position = "fixed"
header.style.top = "0"


// Adicionar o header como elemento filho do body
document.body.appendChild(header);
document.body.style.margin = "0"; // Retirou a margin do body

// Adicionar elementos ao header
let divNav = document.createElement("div");

// Configurando o display da div
divNav.style.display = "flex";
divNav.style.justifyContent = "space-around";
divNav.style.color = "aliceblue";
divNav.style.height = "100%";
divNav.style.alignItems = "center";
divNav.style.fontSize = "5vh";
divNav.style.fontFamily = "Comic Sans MS";

// Adicionar a div ao header
header.appendChild(divNav);

// Adicionar itens a nav
let itensNav = ["Index", "Produtos", "Contato"]

// Percorrer o vetor
itensNav.forEach(e => {
	let item = document.createElement("a");
	item.innerHTML = e;
	item.href = e.toLowerCase() + ".html"; // Criando um link para cada item
	item.style.textDecoration = "none"; // Remover o sublinhado
	divNav.appendChild(item); // Adicionando o item a divNav
});

// Um rodapé para a página

let footer = document.createElement("footer");
document.body.appendChild(footer);
footer.style.height = "5vh";
footer.style.width = "100%"
footer.style.backgroundColor = "grey";
footer.style.display = "flex";
footer.style.justifyContent = "center";
footer.style.position = "fixed";
footer.style.bottom = "0";
footer.style.alignItems = "center";
footer.style.fontSize = "3vh";
footer.style.color = "white";

let spanFooter = document.createElement("span");
spanFooter.innerHTML = "Copyright &copy; 2026 - Todos os direitos reservados.";

footer.appendChild(spanFooter);