programa {
    inclua biblioteca Calendario
    funcao inicio() {
        cadeia nomeuser
        inteiro hora
        escreva("Olá, usuário! Qual é o seu nome?\n", "Meu nome é...\n")
        leia (nomeuser)
        hora = (Calendario.hora_atual())
        se (hora >= 6 e hora <= 11) {
            escreva("Olá, ", nomeuser, "! Agora são ", (hora), " Horas! Bom dia!")
        }
        senao se (hora >= 12 e hora <= 18) {
            escreva("Olá, ", nomeuser, "! Agora são ", (hora), " Horas! Boa tarde!")
        }
        senao se (hora >= 19 ou hora <= 5) {
            escreva("Olá, ", nomeuser, "! Agora são ", (hora), " Horas! Boa noite!")
        }
    }
}
