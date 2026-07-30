// Lógica de funcionamento da lista de tarefas

// Criar um event listener para a tarefa
const btnEnviar = document.getElementById("btnEnviar"); // Objeto para controlar o botão
const tarefa = document.getElementById("tarefa") // Objeto para controlar o input

btnEnviar.addEventListener("click", criarTarefa)

// Criar a função para criar tarefa
function criarTarefa(){
    let texto = tarefa.value;
    // Verificar se tarefa não está vazia
    if (texto == ""){
        return;
    }
    // Se não estiver vazia => Não precisa do else, pois o return para o código se estiver vazio o nome da tarefa
    let li = document.createElement("li"); // Criação de um List Item
    li.innerHTML = texto + '<button onclick="removerTarefa(this)" class="btnRemove">Remover</button>'
    let lista = document.getElementById("lista")
    lista.appendChild(li); // Adicionando o li a ul via append
    // Limpa campo do input
    tarefa.value = "";
}

function removerTarefa(botao){
    botao.parentElement.remove();
}

// Estilizando pelo DOM

document.body.style.backgroundColor = "#bbb";
document.body.style.textAlign = "center";
document.body.style.fontFamily = "Comic Sans MS";
document.body.style.listStyle = "none"

let container = document.querySelector(".container")
container.style.width = "50%";
container.style.backgroundColor = "lightblue";
container.style.margin = "auto";
container.style.borderRadius = "15px";

tarefa.style.width = "50%";
tarefa.style.padding = "10px";
tarefa.style.borderRadius = "5px";

btnEnviar.style.padding = "6px 10px";
btnEnviar.style.border = "none"
btnEnviar.style.backgroundColor = "green";
btnEnviar.style.color = "white";
btnEnviar.style.borderRadius = "5px";
btnEnviar.style.cursor = "pointer";

let lista = document.getElementById("lista")
lista.style.listStyle = "none";

// Não compensa estilizar com o DOM!!!