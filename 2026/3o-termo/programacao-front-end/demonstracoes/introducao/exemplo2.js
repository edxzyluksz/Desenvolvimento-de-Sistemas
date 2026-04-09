//Tipos de operadores

// Operadores Aritméticos (+ - * / %)
var a = 10;
var b = 3;
var c;
//soma
c = a + b;
console.log("Soma: " + c);

// Subtração
c = a - b
console.log("Subtração: " + c)


// Multplicação
c = a * b
console.log("Multiplicação: " + c)


// Divisão
c = a / b
console.log("Divisão: " + c)

// Resto da divisão
c = a % b 
console.log("Divisão: " + c)

//Operadores Relacionais(> < >= <= == === != !==)
var a = 10;
var b = 20;
var c = "20";

console.log("Relacionais: "+(a>b)); // false
//o que importa
console.log("Igualdade Simples: "+(b==c))// true
console.log("Igualdade Estrita: "+(b===c))// false

// Operadores Lógicos ( && - E , || - OU , ! - Não)
var nota1 = 5;
var nota2 = 8;

console.log("Aprovação: " + nota1>7 && nota2>7); // false
console.log("Aprovação: " + nota1>7 || nota2>7); // true
console.log("Negação: " + !true); // false