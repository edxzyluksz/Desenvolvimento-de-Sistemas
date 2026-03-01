programa {
    inclua biblioteca Texto --> t

    funcao inicio() {
        cadeia frase, fraseSemEspaco = ""
        inteiro i, tamanho

        escreva("EscrevaUmaFraseEDeixe-MeConsertarEla\n")
        leia(frase)

        tamanho = t.numero_caracteres(frase)

        para (i = 0; i < tamanho; i++){
            se(t.obter_caracter(frase, i) != " "){
                fraseSemEspaco = fraseSemEspaco + t.obter_caracter(frase, i)
            }
        }

        escreva("SuaFraseFicouAssim:\n" + fraseSemEspaco)
    }
}
