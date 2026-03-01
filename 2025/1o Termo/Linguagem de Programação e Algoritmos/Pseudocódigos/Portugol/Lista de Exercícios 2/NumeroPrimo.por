programa {
    funcao inicio() {
        inteiro x, valor = 1, divisores = 0
        escreva("Digite um número e nós descobriremos se é primo ou não: ")
        leia(x)
        escreva("\nEste resultado pode demorar algum tempo de acordo com o valor inserido...\n")
        se(x > 0){
            enquanto(valor <= x){
                se(x % valor == 0){
                    divisores = divisores + 1
                }
                valor = valor + 1
            }
            se(divisores == 2){
                escreva("Seu número é primo.")
            }
            senao{
                escreva("Seu número não é primo.")
            }
        }
        senao{
            escreva("Valor negativo ou igual a zero\n")
        }
    }
}
