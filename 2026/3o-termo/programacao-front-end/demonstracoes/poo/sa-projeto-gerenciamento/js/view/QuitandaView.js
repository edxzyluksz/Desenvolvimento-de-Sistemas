export class QuitandaView {
  constructor() {
    // Repositor - CADASTRAR
    this.nomeInput = document.getElementById("repositor-nome");
    this.categoriaInput = document.getElementById("repositor-categoria");
    this.precoInput = document.getElementById("repositor-preco");
    this.quantidadeInput = document.getElementById("repositor-quantidade");
    this.cadastrarBtn = document.getElementById("btn-repositor-cadastrar");

    // Repositor - ATUALIZAR
    this.idAtualizarInput = document.getElementById("repositor-id-atualizar");
    this.precoAtualizarInput = document.getElementById(
      "repositor-preco-atualizar",
    );
    this.quantidadeAtualizarInput = document.getElementById(
      "repositor-quantidade-atualizar",
    );
    this.atualizarBtn = document.getElementById("btn-repositor-atualizar");

    // Caixa
    this.caixaIdInput = document.getElementById("caixa-id");
    this.caixaQuantidadeInput = document.getElementById("caixa-quantidade");
    this.venderBtn = document.getElementById("btn-caixa-vender");

    // Estoquista
    this.btnVerProdutos = document.getElementById("btn-ver-produtos");
    this.btnVerVendas = document.getElementById("btn-ver-vendas");
    this.tituloEstoque = document.getElementById("titulo-estoque");
    this.listaEstoque = document.getElementById("lista-estoque");
    this.tituloVendas = document.getElementById("titulo-vendas");
    this.listaVendas = document.getElementById("lista-vendas");

    // Modal
    this.modalOverlay = document.getElementById("modal-alerta");
    this.modalTitle = document.getElementById("modal-title");
    this.modalMessage = document.getElementById("modal-message");
    this.btnModalOk = document.getElementById("btn-modal-ok");
    this.btnModalClose = document.getElementById("modal-close");
    this.initModalEvents();
  }

  toggleEstoquistaTab(aba) {
    // 1. Verifica se o botão que o usuário clicou JÁ estava ativo antes de mexer em qualquer coisa
    const jaEstavaAtivo =
      aba === "estoque"
        ? this.btnVerProdutos.classList.contains("btn-ativo")
        : this.btnVerVendas.classList.contains("btn-ativo");

    // 2. Reseta tudo (esconde títulos, listas e "levanta" os botões)
    this.tituloEstoque.classList.add("escondido");
    this.listaEstoque.classList.add("escondido");
    this.btnVerProdutos.classList.remove("btn-ativo");

    this.tituloVendas.classList.add("escondido");
    this.listaVendas.classList.add("escondido");
    this.btnVerVendas.classList.remove("btn-ativo");

    // 3. Se a aba já estava ativa, o reset acima já resolveu o problema (fechou tudo).
    // Se NÃO estava ativa, a gente entra no 'if' e mostra a aba correspondente.
    if (!jaEstavaAtivo) {
      if (aba === "estoque") {
        this.tituloEstoque.classList.remove("escondido");
        this.listaEstoque.classList.remove("escondido");
        this.btnVerProdutos.classList.add("btn-ativo");
      } else if (aba === "vendas") {
        this.tituloVendas.classList.remove("escondido");
        this.listaVendas.classList.remove("escondido");
        this.btnVerVendas.classList.add("btn-ativo");
      }
    }
  }

  initModalEvents() {
    const fecharModal = () => this.modalOverlay.classList.add("hidden");

    this.btnModalOk.addEventListener("click", fecharModal);
    this.btnModalClose.addEventListener("click", fecharModal);

    this.modalOverlay.addEventListener("click", (e) => {
      if (e.target === this.modalOverlay) fecharModal();
    });
  }

  showModal(titulo, mensagem, tipo = "aviso") {
    this.modalTitle.textContent = titulo;
    this.modalMessage.textContent = mensagem;

    this.modalTitle.className = "";
    if (tipo === "sucesso") this.modalTitle.classList.add("texto-sucesso");
    if (tipo === "erro") this.modalTitle.classList.add("texto-erro");
    if (tipo === "aviso") this.modalTitle.classList.add("texto-aviso");

    this.modalOverlay.classList.remove("hidden");
  }

  getNewProductValues() {
    return {
      nome: this.nomeInput.value,
      categoria: this.categoriaInput.value,
      preco: parseFloat(this.precoInput.value),
      quantidade: parseInt(this.quantidadeInput.value),
    };
  }

  getUpdateProductValues() {
    return {
      id: parseInt(this.idAtualizarInput.value),
      novoPreco: parseFloat(this.precoAtualizarInput.value), // Pode ser NaN se vazio
      quantidadeAdicional: parseInt(this.quantidadeAtualizarInput.value),
    };
  }

  getSalesValues() {
    return {
      id: parseInt(this.caixaIdInput.value),
      quantidade: parseInt(this.caixaQuantidadeInput.value),
    };
  }

  clearInputs() {
    this.nomeInput.value = "";
    this.categoriaInput.value = "";
    this.precoInput.value = "";
    this.quantidadeInput.value = "";
    this.caixaIdInput.value = "";
    this.caixaQuantidadeInput.value = "";
  }

  renderStock(produtos) {
    this.listaEstoque.innerHTML = "";
    produtos.forEach((produto) => {
      const li = document.createElement("li");
      li.textContent = `[ID: ${produto.id}] ${produto.nome} (${produto.categoria}) - R$ ${produto.preco.toFixed(2)} | Qtd: ${produto.quantidade}`;
      this.listaEstoque.appendChild(li);
    });
  }

  renderSales(vendas) {
    this.listaVendas.innerHTML = "";
    vendas.forEach((venda, index) => {
      const li = document.createElement("li");
      li.textContent = `Venda #${index + 1}: ${venda.quantidade}x ${venda.nome} - Total: R$ ${venda.valor_total.toFixed(2)}`;
      this.listaVendas.appendChild(li);
    });
  }
}
