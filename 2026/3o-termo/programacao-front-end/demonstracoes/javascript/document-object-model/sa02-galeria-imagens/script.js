// Galeria de imagens dinâmicas com DOM

const uploadURL = document.getElementById("upload");
const btnEnviar = document.getElementById("addImagem");
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
  galeria.innerHTML = ""; // Limpar a galeria de imagens
  // adicionar todas as imagens na galeria
  imagens.forEach((imagem, index) => {
    let div = document.createElement("div");
    div.classList.add("imagemContainer");
    let img = document.createElement("img");
    img.src = imagem;
    img.classList.add("img-galeria");
    let btnRemove = document.createElement("button");
    btnRemove.innerText = "X";
    btnRemove.classList.add("remove");
    btnRemove.addEventListener("click", () => {
      imagens.splice(index, 1); // Remove a imagem do vetor
      atualizaGaleria(); // Recursão
      atualizaCarrossel();
    });

    //appendChild
    div.appendChild(img);
    div.appendChild(btnRemove);
    galeria.appendChild(div);
  });
}

function atualizaCarrossel() {
  carrossel.innerHTML = ""; // Limpar o Carrossel
  // Refazer o carrossel com as imagens do vetor
  imagens.forEach((imagem) => {
    let img = document.createElement("img");
    img.src = imagem;
    img.classList.add("img-carrossel");
    carrossel.appendChild(img);
  });
  carrossel.style.width = `${imagens.length * 100}%`; // O numero de imagens vai determinar o tamanho
  iniciarCarrossel(); // Função para iniciar o rodízio do carrossel
}

let intervalo;

function iniciarCarrossel() {
  let index = 0;

  clearInterval(intervalo); // 🔥 MUITO IMPORTANTE

  intervalo = setInterval(() => {
    if (imagens.length === 0) return;

    index = (index + 1) % imagens.length;
    carrossel.style.transition = `transform 0.5s ease-in-out`;
    carrossel.style.transform = `translateX(-${(index * 100) / imagens.length}%)`; //quantidade de tela que sera rotacionada
  }, 2000);
}