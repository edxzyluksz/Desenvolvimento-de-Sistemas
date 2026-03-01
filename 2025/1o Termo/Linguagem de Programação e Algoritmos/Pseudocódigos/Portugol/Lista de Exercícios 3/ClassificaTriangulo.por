programa {
    funcao inicio() {
        real lado1, lado2, lado3
        // Fiz questão de incluir a regra do triângulo válido

        faca{
            escreva("Digite 3 lados de um triângulo e eu definirei se ele é equilátero, isósceles ou escaleno: \n", "1- ")
            leia(lado1)
            escreva("2- ")
            leia(lado2)
            escreva("3- ")
            leia(lado3)

            se (lado1 <= 0 ou lado2 <= 0 ou lado3 <= 0){
                escreva("Um ou mais dos lados inseridos possuem valores negativos. Digite todos novamente.\n")
            }
            senao se(lado1 >= lado2 + lado3 ou lado2 >= lado1 + lado3 ou lado3 >= lado1 + lado2){
                escreva("Seus valores são maiores que zero, no entanto, não é geometricamente possível formar um triângulo com esses valores.\n\n")
            }
        }
        enquanto(lado1 <= 0 ou lado2 <= 0 ou lado3 <= 0 ou lado1 >= lado2 + lado3 ou lado2 >= lado1 + lado3 ou lado3 >= lado1 + lado2)

        se(lado1 == lado2 e lado2 == lado3){
            escreva("Seu triângulo é equilátero.")
        }
        senao se(lado1 == lado2 ou lado2 == lado3 ou lado1 == lado3){
            escreva("Seu triângulo é isósceles.")
        }
        senao{
            escreva("Seu triângulo é escaleno.")
        }
    }
}
