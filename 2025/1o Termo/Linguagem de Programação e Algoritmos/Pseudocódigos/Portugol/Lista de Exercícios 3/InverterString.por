programa {
    inclua biblioteca Texto
    inclua biblioteca Tipos

    funcao inicio() {
        cadeia frase, fraseInvertida = ""
        inteiro i, tamanho

        escreva("Digite uma frase: ")
        leia(frase)

        tamanho = Texto.numero_caracteres(frase)

        para(i = tamanho - 1; i >= 0; i--) {
            fraseInvertida = fraseInvertida + Texto.obter_caracter(frase, i)
        }

        escreva("Frase invertida: ", fraseInvertida)
    }
}
