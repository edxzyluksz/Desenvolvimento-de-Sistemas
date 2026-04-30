programa {
    inclua biblioteca Util --> u

    inteiro sorteio, chute, numerodechutes = 0, diferenca

    funcao inicio() {
        sorteio = u.sorteia(1, 100)

        escreva("Adivinhe o número aleatório por meu programa: ")
        leia(chute)

        enquanto(chute != sorteio){
            diferenca = sorteio - chute
            se (diferenca < 0) {
                diferenca = -diferenca
            }

            se(diferenca <= 5){
                escreva("Está perto de adivinhar!\n")
            }
            senao se (diferenca <= 15 ){
                escreva("Não tão perto, não tão longe....\n")
            }
            senao{
                escreva("Poxa! Está longe...")
            }

            escreva("Tente novamente: ")
            numerodechutes++
            leia(chute)
        }

        escreva("Parabéns! Você adivinhou qual era. Número de tentativas: ", (numerodechutes + 1),"")
    }
}
