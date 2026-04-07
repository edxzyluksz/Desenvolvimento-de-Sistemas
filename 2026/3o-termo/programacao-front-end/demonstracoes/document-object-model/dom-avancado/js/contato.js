// Criação de um formulário de contato com validação de campos do formulário

let form = document.createElement("form");
form.id = "formContato";
form.style.display = "flex";
form.style.flexDirection = "column"
form.style.justifyContent = "center"

let container = document.createElement("div")
container.classList.add("container");
document.body.appendChild(container);
container.appendChild(form);

// Adicionar elementos ao formulário
let inputName = document.createElement("input")
inputName.type = "text"
inputName.placeholder = "Digite o seu nome..."
inputName.id = "nome"
form.appendChild(inputName)

let inputEmail = document.createElement("input")
inputEmail.type = "email"
inputEmail.placeholder = "Digite o seu email"
inputEmail.id = "email"
form.appendChild(inputEmail)

let inputMsg = document.createElement("textarea")
inputMsg.id = "info"
inputMsg.placeholder = "Digite sua mensagem";
form.appendChild(inputMsg)

// Criar um botão enviar 
let btnEnviar = document.createElement("button")
btnEnviar.type = "submit"
btnEnviar.innerText = "Enviar";
form.appendChild(btnEnviar)

// Adicionar um "p" mostrar mensagem de validação do form
let p = document.createElement("p")
p.id = "mensagem";
document.body.appendChild(p)

// Evento de validação do formulário
form.addEventListener("submit", (e) => {
    e.preventDefault(); // Evita o recarregamento da página
    let nome = inputName.value;
    let email = inputEmail.value;
    let info = inputMsg.value;
    let mensagem = p;

    if (nome === "" || email === "" || info === ""){
        mensagem.innerText = "Preencha todos os campos";
        mensagem.style.color = "red";
        return;
    } else {
        mensagem.innerText = "Contato enviado com sucesso!";
        mensagem.style.color = "green";
    }

    // Limpar todos os campos
    inputName.value = "";
    inputEmail.value = "";
    inputMsg.value = "";
});