programa {
    funcao inicio() {
        inteiro numero1, numero2, numero3

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
            escreva("Seu primeiro número é o maior (", numero1, ")")
        }
        senao se (numero2 > numero1 e numero2 > numero3) {
            escreva("Seu segundo número é o maior (", numero2, ")")
        }
        senao {
            escreva("Seu terceiro número é o maior (", numero3, ")")
        }
    }
}
