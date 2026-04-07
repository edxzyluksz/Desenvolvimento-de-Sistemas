// Eventos Avançados com DOM

// Capturar letra digitada -> function
document.addEventListener("keydown", (e) => {
    // Exibir letra no console
    console.log("Tecla pressionada: " + e.key)
});

// Função para sugestão de texto em campos de busca
let input = document.createElement("input");
input.type = "text";
input.id = "busca";
input.placeholder = "Digite para buscar..."
document.body.appendChild(input) // Add input ao body

// Criar uma lista de sugestões
let lista = document.createElement("ul") // Lista não ordenada
lista.id = "sugestoes"
lista.style.listStyle = "none" // remove a característica de lista
document.body.appendChild(lista) // Adicionando a lista ao body

// Criar um vetor de sugestões

let sugestoes = [
    "JavaScript", "TypeScript", "Java", "Dart", "Kotlin",
    "C", "C#", "C++", "Assembly", "Cobol", "Ruby", "PHP", "Lua", "Python",
    "Swift", "Pascal", "Delphi", "Rust", "Go"
]

// Evento para capturar o texto e sugerir a partir dos caracteres digitados.
input.addEventListener("keyup", () =>{
    let texto = input.value.toLowerCase();
    lista.innerHTML="";
    sugestoes.forEach(sugestao => {
        if(sugestao.toLowerCase().includes(texto)) {
            let item = document.createElement("li");
            // Permitir click do item
            item.style.cursor = "pointer" // Transforma na "mão" do mouse
            item.addEventListener("click", () => {
                input.value = sugestao; // Ao clicar no item, pega o texto e envia para o input
                lista.innerHTML = ""; // Limpa a lista de antes
            });
            item.innerText = sugestao
            lista.appendChild(item)
        }
    });
});