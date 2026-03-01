programa {

  inclua biblioteca Texto --> t
  inclua biblioteca Util --> u

  funcao inicio() {

    inteiro i, palavrasorteada = u.sorteia(0,10), contadorParaLimpa = 3, tamanho, erros = 0
    cadeia palavrasInseridas[10], adivinhacao
    cadeia palavras = ""
    caracter maximoLetras[20], usuariodigita

    escreva("=== Jogo da Forca ===\nDigite 10 palavras\n")
    para (i = 0; i < 10; i++) {
      escreva("Palavra ", i + 1, ": ")
      leia(palavras)
      palavrasInseridas[i] = palavras
    }

    escreva("\nPalavras inseridas:\n")
    para (i = 0; i < 10; i++) {
      escreva(palavrasInseridas[i], "; ")
    }

    u.aguarde(5000)

    para (i = 0; i < 3000; i = i + 1000) {
      u.aguarde(i)
      escreva("\n", contadorParaLimpa, "...\n")
      contadorParaLimpa--
    }

    limpa()

    adivinhacao = palavrasInseridas[palavrasorteada]
    tamanho = t.numero_caracteres(adivinhacao)

    escreva("Certo! Agora adivinhe, letra por letra, qual foi a palavra que escolhi:\n")

    para (i = 0; i < tamanho; i++) {
      maximoLetras[i] = '_'
    }

    para (i = 0; i < tamanho; i++) {
      escreva(maximoLetras[i], " ")
    }
    escreva("\n")

    logico venceu = falso

    enquanto (venceu == falso e erros < 5) {

      escreva("Digite uma letra (ou '1' para revelar uma letra aleatória): ")
      leia(usuariodigita)

      se (t.numero_caracteres(usuariodigita) == 0) {
        escreva("Você não digitou nada. Tente novamente.\n")
      } senao {

        logico acertou = falso

        se (usuariodigita == '1') {
          inteiro posicaoRevelada = u.sorteia(0, tamanho - 1)
          caracter letraSorteada = t.obter_caracter(adivinhacao, posicaoRevelada)
          maximoLetras[posicaoRevelada] = letraSorteada
          escreva("Letra revelada!\n")
        } senao {
          para (i = 0; i < tamanho; i++) {
            se (t.caixa_baixa(t.obter_caracter(adivinhacao, i)) == t.caixa_baixa(usuariodigita)) {
              maximoLetras[i] = t.obter_caracter(adivinhacao, i)
              acertou = verdadeiro
            }
          }
          se (acertou == falso) {
            erros++
            escreva("Letra incorreta. Você possui mais ", 5 - erros, " tentativas.\n")
          }
        }

        escreva("Progresso: ")
        para (i = 0; i < tamanho; i++) {
          escreva(maximoLetras[i], " ")
        }
        escreva("\n")

        venceu = verdadeiro
        para (i = 0; i < tamanho; i++) {
          se (maximoLetras[i] == '_') {
            venceu = falso
          }
        }
      }
    }

    se (venceu) {
      escreva("\nMuito bem! Você acertou qual era a palavra!")
    } senao {
      escreva("\nPoxa, você não conseguiu dessa vez... A palavra era: ", adivinhacao)
    }
  }
}
