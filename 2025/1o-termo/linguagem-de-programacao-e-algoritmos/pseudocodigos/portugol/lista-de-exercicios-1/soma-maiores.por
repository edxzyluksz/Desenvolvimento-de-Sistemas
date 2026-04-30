programa {
    funcao inicio() {
        inteiro numero1, numero2, numero3, valorsoma
        // Eu reciclei o código... Isso é normal em programação, certo?

        escreva("Digite 3 números:\n", "1- ")
        leia(numero1)

        escreva("2- ")
        faca {
            leia(numero2)
            se (numero2 == numero1) {
                escreva("Os números não podem ser iguais.\n\n", "2- ")
            }
        } enquanto (numero2 == numero1)

        escreva("3- ")
        faca {
            leia(numero3)
            se (numero3 == numero1 ou numero3 == numero2) {
                escreva("Os números não podem ser iguais.\n\n", "3- ")
            }
        } enquanto (numero3 == numero1 ou numero3 == numero2)

        se (numero1 > numero2 e numero1 > numero3) {
            se (numero2 > numero3) {
                valorsoma = numero1 + numero2
            } senao {
                valorsoma = numero1 + numero3
            }
        }
        senao se (numero2 > numero1 e numero2 > numero3) {
            se (numero1 > numero3) {
                valorsoma = numero2 + numero1
            } senao {
                valorsoma = numero2 + numero3
            }
        }
        senao {
            se (numero1 > numero2) {
                valorsoma = numero3 + numero1
            } senao {
                valorsoma = numero3 + numero2
            }
        }

        escreva("\nA soma dos dois maiores números é: ", valorsoma, "\n")
    }
}
