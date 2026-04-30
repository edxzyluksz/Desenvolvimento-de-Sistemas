export class Produto {
  constructor() {
        this.id = id;
        this.nome = "";
        this.categoria = "";
        this.preco = 0.0;
        this.quantidade = 0;
  }

  entrada(quantidade, preco) {
        this.quantidade += estoque;
        this.preco = preco;
    }

    venda(quantidade, valorTotal) {
        this.quantidade -= quantidade;
    }
}
