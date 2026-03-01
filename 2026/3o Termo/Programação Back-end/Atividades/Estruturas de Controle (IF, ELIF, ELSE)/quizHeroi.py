print("Bem-vindo ao Quiz do Herói! Vamos analisar as vantagens do poder escolhido por você! 🦸‍♂️🦸‍♀️")

poderFavorito = input("Entre voar, força e invisibilidade, qual é seu poder favorito? ").lower()
if poderFavorito == "voar":
    print("Uau! Voar é incrível! Você poderia explorar o mundo de uma maneira totalmente nova!")
elif poderFavorito == "força":
    print("Força é um poder impressionante! Você poderia proteger os outros e enfrentar desafios com facilidade!")
elif poderFavorito == "invisibilidade":
    print("Invisibilidade é um poder fascinante! Você poderia se mover sem ser visto e descobrir segredos escondidos!")
else:
    print("Hmm, não reconheço esse poder. Talvez você possa escolher entre Voar, Força ou Invisibilidade?")