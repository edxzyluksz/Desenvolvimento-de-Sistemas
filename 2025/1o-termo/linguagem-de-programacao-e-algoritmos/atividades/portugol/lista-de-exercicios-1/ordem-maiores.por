programa {
    funcao inicio() {
        inteiro numero1, numero2, numero3

        escreva("Digite 3 números:\n", "1- ")
        leia(numero1)

        escreva("2- ")
        faca {
            leia(numero2)
            se (numero2 == numero1) {
                escreva("Os números não podem ser iguais.\n", "2- ")
            }
        } enquanto (numero2 == numero1)

        escreva("3- ")
        faca {
            leia(numero3)
            se (numero3 == numero1 ou numero3 == numero2) {
                escreva("Os números não podem ser iguais.\n", "3- ")
            }
        } enquanto (numero3 == numero1 ou numero3 == numero2)

        se (numero1 > numero2 e numero1 > numero3) {
            se (numero2 > numero3) {
                escreva("A ordem crescente é: ", numero3, " ", numero2, " ", numero1)
            }
            senao {
                escreva("A ordem crescente é: ", numero2, " ", numero3, " ", numero1)
            }
        }
        senao se (numero2 > numero1 e numero2 > numero3) {
            se (numero3 > numero1) {
                escreva("A ordem crescente é: ", numero1, " ", numero3, " ", numero2)
            }
            senao {
                escreva("A ordem crescente é: ", numero3, " ", numero1, " ", numero2)
            }
        }
        senao {
            se (numero1 > numero2) {
                escreva("A ordem crescente é: ", numero2, " ", numero1, " ", numero3)
            }
            senao {
                escreva("A ordem crescente é: ", numero1, " ", numero2, " ", numero3)
            }
        }
    }
}
