export class QuitandaController {
  constructor(model, view) {
    this.model = model;
    this.view = view;
  }

  init() {
    // Repositor
    this.view.cadastrarBtn.addEventListener("click", () =>
      this.handleAddProduct(),
    );
    this.view.atualizarBtn.addEventListener("click", () =>
      this.handleUpdateProduct(),
    );

    // Caixa
    this.view.venderBtn.addEventListener("click", () =>
      this.handleSellProduct(),
    );

    // Estoquista
    this.view.btnVerProdutos.addEventListener("click", () => {
      this.updateStockView();
      this.view.toggleEstoquistaTab("estoque");
    });
    this.view.btnVerVendas.addEventListener("click", () => {
      this.updateSalesView();
      this.view.toggleEstoquistaTab("vendas");
    });
  }

  handleAddProduct() {
    const { nome, categoria, preco, quantidade } =
      this.view.getNewProductValues();

    // TRAVA: Verifica se campos estão vazios, se não são números, e se são menores que zero
    if (
      !nome ||
      !categoria ||
      isNaN(preco) ||
      isNaN(quantidade) ||
      preco < 0 ||
      quantidade < 0
    ) {
      this.view.showModal(
        "Atenção!",
        "Preencha todos os campos corretamente. Preço e Quantidade não podem ser negativos.",
        "aviso",
      );
      return;
    }

    const sucesso = this.model.addProduct(nome, categoria, preco, quantidade);

    if (sucesso) {
      this.view.clearInputs();
      this.updateStockView();
      this.view.showModal(
        "Sucesso!",
        "Novo produto cadastrado no estoque.",
        "sucesso",
      );
    } else {
      this.view.showModal(
        "Erro!",
        "Já existe um produto cadastrado com esse nome.",
        "erro",
      );
    }
  }

  handleUpdateProduct() {
    const { id, novoPreco, quantidadeAdicional } =
      this.view.getUpdateProductValues();

    // TRAVA: Removemos a trava de quantidade < 0. Mantemos apenas a do preço opcional.
    if (
      isNaN(id) ||
      isNaN(quantidadeAdicional) ||
      (!isNaN(novoPreco) && novoPreco < 0)
    ) {
      this.view.showModal(
        "Atenção!",
        "Preencha o ID e a Quantidade a alterar. Valores de preço não podem ser negativos.",
        "aviso",
      );
      return;
    }

    const sucesso = this.model.updateProduct(
      id,
      novoPreco,
      quantidadeAdicional,
    );

    if (sucesso) {
      this.view.clearInputs();
      this.updateStockView();
      this.view.showModal(
        "Sucesso!",
        `Estoque do Produto ID ${id} atualizado.`,
        "sucesso",
      );
    } else {
      this.view.showModal(
        "Erro na Atualização!",
        "ID não encontrado OU a quantidade a remover é maior que o estoque atual.",
        "erro",
      );
    }
  }

  handleSellProduct() {
    const { id, quantidade } = this.view.getSalesValues();

    if (isNaN(id) || isNaN(quantidade) || quantidade <= 0) {
      this.view.showModal(
        "Atenção!",
        "Insira um ID válido e uma quantidade maior que zero.",
        "aviso",
      );
      return;
    }

    const sucesso = this.model.sellProduct(id, quantidade);

    if (sucesso) {
      this.view.clearInputs();
      this.updateStockView();
      this.updateSalesView();
      this.view.showModal(
        "Venda Concluída!",
        "Estoque atualizado automaticamente.",
        "sucesso",
      );
    } else {
      this.view.showModal(
        "Erro na Venda",
        "ID não encontrado ou estoque insuficiente.",
        "erro",
      );
    }
  }

  updateStockView() {
    this.view.renderStock(this.model.produtos);
  }

  updateSalesView() {
    this.view.renderSales(this.model.vendas);
  }
}