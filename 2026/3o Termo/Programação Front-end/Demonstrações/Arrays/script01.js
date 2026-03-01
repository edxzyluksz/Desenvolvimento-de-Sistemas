// Operações Avançadas com Array

let valores = [10,20,30,40,50];

// map -> Criação de Novos Valores de um Array
let valoresDobro = valores.map(x => x * 2);
console.log(valoresDobro)

// filter -> filtragem de dados de um array
let valoresFilter = valores.filter(x => x > 25);
console.log(valoresFilter);

// reduce -> transforma um array em variável simples
let soma = valores.reduce((soma, e) => soma + e);
console.log(soma); // 150

// sort -> ordenação de array
let aleatorio = [7,4,2,9,1,5,8,6,3];
console.log(aleatorio);

let ordenado = aleatorio.sort();
console.log(ordenado)

