programa {
    funcao inicio() {
        real peso, altura, imc

        faca {
            escreva("Digite o peso: ")
            leia(peso)
            se (peso <= 0) {
                escreva("Inválido. Digite um número maior que 0.\n")
            }
        } enquanto (peso <= 0)

        faca {
            escreva("Digite sua altura: \n")
            leia(altura)
            se (altura <= 0) {
                escreva("Inválido. Digite um número maior que 0.\n")
            }
        } enquanto (altura <= 0)

        imc = peso / (altura * altura)

        se (imc < 18.5) {
            escreva("Você está Abaixo do Peso.\n")
        }
        senao se (imc >= 18.5 e imc <= 24.9) {
            escreva("Seu peso é Normal.\n")
        }
        senao se (imc >= 25 e imc <= 29.5) {
            escreva("Você está em Sobrepeso.\n")
        }
        senao {
            escreva("Você está em Obesidade.\n")
        }
    }
}
