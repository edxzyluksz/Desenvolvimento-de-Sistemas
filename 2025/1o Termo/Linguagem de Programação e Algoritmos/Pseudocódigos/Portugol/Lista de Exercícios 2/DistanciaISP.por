programa {
    funcao inicio() {
        real dist, dist_kilo

        escreva("Informe a distância da sua casa ao ISP (fornecedor da sua internet) em metros: ")
        leia(dist)

        dist_kilo = dist / 1000
        escreva("A distância é de ", dist_kilo, " quilômetros")
    }
}
