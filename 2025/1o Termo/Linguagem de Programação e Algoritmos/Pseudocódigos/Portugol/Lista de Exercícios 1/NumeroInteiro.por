programa {
    funcao inicio() {
        // Ler um valor e escrever se é positivo ou negativo (zero como positivo)
        
        inteiro numero

        escreva("Escreva um número: ")
        leia(numero)

        se (numero >= 0) {
            escreva("Seu número é positivo!")
        }
        se (numero < 0) {
            escreva("Seu número é negativo!")
        }
    }
}
