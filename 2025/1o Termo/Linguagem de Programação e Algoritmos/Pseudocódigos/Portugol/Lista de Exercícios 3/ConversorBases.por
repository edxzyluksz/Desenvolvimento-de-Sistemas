programa {
    inclua biblioteca Tipos --> t
    inclua biblioteca Texto --> tex

    funcao inicio() {
        cadeia numeroDigitado, baseEntrada, baseSaida, resultado
        inteiro baseOrigem, baseDestino, valorInteiro

        escreva("=== Conversor de Bases Numéricas ===\n\n")
        escreva("Digite o número que deseja converter (sem prefixos como 0b ou 0x): ")
        leia(numeroDigitado)

        escreva("\nAgora informe a base do número que você digitou:\n")
        escreva("A - Binário (base 2)\n")
        escreva("B - Decimal (base 10)\n")
        escreva("C - Hexadecimal (base 16)\n")
        leia(baseEntrada)
        baseEntrada = tex.caixa_alta(baseEntrada)

        se (baseEntrada == "A") {
            baseOrigem = 2
        } senao se (baseEntrada == "B") {
            baseOrigem = 10
        } senao se (baseEntrada == "C") {
            baseOrigem = 16
        } senao {
            escreva("Base de entrada inválida.\n")
            retorne
        }

        se (t.cadeia_e_inteiro(numeroDigitado, baseOrigem)) {
            valorInteiro = t.cadeia_para_inteiro(numeroDigitado, baseOrigem)
        } senao {
            escreva("O número digitado não é válido para a base informada.\n")
            retorne
        }

        escreva("\nAgora escolha para qual base deseja converter:\n")
        escreva("A - Binário (base 2)\n")
        escreva("B - Decimal (base 10)\n")
        escreva("C - Hexadecimal (base 16)\n")
        leia(baseSaida)
        baseSaida = tex.caixa_alta(baseSaida)

        se (baseSaida == "A") {
            baseDestino = 2
        } senao se (baseSaida == "B") {
            baseDestino = 10
        } senao se (baseSaida == "C") {
            baseDestino = 16
        } senao {
            escreva("Base de saída inválida.\n")
            retorne
        }

        resultado = t.inteiro_para_cadeia(valorInteiro, baseDestino)

        // Remover zeros à esquerda
        enquanto (tex.numero_caracteres(resultado) > 1 e tex.obter_caracter(resultado, 1) == "0") {
            resultado = tex.extrair_subtexto(resultado, 2, tex.numero_caracteres(resultado))
        }

        escreva("\nResultado: ")
        se (baseDestino == 2) {
            escreva("Binário: 0b", resultado)
        } senao se (baseDestino == 10) {
            escreva("Decimal: ", resultado)
        } senao se (baseDestino == 16) {
            escreva("Hexadecimal: ", tex.caixa_alta(resultado))
        }
        escreva("\n")
    }
}
