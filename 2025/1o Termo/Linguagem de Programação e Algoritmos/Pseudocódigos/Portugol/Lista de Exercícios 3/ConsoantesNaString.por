programa {
    inclua biblioteca Texto

    funcao inicio() {
        cadeia frase
        caracter consoantes[] = {'b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z'}
        inteiro indiceConsoante, posicaoFrase, tamanho, quantidade = 0

        escreva("Digite uma palavra: ")
        leia(frase)

        frase = Texto.caixa_baixa(frase)
        tamanho = Texto.numero_caracteres(frase)

        para(indiceConsoante = 0; indiceConsoante < 21; indiceConsoante++){
            quantidade = 0

            para (posicaoFrase = 0; posicaoFrase < tamanho; posicaoFrase = posicaoFrase + 1){
                se(Texto.obter_caracter(frase, posicaoFrase) == consoantes[indiceConsoante]){
                    quantidade = quantidade + 1
                }
            }

            escreva("Quantidade de consoantes " + Texto.caixa_alta(consoantes[indiceConsoante]) + ": " + quantidade + "\n")
        }
    }
}
