import os
os.system('cls')

pedido = {
    "cliente": "joao da silva",
    "smatphone": 1500.00,
    "fone_bluetooth": 200.00,
    "capinha": 30.00
    }
print("===PROCESSAMENTO DE CARRINHO DE COMPRAS===")
dados_entrega = {
    "frete":25.00,
    "prazo": "5 dias úteis"
}
pedido.update(dados_entrega)
print(f"\n Dados de entrega adicionados. Frete: R& {pedido['frete']}")

desconto = pedido.get ("cupom_desconto", 0.00)

pedido.update(desconto)
