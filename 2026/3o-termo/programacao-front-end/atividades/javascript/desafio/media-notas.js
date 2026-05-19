const prompt = require("prompt-sync")(); // Entrada de dados via Node.js
console.log("Calculadora de média!!!");

console.log("Escreva as notas:");
let nota1 = Number(prompt());
let nota2 = Number(prompt());
let nota3 = Number(prompt());
let nota4 = Number(prompt());

let listaNotas = [nota1, nota2, nota3, nota4];
console.log(listaNotas);

let media = listaNotas.reduce((total, nota) => total + nota, 0) / listaNotas.length;

console.log("A média resultante das notas é " + media)