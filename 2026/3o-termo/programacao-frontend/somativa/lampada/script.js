const ligar = document.getElementById("ligar");
const desligar = document.getElementById("desligar");
const quebrar = document.getElementById("quebrar");
const trocar = document.getElementById("trocar");
let opcoes = [ligar, desligar, quebrar, trocar];

const lampada = document.getElementById("lampada");

let quebrada = false; 

function ligarLampada() {
  if (!quebrada) {
    lampada.src = "img/lampada-acesa.png";
    lampada.alt = "Lâmpada Acesa";
  }
}

function desligarLampada() {
  if (!quebrada) {
    lampada.src = "img/lampada-apagada.png";
    lampada.alt = "Lâmpada Apagada";
  }
}

ligar.addEventListener("click", ligarLampada);
desligar.addEventListener("click", desligarLampada);

quebrar.addEventListener("click", function () {
  lampada.src = "img/lampada-quebrada.png";
  lampada.alt = "Lâmpada Quebrada";
  lampada.classList.add("lampada-quebrada");
  opcoes.forEach(botao => {
      if (botao !== trocar){
        botao.style.display = "none";
      }
  });
  quebrada = true; 
});

trocar.addEventListener("click", function () {
  lampada.src = "img/lampada-apagada.png";
  lampada.alt = "Lâmpada Apagada";
  lampada.classList.remove("lampada-quebrada");
  opcoes.forEach(botao => {
    botao.style.display = "inline-block";
  });
  quebrada = false; 
});
