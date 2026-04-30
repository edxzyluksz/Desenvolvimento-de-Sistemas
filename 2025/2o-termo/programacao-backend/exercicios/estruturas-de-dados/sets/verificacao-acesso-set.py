import os
os.system('cls')

codigos_permitidos = {"A-201", "B-300", "D-450", "E-700"}

print("O código C-105 está no conjunto?")
if "C-105" not in codigos_permitidos:
    codigos_permitidos.add("C-105")
    print("Agora está!")
else:
    print("Já estava!")

print("O código A-201 está no conjunto?")
if "A-201" in codigos_permitidos:
    print("Por razões de segurança, ele foi removido.")
    codigos_permitidos.remove("A-201")
else:
    print("Não está!")

print(f"Códigos atuais:\n{codigos_permitidos}")