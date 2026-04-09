// Estudos Avançados de POO em JS

//Criação de uma Classe

class _Pessoa{ // Classe teoricamente abstrata (somente funciona em TypeScript)
    //atributos Privado (encapsulamento)
    #nome;
    #idade;
    #cpf;

    //constructor
    constructor(nome, idade, cpf){
        this.#nome = nome;
        this.#idade = idade;
        this.#cpf = cpf;
    }

    // getters and ters publics
    getNome(){ //pegam o valor do atributo privado
        return this.#nome;
    }

    getIdade(){
        return this.#idade;
    }

    getCpf(){
        return this.#cpf;
    }

    setNome(nome){
        this.#nome = nome;
    }

    setIdade(idade){
        this.#idade = idade;
    }

    setCpf(cpf){
        this.#cpf = cpf
    }

    //método de Acesso
    exibirInfo(){
        console.log(
            `Nome: ${this.#nome}\nIdade: ${this.#idade}\nCPF: ${this.#cpf}`
        );
    }
}

//Instanciar Obj de Pessoas
let pessoa1 = new _Pessoa("João", 25, "123.456.789-00");
let pessoa2 = new _Pessoa("Maria", 30, "987.654.321-00")

pessoa1.exibirInfo()
pessoa2.exibirInfo()

// Alterar a idade da pessoa1

pessoa1.setIdade(26);
pessoa1.exibirInfo();

class Funcionario extends _Pessoa {
    // Funcionário herda as características de Pessoa
    // Novos atributos para funcionário
    #cargo;
    #salario;

    // Construtor
    constructor(nome, idade, cpf, cargo, salario) {
        super(nome, idade, cpf) // Chama os atributos da superclasse
        this.#cargo = cargo;
        this.#salario = salario;
    }

    getCargo() {
        return this.#cargo
    }
    
    getSalario() {
        return this.salario
    }

    setCargo(cargo){
        this.#cargo = cargo
    }

    setSalario(novoSalario){
        this.#salario = novoSalario
    }

    // Método de acesso
    exibirInfo(){ // Polimorfismo
        super.exibirInfo();
        console.log(`Cargo: ${this.#cargo}\nSalario: ${this.#salario}`)
    }
}

// Instanciar um objeto de Funcionário

let funcionario1 = new Funcionario("Pedro", 27, "321.654.987-00", "Motorista", 3500)

funcionario1.exibirInfo();
funcionario1.setSalario(4000);
funcionario1.exibirInfo()