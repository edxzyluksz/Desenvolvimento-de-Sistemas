import { Produto } from "./ProdutoModel.js";

export class QuitandaModel {
  constructor() {
    this.produtos = [];
    this.vendas = [];
    this.nextId = 1;
  }

  addProduct(nomeInput, categoriaInput, precoInput, quantidadeInput) {
    // Validação de segurança na Model
    if (precoInput < 0 || quantidadeInput < 0) return false;

    let produtoEncontrado = this.produtos.find(
      (p) => p.nome.toLowerCase() === nomeInput.toLowerCase(),
    );

    if (produtoEncontrado) {
      return false;
    }

    const produto = new Produto(
      this.nextId,
      nomeInput,
      categoriaInput,
      precoInput,
      quantidadeInput,
    );
    this.produtos.push(produto);
    this.nextId++;
    return true;
  }

  updateProduct(idInput, precoInput, quantidadeAdicional) {
    let produtoEncontrado = this.produtos.find((p) => p.id === idInput);

    if (!produtoEncontrado) {
      return false; // ID não existe
    }

    // TRAVA INTELIGENTE: Verifica se a remoção vai deixar o estoque negativo
    if (produtoEncontrado.quantidade + quantidadeAdicional < 0) {
      return false; // Não permite tirar mais do que tem na prateleira
    }

    const novoPreco = isNaN(precoInput) ? produtoEncontrado.preco : precoInput;

    if (novoPreco < 0) return false;

    // O método entrada() da classe Produto faz: this.quantidade += quantidade
    // Logo, se for -5, ele fará: quantidade += -5 (que é uma subtração exata)
    produtoEncontrado.entrada(quantidadeAdicional, novoPreco);
    return true;
  }

  sellProduct(idInput, quantidadeInput) {
    // Busca agora é feita pelo ID numérico
    let produtoEncontrado = this.produtos.find((p) => p.id === idInput);

    if (produtoEncontrado && produtoEncontrado.quantidade >= quantidadeInput) {
      // O método venda() dentro da classe Produto subtrai automaticamente: this.quantidade -= quantidade
      produtoEncontrado.venda(quantidadeInput);

      const valorTotal = produtoEncontrado.preco * quantidadeInput;

      this.vendas.push({
        nome: produtoEncontrado.nome, // Guardamos o nome para o histórico ficar legível
        quantidade: quantidadeInput,
        preco_unidade: produtoEncontrado.preco,
        valor_total: valorTotal,
      });
      return true;
    }
    return false; // Falha se ID não existir ou estoque insuficiente
  }
}
