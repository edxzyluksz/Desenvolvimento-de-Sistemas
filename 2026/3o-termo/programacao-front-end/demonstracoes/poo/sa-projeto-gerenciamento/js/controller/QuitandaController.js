export class QuitandaController {

  constructor(model, productModel, view) {
    this.model = model;
    this.view = view;
  }

  init() {
    this.view.cadastrarBtn.addEventListener("click", () => this.addProduto());
    this.view.renderStock(
        this.model.produtos
    )
    this.view.renderSales(
       this.model.vendas
    )
  }

  handleAddProduct() {
    const nome = this.view.getStockValues().nome;
    const categoria = this.view.getStockValues().categoria;
    const preco = this.view.getStockValues().preco;
    const quantidade = this.getStockValues().quantidade;
    this.view.clearInputs();
    this.model.addProduct(nome, categoria, preco, quantidade)
  }

  handleSellProduct() {

  }

  handleUpdateStock() {
    this.productModel.ve
  }

  handleUpdateSales() {

  }

  updateView() {
    this.view.renderStock(this.model.produtos)
    this.view.renderSales(this.model.vendas)
  }
}