# Casos de exemplos e tal ne de negócios

Objetivo: Identificar corretamente, com base na proposta de briefing do cliente, quais aspectos do software serão *Requisitos, Regras de Negócio ou Restrições.*

## CASO 1

- Comprar comida: **Requisito geral**
- Entregas num raio de 10km pois esfria: **Restrição**
- Cliente precisa ver foto dos pratos: **Requisito**
- Pedido passar de 50 = frete grátis: **Regra de Negócio**
- Sistema tem que aceitar pix, sem saber de cartão: **Regra de Negócio**
- Entregador tem que confirmar que entregou usando código: **Regra de Negócio**

---

## CASO 2

- Digitalizar meu clube orgânico: **Requisito geral**
- Cliente escolhe um plano pequeno, medio, grande e recebe toda terça-feira: **Requisito**
- Só pode trocar os itens da cesta até domingo à noite, se passar vai o que tiver na horta: **Regra de Negócio**
- O pagamento tem que ser recorrente no cartão de crédito, estilo Netflix: *Requisito*
- Só entregamos no sul da cidade por causa do meu caminhão antigo: *Regra*
- O entregador precisa tirar uma foto da cesta na porta do cliente para provar que entregou: **Regra**

---

## CASO 3

- Nosso negócio é levar café da manhã e lanches para reuniões de empresas: **Requisito geral**
- O pedido mínimo é R$200: **Regra de Negócio**
- As empresas precisam obrigatoriamente informar o CNPJ e a Inscrição Estadual para emitirmos a nota fiscal eletrônica na hora: **Restrição**
- Os pedidos precisam ser feitos com no mínimo 24 horas de antecedência: **Regra de Negócio**
- O sistema tem que rodar em tablets antigos: **Restrição**
- Frete fixo de R$20, exceto se for parceiro diamante: **Regra de Negócio**

---

## CASO 4

- Meu app é pra quem acabou a bebida no meio da festa: **Requisito Geral**
- O foco é velocidade, entregando em até 20 minutos. Se não, o cliente ganha um cumpom de 50% na próxima compra: **Regra de Negócio**
- Por lei, o comprador deve ser maior de idade 18 anos, então o app tem que pedir uma foto do RG antes de finalizar a primeira compra: **Restrição**
- Se zerar o estoque, some o ícone do produto: **Requisito**
- Sistema não pode suportar mais que 500 users logados pra não travar o server: **Restrição**

---

## Conceitos

### Requisito

 É algo que deve ser atendido para satisfazer uma necessidade ou expectativa, geralmente relacionado ao produto ou serviço final.  Pode ser funcional o que o sistema deve fazer ou não funcional como desempenho, segurança, usabilidade. Exemplo: "O sistema deve suportar 1000 usuários simultâneos".

### Regra de Negócio

 É uma diretriz, política ou restrição interna que governa as operações da organização, influenciando como os processos são executados.  Ela define condições como "se... então", "obrigatório", "somente quando". Exemplo: "Clientes com saldo negativo não podem realizar compras".

### Restrição

 É uma limitação que afeta a execução do projeto, como prazo, orçamento, recursos disponíveis ou requisitos contratuais.  Ela limita as decisões do gerente de projetos. Exemplo: "O projeto deve ser concluído em 3 meses com orçamento máximo de R$50.000".
