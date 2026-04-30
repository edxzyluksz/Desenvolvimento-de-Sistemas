const registroUsuario = document.getElementById("registro-user");
const nomeInput = document.getElementById("nome");
const idadeInput = document.getElementById("idade");
const emailInput = document.getElementById("email");
const telefoneInput = document.getElementById("tel");
const preferencias = document.querySelectorAll('input[type="checkbox"]');

const textoDinamico = document.getElementById("texto-dinamico");
const listaConvidados = document.getElementById("confirmados-lista");

const switchThemesBtn = document.getElementById("switchThemes");

registroUsuario.addEventListener("submit", (e) => {
  e.preventDefault();

  let nome = nomeInput.value;
  let idade = idadeInput.value;
  let email = emailInput.value;
  let telefone = telefoneInput.value;

  

  let preferenciasSelecionadas = [];
  preferencias.forEach((checkbox) => {
    if (checkbox.checked) {
      preferenciasSelecionadas.push(checkbox.value);
    }
  });

  criarCard(nome, idade, email, telefone, preferenciasSelecionadas);

  textoDinamico.textContent = "Convidado adicionado com sucesso!";

  registroUsuario.reset();
});

function criarCard(nome, idade, email, telefone, preferencias) {
  const pessoa = document.createElement("div");
  pessoa.classList.add("confirmado");

  pessoa.innerHTML = `
        <h3 class="confirmado-nome">${nome}</h3>
        <p class="confirmado-idade">Idade - ${idade}</p>
        <p class="confirmado-email">Email - ${email}</p>
        <p class="confirmado-telefone">Telefone - ${telefone}</p>
        <p class="confirmado-preferencias">Preferências - ${preferencias.join(", ")}</p>
        <hr>
    `;

  listaConvidados.appendChild(pessoa);
}

let modoEscuro = false;

switchThemesBtn.addEventListener("click", () => {
    modoEscuro = !modoEscuro
    document.body.classList.toggle("darkMode")
    if (modoEscuro){
        switchThemesBtn.textContent = "☀️";
        switchThemesBtn.style.backgroundColor = "white";
    } else {
        switchThemesBtn.textContent = "🌙";
        switchThemesBtn.style.backgroundColor = "black";
    }
});