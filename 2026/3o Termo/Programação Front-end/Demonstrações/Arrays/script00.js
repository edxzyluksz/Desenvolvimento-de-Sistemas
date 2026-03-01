// Declaração de um array

let array = []; // Array Dinâmico

// Tipos de array
let arrayNumerico = [1, 2, 3, 4, 5, 6, 7, 8, 9];
let arrayTexto = ["Sapato", "Chinelo", "Tamanco"];
let arrayMisto = [1, "José", true];

// Tamanho de um array (length)
console.log(arrayNumerico.length); // Retorna 9 (itens)

// Acessar a posição de um array
console.log(arrayTexto[1]); // Acessa a string "Chinelo"

// Adicionar elementos no array
// Push / Unshift

// No final
arrayTexto.push("Tênis");
console.log(arrayTexto);

// No começo
arrayTexto.unshift("Sandália");
console.log(arrayTexto)

// Trocar o valor de um elemento
arrayTexto[2] = "Crocs";
console.log(arrayTexto);
// Substitui-se o elemento da 3ª posição [2] por Crocs

// Remover Elementos (Shift / Pop)

// No começo
arrayTexto.shift();
console.log(arrayTexto);

// Remove do final
arrayTexto.pop();
console.log(arrayTexto);

// Laços de repetição

// Percorrer um array com 'for'
for(let i = 0; i < arrayNumerico.length; i++){
    console.log(`Índice ${i} = ${arrayNumerico[i]}`);
}

// forEach (para cada elemento do array) => Só pode ser usada em um array

arrayMisto.forEach(e => {
    console.log(e)
})

// Métodos úteis de Arrays

// IndexOf
console.log(arrayNumerico.indexOf(5)); // 4
console.log(arrayNumerico.indexOf(10)); // -1 (Não existe)

// Remover Elemento de uma posição

// Splice
arrayMisto.splice(2, 1); // Remove o elemento do índice 2 por uma única vez
console.log(arrayMisto);