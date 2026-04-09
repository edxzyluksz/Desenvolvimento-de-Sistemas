# Exercícios de POO

## Atividade 1: Criar uma classe representando um produto

Crie uma classe Produto com os atributos:
- nome
- preco
- estoque

E métodos:
- vender(quantidade): reduz o estoque
- repor(quantidade): aumenta o estoque
- exibirInfo(): mostra detalhes do produto

## Atividade 2: Criar uma classe representando um veículo

Crie uma classe Veiculo com os seguintes atributos:
- marca
- modelo
- ano

E métodos:
- exibirInfo(): exibe os detalhes do veículo.

Crie uma subclasse Carro, que herda de Veiculo e adiciona:
quantidadePortas

Método exibirInfo(), sobrescrevendo o da classe pai para incluir as portas.

## Atividade 3: Criar uma classe representando uma conta bancária

Crie uma classe ContaBancaria com os atributos:
- titular
- saldo

E métodos:
- depositar(valor): adiciona saldo.
- sacar(valor): remove saldo se houver saldo suficiente.
- exibirSaldo(): exibe o saldo atual.

## Atividade 4: Criar um sistema de funcionários
Crie uma classe Funcionario com os atributos:
- nome
- salario
- cargo

E métodos:
- aumentarSalario(percentual): aumenta o salário com base no percentual passado.
- exibirInfo(): exibe os detalhes do funcionário.