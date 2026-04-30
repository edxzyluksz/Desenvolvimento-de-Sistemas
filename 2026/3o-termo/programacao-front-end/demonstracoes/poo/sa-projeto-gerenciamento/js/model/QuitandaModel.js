import { Produto } from "../model/ProdutoModel";

export class QuitandaModel {
  produtos = []; // Em objeto
  vendas = [];
  nextId = 1;
  
  addProduct(nomeInput, categoriaInput, precoInput, quantidadeInput) {
    produtoEncontrado = this.produtos.find(p => p.nome.toLowerCase() === nomeInput.toLowerCase())

    if (!produtoEncontrado) {
        produto = new Produto(this.nextId, nomeInput, categoriaInput, precoInput, quantidadeInput);
        this.produtos.push(produto);
        this.nextId++;
    } else {
        produto.entrada(quantidadeInput, precoInput);
    }
  }

  sellProduct(nomeInput, precoInput, quantidadeInput) {
    produtoEncontrado = this.produtos.find(p => p.nome.toLowerCase() === nomeInput.toLowerCase());
    valorTotal = precoInput * quantidadeInput;
    if (produtoEncontrado) {
        if (produtoEncontrado.quantidade > quantidadeInput) {
            produtoEncontrado.venda(quantidadeInput, valorTotal);
            this.produtos.push({"nome": nomeInput, "quantidade": quantidadeInput, "preco_unidade": precoInput, "valor_total": valorTotal});
        }
    }
  }
}
