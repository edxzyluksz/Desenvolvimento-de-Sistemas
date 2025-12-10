boletim = {
    "Ana": 8.5,
    "Bruno": 6.0,
    "Carlos": 4.5,
    "Daniela": 9.0
}

for nome, nota in boletim.items():
    status = "Aprovado" if nota >= 6 else "Reprovado"
    print(f"{nome}: {nota} — {status}")
