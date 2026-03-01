programa {
    inclua biblioteca Texto

    funcao inicio() {
        cadeia frase
        caracter vogais[] = {'a','e','i','o','u'}
        inteiro indiceVogal, posicaoFrase, tamanho, quantidade = 0

        escreva("Digite uma palavra: ")
        leia(frase)

        frase = Texto.caixa_baixa(frase)
        tamanho = Texto.numero_caracteres(frase)

        para(indiceVogal = 0; indiceVogal < 5; indiceVogal++){
            quantidade = 0

            para (posicaoFrase= 0; posicaoFrase < tamanho; posicaoFrase = posicaoFrase + 1){
                se(Texto.obter_caracter(frase, posicaoFrase) == vogais[indiceVogal]){
                    quantidade = quantidade + 1
                }
            }

            escreva("Quantidade de vogais " + Texto.caixa_alta(vogais[indiceVogal]) + ": " + quantidade + "\n")
        }
    }
}
