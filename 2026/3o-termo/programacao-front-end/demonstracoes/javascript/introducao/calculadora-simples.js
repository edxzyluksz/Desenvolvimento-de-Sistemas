// Calculadora simples em JavaScript usando prompt
const prompt = require("prompt-sync")(); // Import da biblioteca

// Funções de cálculo

// Soma
function soma(a,b) { 
    return (a+b);
}

//Sub
function sub (a,b) {
    return (a-b);
}

// Multi
function multi(a,b) {
    return (a*b);
}

// Div
function div (a,b) {
    return (a/b);
}

// Menu

function menu() {
    let operacao;
    let n1;
    let n2;
    let result;

    console.log(" ----- Calculadora Simples -----");
    console.log("| 1. Soma                  ");
    console.log("| 2. Subtração             ");
    console.log("| 3. Multiplicação         ");
    console.log("| 4. Divisão               ");
    console.log("| 5. Sair                  ");
    console.log("--------------------------------");
    console.log("--- Escolha a operação --- \nDigite aqui:");
    
    operacao = String(prompt()); 

    if (operacao !== "5"){
        if (operacao >= "1" && operacao <= "4") {
            n1 = Number(prompt("Digite o 1º Número\nAqui:"));
            n2 = Number(prompt("Digite o 2º Número\nAqui:"));
        }
    }
    
    // Switch Case
    switch (operacao) {
        case "1":
            result = soma(n1, n2);
            console.log("Resultado da soma: " + result)
            break;
        case "2":
            result = sub(n1, n2);
            console.log("Resultado da subtração: " + result)
            break;
        case "3":
            result = multi(n1,n2);
            console.log("Resultado da multiplicação: " + result)
            break;
        case "4":
            if (n2 == 0) {
                console.log("Não dividirás por zero!!!")
            }
            else {
                result = div(n1, n2);
                console.log("Resultado da divisão: " + result)
            }
            break;
        case "5":
            console.log("Entendido. Saindo!")
            return false;
        default:
            if (operacao != null) {
                console.log("Experimente digitar uma das alternativas acima.")
            }
            break;
    }
    return true;
}

let continuar = true;

while (continuar == true) {
    continuar = menu();
}