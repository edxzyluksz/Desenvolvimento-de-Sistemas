// Estrutura de dados

// Condicionais (If Else // Switch Case)

// IF - ELSE

var precoProduto = 150;
// se preço do produto >= 100 - desconto de 10%
if (precoProduto >= 100) {
  console.log("Valor a pagar: " + (precoProduto*0.9));
} else {
    console.log("Valor a pagar: " + (precoProduto))
}

// condicional intermediária (else if)
// preço > 200 - 15% dec // preço > 100 - 10% desc //

if (precoProduto > 200) {
    console.log("Valor a pagar: " + (precoProduto * 0.85));
} else if (precoProduto > 100) { 
    console.log("Valor a pagar: " + (precoProduto * 0.85));
} else {
    console.log("Valor a pagar: " + precoProduto);
}

// Switch Case
var mes = 4;
switch(mes) {
    case 1:
        console.log("Janeiro");
        break;
    case 2:
        console.log("Fevereiro");
        break;
    case 3:    
        console.log("Março");
        break;
    case 4:    
        console.log("Abril");
        break;
    case 5:
        console.log("Maio");
        break;
    case 6:
        console.log("Junho");
        break;
    case 7:   
        console.log("Julho");
        break;
    case 8:    
        console.log("Agosto");
        break;
    case 9:
        console.log("Setembro");
        break;
    default:
        console.log("Final de ano");
        break;
}

// Estrutura de repetição (For e While)

// For (Incontáveis)
for(let i = 0; i <= 100; i++) {
    console.log("Contagem:" + i)
}

// While (Incontáveis)
var continuar = true;
var numEscolhido = 3;
var contador = 0;

while(continuar) {
    contador++
    let numeroSorteado = Math.round(Math.random() * 10);
    console.log(numeroSorteado)
    if (numeroSorteado == numEscolhido){
        continuar = false;
        console.log("Acertou miseravi");
        console.log("Tentativas = " + contador)
    }
}

// Explicando o Math
// Random ( sortear um numero entre 0 e 1)
// Exemplo: 0.954321 / 0.23456 / 0.65432
// Math Round - Arredonda para o número, transformando-o em inteiro.

// Funções (function)
// Ações específicas - podem ser chamadas a qualquer momento dentro do código

function ola (nome) { // Função com retorno
    return `Olá, ${nome}`
}

function hello (nome) { // function void
    console.log(`Hello, ${nome}`)
}

// Chamando as functions
console.log(ola("Diogo"))

hello("Diogo")