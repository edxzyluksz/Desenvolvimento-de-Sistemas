programa {
    funcao inicio() {
        inteiro valor, restante
        inteiro notas100, notas50, notas20, notas10, notas5, notas1

        escreva("Digite o valor que deseja sacar: ")
        leia(valor)

        se (valor <= 0) {
            escreva("Digite um valor maior que zero.\n")
        }
        senao {
            restante = valor

            notas100 = restante / 100
            restante = restante % 100

            notas50 = restante / 50
            restante = restante % 50

            notas20 = restante / 20
            restante = restante % 20

            notas10 = restante / 10
            restante = restante % 10

            notas5 = restante / 5
            restante = restante % 5

            notas1 = restante

            escreva("Notas necessárias para o saque de R$ ", valor, ":\n")
            se (notas100 > 0) escreva(notas100, " nota(s) de R$100\n")
            se (notas50 > 0) escreva(notas50, " nota(s) de R$50\n")
            se (notas20 > 0) escreva(notas20, " nota(s) de R$20\n")
            se (notas10 > 0) escreva(notas10, " nota(s) de R$10\n")
            se (notas5 > 0) escreva(notas5, " nota(s) de R$5\n")
            se (notas1 > 0) escreva(notas1, " nota(s) de R$1\n")
        }
    }
}
