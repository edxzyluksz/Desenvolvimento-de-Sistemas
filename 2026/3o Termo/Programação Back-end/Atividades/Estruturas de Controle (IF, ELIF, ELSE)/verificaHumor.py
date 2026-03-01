humorAtual = input("Olá, amigo! Como você está se sentindo hoje?\nDicas: feliz, triste, cansado, estressado").lower()
if humorAtual == "feliz":
    print("Que incrível! Continue assim e aproveite o seu dia!")
elif humorAtual == "triste":
    print("Sinto muito que você esteja triste. Tente fazer algo que você goste!")
    print("Lembre-se de que é normal se sentir triste às vezes, e isso também passará.")
elif humorAtual == "cansado":
    print("Você precisa descansar um pouco. Tente tirar uma soneca ou fazer uma pausa.")
elif humorAtual == "estressado":
    print("Você parece estar estressado. Tente respirar fundo e relaxar um pouco.")
else:
    print("Hmm, não reconheço esse humor. Talvez você possa descrever melhor como se sente?")