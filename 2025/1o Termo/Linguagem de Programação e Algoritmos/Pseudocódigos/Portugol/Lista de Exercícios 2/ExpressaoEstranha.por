programa {
    inclua biblioteca Matematica

    funcao inicio() {
        real resultado, a, b, c

        escreva("Digite o valor de A: ")
        leia(a)
        escreva("Digite o valor de B: ")
        leia(b)
        escreva("Digite o valor de C: ")
        leia(c)

        resultado = ((m.potencia(a, 2.0) + m.potencia(b, 3.0) + m.potencia(c, 4.0)) / 9.0) + 1

        se (resultado >= 0 e resultado <= 10) {
            escreva("Expressão é 10%")
        } senao se (resultado >= 11 e resultado <= 20) {
            escreva("Expressão é 20%")
        } senao se (resultado >= 21 e resultado <= 50) {
            escreva("Expressão é 50%")
        } senao se (resultado >= 51 e resultado <= 75) {
            escreva("Expressão é 75%")
        } senao se (resultado > 75) {
            escreva("Expressão é ESTRANHA")
        }
    }
}
