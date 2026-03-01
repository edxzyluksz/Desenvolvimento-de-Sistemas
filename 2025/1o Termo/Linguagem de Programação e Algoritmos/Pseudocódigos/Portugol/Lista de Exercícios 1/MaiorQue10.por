programa {
    funcao inicio() {
      
        // Ler um valor e escrever a mensagem “É MAIOR QUE 10!” se o valor lido
        // for maior que 10, caso contrário escrever “NÃO É MAIOR QUE 10!”
        
        inteiro numero

        escreva("Olá! Digite um número: ")
        leia(numero)

        se (numero > 10) {
            escreva("É MAIOR QUE 10!")
        }
        // Sim, 10 != "Maior que 10"
        senao {
            escreva("NÃO É MAIOR QUE 10!")
        }
    }
}
