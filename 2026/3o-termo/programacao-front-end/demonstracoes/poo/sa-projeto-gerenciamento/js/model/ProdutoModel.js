export class Produto {
  constructor(id, nome, categoria, preco, quantidade) {
    this.id = id;
    this.nome = nome;
    this.categoria = categoria;
    this.preco = parseFloat(preco);
    this.quantidade = parseInt(quantidade);
  }

  entrada(quantidade, preco) {
    this.quantidade += parseInt(quantidade);
    this.preco = parseFloat(preco); // Atualiza o preço caso tenha mudado
  }

  venda(quantidade) {
    this.quantidade -= parseInt(quantidade);
  }
}