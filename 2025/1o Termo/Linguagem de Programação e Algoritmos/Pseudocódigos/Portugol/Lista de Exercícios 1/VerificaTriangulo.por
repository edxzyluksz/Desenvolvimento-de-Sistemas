programa {
    funcao inicio() {
        // Ler 3 valores (A, B e C) representando as medidas dos lados de um triângulo e
        // escrever se formam ou não um triângulo. 
        // OBS: para formar um triângulo, o valor de cada lado deve ser menor que a soma dos outros 2 lados.

        inteiro lado1, lado2, lado3

        escreva("Olá! Insira aqui 3 valores numéricos para que eu consiga dizer se é possível fazer um triângulo com eles.")
        escreva("\nComeçando nesta linha: 1 - ")
        leia(lado1)
        escreva("2- ")
        leia(lado2)
        escreva("3- ")
        leia(lado3)

        se (lado1 >= lado2 + lado3 ou lado2 >= lado1 + lado3 ou lado3 >= lado2 + lado1) {
            escreva("Não é possível realizar um triângulo com os lados inseridos.")
        }
        senao {
            escreva("Ok, é possível formar um triângulo com esses valores!")
        }
    }
}
