votos = (101, 205, 101, 300, 205, 101, 400)

contagem_CentoUm = votos.count(101)
print(f"O valor 101 foi impresso {contagem_CentoUm} vez(es)")

encontraTrezentos = votos.index(300)
print(f"A primeira vez que a chapa 300 aparece é {encontraTrezentos}")

try:
    votos.append(500)
except AttributeError:
    print("Foi tentando adicionar o elemento \"500\" na tupla, porém não foi possível dado sua imutabilidade. ")