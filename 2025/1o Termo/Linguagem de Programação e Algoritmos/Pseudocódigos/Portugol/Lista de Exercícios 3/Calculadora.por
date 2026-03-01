programa {
    inclua biblioteca Tipos --> tp
    inclua biblioteca Texto --> tx

    funcao inicio() {
        cadeia numeroInserido1 = "", numeroInserido2 = ""
        caracter operacao
        inteiro numeroEmDecimal, i, tamanhoBinario, resultado

        escreva("=== Calculadora de Binário ===\n\n")
        escreva("Digite um número em BINÁRIO: ")
        leia(numeroInserido1)

        tamanhoBinario = tx.numero_caracteres(numeroInserido1)
        para (i = 0; i < tamanhoBinario; i++){
            caracter letra = tx.obter_caracter(numeroInserido1, i)
            se(letra != '1' e letra != '0'){
                escreva("'", letra, "' <--- Inválido. Digite apenas zeros e uns e que estejam sem espaçamento.\n")
                retorne
            }
        }

        escreva("Digite outro número em BINÁRIO: ")
        leia(numeroInserido2)
        tamanhoBinario = tx.numero_caracteres(numeroInserido2)
        para (i = 0; i < tamanhoBinario; i++){
            caracter letra = tx.obter_caracter(numeroInserido2, i)
            se(letra != '1' e letra != '0'){
                escreva("'", letra, "' <--- Inválido. Digite apenas zeros e uns e que estejam sem espaçamento.\n")
                retorne
            }
        }

        se (tx.numero_caracteres(numeroInserido1) > 32 ou tx.numero_caracteres(numeroInserido2) > 32) {
            escreva("Entradas maiores que 32 bits não são suportadas.\n")
            retorne
        }

        escreva("\nAgora digite a operação que você deseja: (+), (-), (*), (/)\n")
        leia(operacao)

        se(operacao == '+'){
            resultado = tp.cadeia_para_inteiro(numeroInserido1, 2) + tp.cadeia_para_inteiro(numeroInserido2, 2)
        }
        senao se(operacao == '-'){
            resultado = tp.cadeia_para_inteiro(numeroInserido1, 2) - tp.cadeia_para_inteiro(numeroInserido2, 2)
        }
        senao se(operacao == '*'){
            resultado = tp.cadeia_para_inteiro(numeroInserido1, 2) * tp.cadeia_para_inteiro(numeroInserido2, 2)
        }
        senao se(operacao == '/'){
            resultado = tp.cadeia_para_inteiro(numeroInserido1, 2) / tp.cadeia_para_inteiro(numeroInserido2, 2)
        }
        senao{
            escreva("\nTente escrever os símbolos exatamente como aparecem acima.")
            retorne
        }

        se (resultado > 4294967295) {
            escreva("\nErro: resultado excede o limite de 32 bits (4294967295).")
            retorne
        }

        cadeia binarioFinal = tp.inteiro_para_cadeia(resultado, 2)
        // Remover zeros à esquerda
        inteiro primeiroUm = -1
        para (i = 0; i < tx.numero_caracteres(binarioFinal); i++) {
            se (tx.obter_caracter(binarioFinal, i) == '1') {
                primeiroUm = i
                pare
            }
        }

        se (primeiroUm != -1) {
            binarioFinal = tx.extrair_subtexto(binarioFinal, primeiroUm, tx.numero_caracteres(binarioFinal))
        } senao {
            binarioFinal = "0"
        }

        escreva("Seu resultado foi: ", binarioFinal, " (", resultado, ")\n\n")

        se (resultado == 4294967295) {
            escreva("Este é o maior valor representável com 32 bits sem sinal.\n")
        }
    }
}
