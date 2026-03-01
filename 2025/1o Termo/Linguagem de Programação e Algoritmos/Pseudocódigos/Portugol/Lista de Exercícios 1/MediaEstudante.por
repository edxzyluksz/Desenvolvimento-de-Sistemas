programa {
    funcao inicio() {
        real num1, num2, num3, num4, media

        escreva("Olá. Digite aqui quatro notas para o programa definir seu estado acadêmico: ")

        faca {
            leia(num1)
            se (num1 > 10 ou num1 < 0) {
                escreva("Formatação inválida. Utilize a escala de 0 a 10: ")
            }
        } enquanto (num1 > 10 ou num1 < 0)

        faca {
            leia(num2)
            se (num2 > 10 ou num2 < 0) {
                escreva("Formatação inválida. Utilize a escala de 0 a 10: ")
            }
        } enquanto (num2 > 10 ou num2 < 0)

        faca {
            leia(num3)
            se (num3 > 10 ou num3 < 0) {
                escreva("Formatação inválida. Utilize a escala de 0 a 10: ")
            }
        } enquanto (num3 > 10 ou num3 < 0)

        faca {
            leia(num4)
            se (num4 > 10 ou num4 < 0) {
                escreva("Formatação inválida. Utilize a escala de 0 a 10: ")
            }
        } enquanto (num4 > 10 ou num4 < 0)

        media = (num1 + num2 + num3 + num4) / 4

        escreva("Sua média foi: ", media, "\n")

        se (media > 7) {
            escreva("Aprovado!")
        }
        se (media >= 5 e media <= 6.99) {
            escreva("Recuperação!")
        }
        se (media < 5) {
            escreva("Reprovado!")
        }
    }
}
