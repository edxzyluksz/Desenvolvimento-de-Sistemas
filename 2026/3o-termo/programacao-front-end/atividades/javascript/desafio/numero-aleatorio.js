// Desafio
// Criar um jogo de um Nº aleatório
const prompt = require("prompt-sync")();
let jornadaUser = 1;
let qtdeTentativas = 1;

console.log("DESAFIO!!!")
console.log("Você adivinhará o número gerado pelo computador... Para... Nenhum propósito aparente. De 0 a 100, pra variar.")

while (true) {
    console.log(`--- SESSÃO ${jornadaUser} ---`)

    qtdeTentativas = 1;
    let sorteado = Math.round(Math.random() * 100)
    
    console.log("Pense sobre isso...\nDigite: ")
    let digitado = Number(prompt());

    if (Number.isNaN(digitado)){
        console.log("Somente números, por favor.")
        continue;
    }

    if (digitado > 100 || digitado < 0) {
        console.log("Perdão, mas o permitido é entre 0 e 100. Vou desconsiderar essa pra você.")
        continue;
    }

    if (digitado > sorteado){
        console.log("Pense menor, por favor...");
        qtdeTentativas++
        continue;
    }
    else if (digitado < sorteado) {
        console.log("Vamos lá! Pense maior que isso!");
        qtdeTentativas++
        continue;
    }
    else {
        console.log(`Meus parabéns! O número era realmente '${sorteado}'.`);
    }

    console.log("\nMeu caro amigo, deseja continuar? | 1 - Sim / 2 - Não")
    option = prompt("Digite aqui: ")
    if (option === "1") {
        console.log("Vamos lá!\n");
        jornadaUser++
        continue;
    }
    else {
        break;
    }
}

console.log(`Ora ora... Você demorou ${qtdeTentativas} tentativas.`)

