export class QuitandaView {

    constructor(){
        this.cadastros = [
            this.nomeInput = document.getElementById("nome"),
            this.categoriaInput = document.getElementById("categoria"),
            this.precoInput = document.getElementById("preco"),
            this.quantidadeInput = document.getElementById("quantidade")
        ]
        this.cadastrarBtn = document.getElementById("cadastrar");
        this.estoque = document.getElementById("estoque");
    }

    getStockValues(){
        return {
            nome: this.nomeInput.value,
            categoria: this.categoriaInput,
            preco: parseFloat(this.precoInput.value),
            quantidade: parseInt(this.quantidadeInput.value)
        };
    }

    clearInputs(){
        this.cadastros.forEach(input => {
            input.value = "";
        })
    }

    renderStock(produtos){
        produtos.forEach(produto => {
            const item = document.createElement("item")
            this.estoque.appendChild(li)
            const btnVender = document.createElement("button")
            btnVender.textContent = "Vender"
        });
    }

    renderSales(vendas){
        vendas.forEach((venda) => {
          const item = document.createElement("item");
          this.vendas.appendChild(li);
        });
    }
}