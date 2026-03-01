cor = input("Digite a cor do semáforo (verde, amarelo ou vermelho): ").lower()

if cor == "verde":
    print("Siga em frente!")
elif cor == "amarelo":
    print("Atenção! Prepare-se para parar.")
else:
    print("Pare o carro!")