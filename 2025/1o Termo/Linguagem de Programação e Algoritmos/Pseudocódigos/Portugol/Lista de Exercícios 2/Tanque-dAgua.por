programa {
    funcao inicio() {
        real lado, altura, profundidade, raio, areabase, cubo, paralelepidedo, cilindro
        real PI = 3.141592653589793
        cadeia formato

        faca {
            escreva("Olá. Qual é o formato tridimensional do tanque d'água? - Opções: Cubo, Paralelepipedo, Cilindro.\nDigite aqui: ")
            leia(formato)
            se (formato != "CUBO" e formato != "Cubo" e formato != "cubo" e formato != "PARALELEPIPEDO" e formato != "Paralelepipedo" e formato != "paralelepipedo" e formato != "CILINDRO" e formato != "Cilindro" e formato != "cilindro") {
                escreva("\nDigite um formato válido ou escreva corretamente.\n\n")
            }
        } enquanto (formato != "CUBO" e formato != "Cubo" e formato != "cubo" e formato != "PARALELEPIPEDO" e formato != "Paralelepipedo" e formato != "paralelepipedo" e formato != "CILINDRO" e formato != "Cilindro" e formato != "cilindro")

        se (formato == "CUBO" ou formato == "Cubo" ou formato == "cubo") {
            faca {
                escreva("Informe o lado de seu tanque cúbico, em metros: ")
                leia(lado)
                se (lado < 0) {
                    escreva("Inválido. Não é possível adicionar um valor negativo para o lado")
                }
                senao {
                    cubo = (lado*lado*lado)
                    escreva("Seu tanque possui ", cubo, " metros cúbicos.")
                }
            } enquanto (lado < 0)
        }
        senao se (formato == "PARALELEPIPEDO" ou formato == "Paralelepipedo" ou formato == "paralelepipedo") {
            faca {
                escreva("Informe o lado, altura e profundidade de seu tanque, em metros: ", "\n", "1 - Lado: ")
                leia(lado)
                escreva("2 - Altura: ")
                leia(altura)
                escreva("3 - Profundidade: ")
                leia(profundidade)
                paralelepidedo = (lado*altura*profundidade)
                se (paralelepidedo < 0) {
                    escreva("Resultado inválido! Confira se os valores inseridos estão positivos.\n")
                }
                senao escreva("Seu tanque possui ", paralelepidedo, " metros cúbicos.")
            } enquanto (paralelepidedo < 0)
        }
        senao se (formato == "CILINDRO" ou formato == "Cilindro" ou formato == "cilindro") {
            faca {
                escreva("Informe o raio da base e a altura de seu tanque cilíndrico, em metros: ", "\n", "1 - Raio da base: ")
                leia(raio)
                areabase = (raio*raio*(PI))
                escreva("2 - Altura: ")
                leia(altura)
                cilindro = (areabase*altura)
                se (cilindro < 0) {
                    escreva("Resultado inválido! Confira se os valores inseridos estão positivos.\n")
                }
                senao escreva("Seu tanque possui ", cilindro, " metros cúbicos.")
            } enquanto (paralelepidedo < 0)
        }
    }
}
