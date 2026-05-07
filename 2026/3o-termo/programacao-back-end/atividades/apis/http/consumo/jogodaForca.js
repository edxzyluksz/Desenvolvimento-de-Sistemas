const prompt = require("prompt-sync")();

async function jogoForca() {
    console.log("==== Jogo da Forca ====\n");
    
    let chances = 5;
    let letrasTentadas = [];
    
    const resposta = await fetch("https://api.dicionario-aberto.net/random");
    const dados = await resposta.json();
    
    let palavraSorteada = dados.word;
    palavraSorteada = palavraSorteada[0].toUpperCase() + palavraSorteada.slice(1);

    function removeAcentos(str) { // prompt-sync não lida com UTF-8
        return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
    }

    let palavraOculta = Array(palavraSorteada.length).fill("_");
    let palavraNormalizada = removeAcentos(palavraSorteada.toLowerCase());

    //console.log(palavraSorteada, "\n");

    let i = 0;

    while (i < palavraSorteada.length) i++;

    
    while (chances > 0) {
        let ganhou = verificaVitoria(palavraOculta);
        
        if (ganhou) {
            console.log("\n=== PARABÉNS! VOCÊ VENCEU! ===\n")
            break;
        }

        console.log("\nLetras tentadas:", letrasTentadas.join(", "));
        console.log("\nPalavra:", palavraOculta.join(" "));
        let letraChute = prompt("Digite uma letra da palavra: ");
        let letraNormalizada = removeAcentos(letraChute.toLowerCase());
        
        let validaLetra = validacaoLetra(letraNormalizada, letrasTentadas);
        
        if (!validaLetra) continue
        
        letrasTentadas.push(letraChute.toUpperCase());
        
        if (palavraNormalizada.includes(letraNormalizada)) {
            console.log("Parabéns, você acertou uma letra!")

            for (let j = 0; j < palavraSorteada.length; j++) {
                if (removeAcentos(palavraSorteada[j].toLowerCase()) === letraNormalizada) {
                    palavraOculta[j] = palavraSorteada[j];
                }
            }

        } else {
            chances--
            console.log("Esta letra não existe na palavra!")
            console.log(`Chances restantes: ${chances}`)
        }

    }

    while (true) {
        console.log("\n=== JOGO ENCERRADO! ===\n")
        console.log("A palavra era:", palavraSorteada)
        console.log("Estas foram suas letras tentadas:", letrasTentadas.join(", "));
        console.log("Deseja continuar? [1] - Sim | [2] - Não");

        let escolha = prompt("R: " ).toUpperCase();
    
        if (escolha !== "1" && escolha !== "2") {
            console.log("\nEscolha uma das opções apresentadas!")
            continue
        }

        if (escolha === "1") {
            letrasTentadas = [];
            return jogoForca();
        } else if (escolha === "2") {
            console.log("Obrigado por jogar!");
            return;
        }
    }
}

function validacaoLetra(letra, letrasTentadas) {

    if (!isNaN(Number(letra))) {
        console.log("\nDigite somente letras, não números!");
        return false;
    }

    if (letra.length > 1) {
        console.log("\nDigite somente uma letra!");
        return false;
    }

    if (letrasTentadas.includes(letra.toUpperCase())) {
        console.log("\nVocê já tentou essa letra!");
        return false;
    }

    return true;
}

function verificaVitoria(palavraArray) {
    for (let i = 0; i < palavraArray.length; i++)
        if (palavraArray[i] === "_") return false;
    return true;
}

jogoForca();