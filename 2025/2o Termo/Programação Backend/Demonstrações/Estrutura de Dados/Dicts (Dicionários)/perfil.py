import os
os.system('cls')

print("===== Programa TopZerira de Gerenciamento do perfil")

perfil = {
    "usuario": "@Python Master",
    "Seguidores": 15000,
    "Seguindo": 200,
    "Rascunho_post": "Foto do café com código"
}

print(f"\n\n ==Gerenciamento de prfil: {perfil['usuario']}===")

novos_dados = {
    "bio": "Ensionamento tecnologia de forma simples",
    "site": "www.wellsite.ocm.br"
}

perfil.update (novos_dados)
print("\n >> Perfil atualizado com novas informações.")

is_verificado = perfil.get ("verificado", False)

if is_verificado:
    print(">> Usuário possui perfil de verificado")
else:
    print(">> Us'uário comum (sem verificação)")

post_negado = perfil.pop ("rascunho_post", "Nenhum rascunho encontrado")
print (f"Rascunho deletado: '{post_negado}'")

print("\n ===== Dashboard do usuário =====")
for chave, valor in perfil.items():
    print(f"{chave.upper()}: {valor}")
