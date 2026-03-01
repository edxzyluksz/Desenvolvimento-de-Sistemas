programa {
    funcao inicio() {
        real tanque, dinheiro, valorviagem

        faca {
            escreva("Para viajar, é necessário abastecer.\nDigite o valor do combustível de seu carro: ")
            leia(dinheiro)
            se (dinheiro < 0){
                escreva("\nValor inválido. Confira a sua escrita de dinheiro.\n")
            }
        } enquanto (dinheiro < 0)

        faca {
            escreva("Agora, digite a capacidade total de seu tanque (caso esteja vazio) ou o que falta para encher: ")
            leia(tanque)
            se (tanque < 0) {
                escreva("Valor de tanque inválido. Confira a sua escrita de tanque.\n")
            }
        } enquanto (tanque < 0)

        valorviagem = (dinheiro * tanque)
        escreva("\nPara viajar, você precisará de R$", valorviagem, " para encher o tanque.\n", "Este valor pode não ser o suficiente, mesmo assim.")
    }
}
