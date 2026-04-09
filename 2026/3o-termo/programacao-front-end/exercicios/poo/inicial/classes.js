class Produto {
    #nome
    #preco
    #estoque

    constructor(nome, preco, estoque){
        this.#nome = nome
        this.#preco = preco
        this.#estoque = estoque
    }

    getNome(){
        return this.#nome
    }

    getPreco(){
        return this.#preco
    }

    getEstoque(){
        return this.#estoque
    }

    setNome(nome){
        this.#nome = nome
    }

    setPreco(preco){
        this.#preco = preco
    }

    setEstoque(estoque) {
        this.#estoque = estoque
    }

    vender(reduzido){
        if (this.#estoque - reduzido < 0){
            console.log("Impossível reduzir: Valor resulta em negativo.");
        }
        this.#estoque -= reduzido
    }

    repor(aumentado) {
        this.#estoque += aumentado
    }

    exibirInfo(){
        console.log(
            `
            Nome: ${this.getNome()}
            Preço: ${this.getPreco()}
            Estoque: ${this.getEstoque()}
            `
        )
    }
}

class Veiculo {
    #marca
    #ano
    #modelo

    constructor(marca, ano, modelo){
        this.#marca = marca
        this.#ano = ano
        this.#modelo = modelo
    }

    getMarca(){
        return this.#marca
    }

    getAno(){
        return this.#ano
    }
    
    getModelo(){
        return this.#modelo
    }

    setMarca(marca){
        this.#marca = marca
    }

    setAno(ano){
        this.#ano = ano
    }

    setModelo(modelo) {
        this.#modelo = modelo
    }

    exibirInfo(){
        console.log(
            `
            Marca: ${this.getMarca()}
            Ano: ${this.getAno()}
            Modelo: ${this.getModelo()}
            `
        )
    }
}

class Carro extends Veiculo {
    #quantidadePortas

    constructor(marca, ano, modelo, quantidadePortas){
        super(marca, ano, modelo)
        this.#quantidadePortas = quantidadePortas
    }

    getQtdPortas(){
        return this.#quantidadePortas
    }

    setQtdPortas(portas){
        this.#quantidadePortas = portas
    }

    exibirInfo(){
        super.exibirInfo()
        console.log(`Qtd de Portas: ${this.getQtdPortas()} `)
    }
}

class ContaBancaria {
    #titular
    #saldo

    constructor(titular, saldo){
        this.#titular = titular
        this.#saldo = saldo
    }

    getTitular(){
        return this.#titular
    }

    getSaldo(){
        return this.#saldo
    }

    depositar(saldo) {
        this.#saldo += saldo
    }

    saca(saldo) {
        if (this.#saldo - saldo < 0){
            console.log("Impossível reduzir: Valor resulta em negativo.");
        }
        this.#saldo -= saldo
    }

    exibirConta(){
        console.log(
            `
            Titular: ${this.getTitular()}
            Saldo: ${this.getSaldo()}
            `
        )
    }
}

class Funcionario {
    #nome
    #salario
    #cargo

    constructor(nome, salario, cargo){
        this.#nome = nome
        this.#salario = salario
        this.#cargo = cargo
    }

    getNome(){
        return this.#nome
    }

    getSalario(){
        return this.#salario
    }

    getCargo(){
        return this.#cargo
    }

    setNome(nome){
        this.#nome = nome
    }

    alterarSalario(porcentagem){
        this.#salario *= (1 + porcentagem / 100);
    }

    exibirInfo(){
        console.log(
            `
            Funcionário: ${this.getNome()}
            Salário: ${this.getSalario()}
            `
        )
    }
}