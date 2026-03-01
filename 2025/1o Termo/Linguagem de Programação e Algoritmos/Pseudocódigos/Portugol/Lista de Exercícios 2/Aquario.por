programa {
    funcao inicio() {
        inteiro densidade_peixes, quantidade_peixes
        real tamanho_tanque

        escreva("Informe o tamanho do tanque em m³\n")
        leia(tamanho_tanque)
        escreva("Informe a densidade de cada peixe que será alocado em unidades/m³\n")
        leia(densidade_peixes)

        quantidade_peixes = tamanho_tanque / densidade_peixes
        escreva("A quantidade de peixes que poderá ser alocada num tanque de ", tamanho_tanque, " litros, é ", quantidade_peixes, " unidades")
    }
}
