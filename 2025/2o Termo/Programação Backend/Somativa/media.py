import os
os.system('cls')

nome = input("Olá, aluno! Digite o seu nome para prosseguirmos: ")
print(f"Olá {nome}, vamos prosseguir com suas notas de bimestre!\n")
soma, i = 0, 1

while True:
    try:
        while i <= 4:
            notasString = input(f"Digite sua nota do {i} bimestre: ").replace(",", ".")
            notasFloat = float(notasString)
            if notasFloat > 10 or notasFloat < 0:
                raise ValueError
            soma = soma + notasFloat
            i += 1
    except ValueError:
        print("\nDigite um número entre 0 a 10!\n")
        continue

    break
    

media = (soma / 4)
print(f"Muito bem, sua média final foi: {media}")

if media < 5:
    print("Você foi reprovado!")
elif media >= 5 and media < 7:
    print("Você está em processo de recuperação!")
else:
    print("Você está aprovado!")