programa {
    funcao inicio() {
        // Ler um valor e escrever se é positivo, negativo ou zero.
        
        inteiro numero

        escreva("Escreva um número: ")
        leia(numero)

        se (numero >= 1) {
            escreva("Seu número é positivo!")
        }
        se (numero < 0) {
            escreva("Seu número é negativo!")
        }
        se (numero == 0) {
            escreva("Seu número é zero! Como se fosse o portal entre dimensões!")
        }
    }
}
