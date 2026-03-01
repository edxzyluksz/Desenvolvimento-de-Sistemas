programa {
    funcao inicio() {

        inteiro quantidade_casas
        real largura_casas, comprimento_casas, area_casas, tamanho_terreno

        escreva("Quantas casas terão no terreno?\n")
        leia(quantidade_casas)
        escreva("Qual a largura das casas?\n")
        leia(largura_casas)
        escreva("Qual o comprimento das casas?\n")
        leia(comprimento_casas)

        area_casas = largura_casas * comprimento_casas
        tamanho_terreno = area_casas * quantidade_casas

        escreva("A área do terreno que deverá ser utilizada para a construção de ", quantidade_casas, " casas é de ", tamanho_terreno, " m²")
    }
}
