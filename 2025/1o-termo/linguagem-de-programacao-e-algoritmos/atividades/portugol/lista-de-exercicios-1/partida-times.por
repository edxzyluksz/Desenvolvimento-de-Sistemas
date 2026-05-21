programa {
    funcao inicio() {
        cadeia time1, time2 // Eu poderia ter colocado palmeiras em sua homenagem...
        inteiro gol1, gol2

        escreva("Programação com o intuito de registrar se um time ganhou, perdeu, ou empatou com outro.\n")

        escreva("\nEscreva o nome do primeiro time aqui: ")
        leia(time1)

        escreva("Agora o nome do segundo time aqui: ")
        leia(time2)

        escreva("\nQual foi a quantidade de gols que ", time1, " marcou no jogo? - ")
        leia(gol1)

        escreva("Qual foi a quantidade de gols que ", time2, " marcou no jogo? - ")
        leia(gol2)

        se (gol1 > gol2) {
            escreva("\nEntão foi ", time1, " que ganhou o jogo!")
        } senao se (gol2 > gol1) {
            escreva("\nEntão foi ", time2, " que ganhou o jogo!")
        } senao {
            escreva("\nO jogo foi um empate!")
        }
    }
}
