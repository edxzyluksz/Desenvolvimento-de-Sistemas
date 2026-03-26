// Galeria de imagens dinâmicas com DOM

const uploadURL = document.getElementById("upload");
const btnEnviar = document.getElementById("btnEnviar");
const galeria = document.querySelector(".galeria");
let carrossel = document.querySelector(".carrossel");

// Vetor para as imagens
let imagens = [];

// Adicionar imagens no vetor

btnEnviar.addEventListener("click", () => {
  let imagemURL = uploadURL.value.trim(); // Pega o endereço da imagem
  if (imagemURL === "") return; // Se a condição for verdadeira interrompe o código
  imagens.push(imagemURL);
  atualizaGaleria(); // Atualiza a imagem na galeria
  atualizaCarrossel(); // Atualiza a imagem no carrossel
  uploadURL.value = ""; // Limpa o campo do input
});

function atualizaGaleria() {
    let novaImagem = document.createElement("img")
}

function atualizaCarrossel() {

}