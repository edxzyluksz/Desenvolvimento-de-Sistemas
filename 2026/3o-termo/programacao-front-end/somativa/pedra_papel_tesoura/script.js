// divs
const mostraSelecao = document.getElementById("selecao");
const mostraDisputa = document.getElementById("disputa");

// textos
const escolhaTexto = document.getElementById("escolha-texto")
const textoOpcao = document.getElementById("texto-opcao");

// botões
const botoesUsuario = document.querySelectorAll(".pessoa"); // Botões do usuário
const btnHumano = document.getElementById("humano-resultado");
const btnRobo = document.getElementById("robo-resultado");

let escolhaUsuario;
let opcoes = ["pedra", "papel", "tesoura"]
let emojis = ["🗿", "📄", "✂️"]

function textoDinamico(info) {
  // Utilizado para não repetir .textContent sempre
  textoOpcao.textContent = info.toUpperCase();
}

// Loop para configurar todos os botões
botoesUsuario.forEach((botao) => {
  botao.addEventListener("mouseenter", () => {
    if (mostraSelecao.style.display === "none") return;
    textoDinamico(botao.id);
  });

  botao.addEventListener("mouseleave", () => {
    if (mostraSelecao.style.display === "flex") textoDinamico("...");
  });

  botao.addEventListener("click", () => {
    escolhaUsuario = opcoes.indexOf(botao.id); // Procura na lista a posição do objeto
    btnHumano.textContent = botao.textContent;
    if (mostraSelecao.style.display === "none") {
      voltarAoInicio();
    } else {
      iniciarDisputa();
    }
  });
});

function iniciarDisputa() {
  escolhaTexto.style.display = "none";
  mostraSelecao.style.display = "none";
  mostraDisputa.style.display = "flex";
  batalha(escolhaUsuario, gerarEscolhaComputador());
}

function voltarAoInicio() {
  escolhaTexto.style.display = "inline";
  mostraSelecao.style.display = "flex";
  mostraDisputa.style.display = "none";
  textoOpcao.style.display = "inline";
  textoDinamico("...");
}

function gerarEscolhaComputador() {
  let escolhaComputador = Math.floor(Math.random() * 3); // Gera um número aleatório entre 0 e 2
  btnRobo.textContent = emojis[escolhaComputador]; // Atribui o emoji correto
  return escolhaComputador;
}

function batalha(escolhaHumano, escolhaRobo) {
  let resultado = (escolhaHumano - escolhaRobo + 3) % 3
  // Exemplo:
  // Humano: Tesoura (2) e Robo: Papel (1) = 2 - 1 + 3 = 4 | 4 % 3 = 1 (Vitória Humano)
  if (resultado == 0) textoDinamico("Empate!");
  else if (resultado == 1) textoDinamico("Você venceu!");
  else textoDinamico("Você perdeu...");
}