programa {
    inclua biblioteca Texto --> t

    funcao inicio() {
        cadeia frase, fraseInvertida = ""
        inteiro tamanho, i

        escreva("Olá, digite uma palavra: ")
        leia(frase)

        frase = t.caixa_baixa(frase)
        tamanho = t.numero_caracteres(frase)

        para (i = tamanho - 1; i >= 0; i--){
            fraseInvertida = fraseInvertida + t.obter_caracter(frase, i)
        }

        se (frase == fraseInvertida){
            escreva("É um palíndromo! Ou seja, escrito igual se invertido - " + frase + " --> " + fraseInvertida)
        }
        senao{
            escreva("Não é um palíndromo!")
        }
    }
}
