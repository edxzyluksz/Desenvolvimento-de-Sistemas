programa {
    funcao inicio() {
        real temperatura, valor
        inteiro medida, conversao

        escreva("Digite 1 para usar Celsius ou 0 para Fahrenheit: ")
        leia(medida)
        enquanto (medida != 0 e medida != 1) {
            escreva("Opção inválida! Digite 1 para Celsius ou 0 para Fahrenheit: ")
            leia(medida)
        }

        escreva("Digite a temperatura: ")
        leia(temperatura)

        se (medida == 1) {
            escreva("Certo, você inseriu ", temperatura, "°C.\n")
        } senao {
            escreva("Certo, você inseriu ", temperatura, "°F.\n")
        }

        escreva("Escolha a conversão desejada:\n")
        escreva("Digite 1 para converter para Celsius ou 0 para Fahrenheit: ")
        leia(conversao)
        enquanto (conversao != 0 e conversao != 1) {
            escreva("Opção inválida! Digite 1 para Celsius ou 0 para Fahrenheit: ")
            leia(conversao)
        }

        se (medida == 0 e conversao == 1) {
            // Fahrenheit para Celsius
            valor = (temperatura - 32) / 1.8
            escreva(temperatura, "°F em Celsius é: ", valor, "°C")
        } senao se (medida == 1 e conversao == 0) {
            // Celsius para Fahrenheit
            valor = (temperatura * 9 / 5) + 32
            escreva(temperatura, "°C em Fahrenheit é: ", valor, "°F")
        } senao {
            // Não precisa converter
            escreva("O valor não se altera: ", temperatura)
            se (medida == 1) {
                escreva("°C")
            } senao {
                escreva("°F")
            }
        }
    }
}
