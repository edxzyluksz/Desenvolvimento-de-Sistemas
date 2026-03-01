programa {
    funcao inicio() {
        inteiro aleatorio

        escreva("Olá. Por favor, digite um número e eu direi se ele é par ou ímpar: ")
        leia(aleatorio)
        
        se (aleatorio % 2 == 0) {
            escreva("Seu número é par.")
        }
        senao escreva("Seu número é ímpar.")
    }
}
