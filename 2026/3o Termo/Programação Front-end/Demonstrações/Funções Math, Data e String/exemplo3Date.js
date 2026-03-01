// Funções de Data e Hora
const agora = new Date();

// Imprime a data atual
console.log(agora)

// Imprime a hora em formato de string
console.log(agora.toDateString());

// Imprime a data em formato local
console.log(agora.toLocaleDateString());

// Getters
console.log(agora.getFullYear);

let data1 = new Date("2026-02-10")
let data2 = new Date("2026-12-18")

let diferenca = data2 - data1;

console.log(diferenca/1000*60*60*24); // Milissegundos | Segundos | Minutos | Horas