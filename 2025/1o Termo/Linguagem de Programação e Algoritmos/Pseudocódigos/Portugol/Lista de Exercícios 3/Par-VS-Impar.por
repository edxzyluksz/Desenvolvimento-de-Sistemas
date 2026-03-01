programa {
    inclua biblioteca Util --> u
    inclua biblioteca Texto --> t

    funcao inicio() {
        inteiro sorteio, afirmacao
        cadeia decisao = ""

        enquanto(decisao != "par" e decisao != "ímpar") {
            escreva("Vamos competir! Escolha se você quer Par ou Ímpar! R: ")
            leia(decisao)
            decisao = t.caixa_baixa(decisao)
            se(decisao != "par" e decisao != "ímpar") {
                escreva("Por favor, digite corretamente!\n")
            }
        }

        sorteio = u.sorteia(1, 2)
        afirmacao = sorteio % 2

        escreva("3...\n")
        u.aguarde(1000)
        escreva("2...\n")
        u.aguarde(1000)
        escreva("1...\n")
        u.aguarde(1000)

        escreva("O número sorteado foi ", sorteio, "\n")

        se(decisao == "par") {
            se(afirmacao == 0) {
                escreva("Parece que você ganhou, parabéns pela vitória!")
            } senao {
                escreva("Eu ganhei!!! Eu ganhei!!!")
            }
        } senao {
            se(afirmacao == 1) {
                escreva("Parece que você ganhou, parabéns pela vitória!")
            } senao {
                escreva("Eu ganhei!!! Eu ganhei!!!")
            }
        }
    }
}
