programa {
    inclua biblioteca Texto --> t

    funcao inicio() {
        cadeia palavra, frase
        inteiro i
        inteiro tamanho1, tamanho2
        logico encontrado = falso

        escreva("Escreva uma palavra aqui: ")
        leia(palavra)
        escreva("Agora uma outra maior ou frase aqui: ")
        leia(frase)

        tamanho1 = t.numero_caracteres(palavra)
        tamanho2 = t.numero_caracteres(frase)

        se (tamanho2 >= tamanho1) {
            para(i = 0; i <= tamanho2 - tamanho1; i++){
                cadeia trecho = t.extrair_subtexto(frase, i, i + tamanho1)
                se (t.caixa_alta(trecho) == t.caixa_alta(palavra)){
                    encontrado = verdadeiro
                    pare
                }
            }

            se(encontrado){
                escreva("Sim, a segunda string possui a primeira.")
            } senao{
                escreva("A segunda string não contém a primeira.")
            }
        }
        senao {
            escreva("Tente escrever uma palavra na primeira e uma frase na segunda.")
        }
    }
}
