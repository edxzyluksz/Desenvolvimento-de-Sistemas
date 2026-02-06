// Calculadora simples em JavaScript usando prompt
var prompt = require("prompt-sync") // Import da biblioteca

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
    let o;
    let n1;
    let n2;
    let result;
    console.log("=== Calculadora Simples ===")
    console.log("| 1. Soma                  ")
    console.log("| 2. Subtração             ")
    console.log("| 3. Multiplicação         ")
    console.log("| 4. Divisão               ")
    console.log("===========================")
    console.log("=== Escolha a operação  ===")
}