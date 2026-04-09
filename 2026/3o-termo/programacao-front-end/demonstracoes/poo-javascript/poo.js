// Estudo de POO em JavaScript
// Diferença entre Procedural e POO

// Declaração de uma variável em procedural
let produto1 = {
    nome: "Impressora",
    preco: 1000,
    marca: "Epson",
    disponivel: true,
    desconto: function (){
        return this.preco * 0.1 // Desconto de 10% no preço
    }
}

let produto2 = {
    nome: "Mouse",
    preco: 100,
    marca: "Elgin",
    disponivel: false,
    desconto: function(){
        return this.preco * 0.2 // 20% de Desconto
    }
}

// Imprimir as informações do produto

console.log(`
    Produto: ${produto1.nome},
    Preço: ${produto1.preco},
    Marca: ${produto1.marca},
    Disponível: ${produto1.disponivel ? "Sim" : "Não"},
    Desconto: ${produto1.disponivel ? produto1.desconto : ""}
    `
);

class Produto {
    // Atributos
    nome;
    preco;
    marca;
    disponivel;

    // Métodos
    
    // Construtor
    // no JS o construyor não tem o nome da classe, chamando apenas constructor
    constructor(nome, preco, marca, disponibilidade) {
        this.nome = nome
        this.preco = preco
        this.marca = marca
        this.disponivel = disponibilidade
    }

    // Método para aplicar o desconto
    desconto(){
        return this.preco * 0.1
    }

    // Mostrar as informações e printar
    toString() {
        return `Produto: ${this.nome},
                Preço: ${this.preco},
                Marca: ${this.marca},
                Disponível: ${this.disponivel ? "Sim" : "Não"},
                Desconto: ${this.disponivel ? this.desconto() : ""}`
    }
}

// Declarar os objetos

let p1 = new Produto("Headset", 200, "Dragon", true)
let p2 = new Produto("Microfone", 600, "Razer", false);

console.log(p1.toString())
console.log(p2.toString())