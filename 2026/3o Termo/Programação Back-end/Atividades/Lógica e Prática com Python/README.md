# Atividade: Lógica e Prática com Python 1. Reforçando a Lógica (Vídeos Visuais)

## DIOGO TAKAMORI BARBOSA

> Atividade de revisão opcional

1. Assista a estes dois vídeos que explicam a lógica e as variáveis de forma bem simples:
    - A Receita do Computador: Introdução à Lógica de Programação — Veja como a lógica é como um passo a passo para o computador.
        - https://www.youtube.com/watch?v=jBIPvXHRYpg&themeRefresh=1
    - As Caixinhas Mágicas: O que são Variáveis — Entenda como o computador guarda informações como nomes e números.
        - https://www.youtube.com/watch?v=Ns3gMxgXpVo
2. Passo a Passo: Preparando o seu VS Code
    - O VS Code é a ferramenta onde escrevemos os códigos. Siga este roteiro para deixar tudo pronto:Instalação: Certifique-se de ter o Python instalado no seu computador e o VS Code.A Extensão de Python: No VS Code, clique no ícone de "Quadrados" (Extensões) na lateral esquerda, digite "Python" e clique em Instalar na opção da Microsoft.Criando seu primeiro arquivo:
        - Vá em Arquivo > Novo Arquivo;
        - Salve o arquivo com o nome meu_robo.py (o final .py é muito importante!);
        - Rodando o código: Após escrever seu código, basta clicar no botão de Play (triângulo) que fica no canto superior direito da tela;
        Vídeo de Apoio: Como Instalar e Usar o Python no VS Code
        https://www.youtube.com/watch?v=REzeW0BedI8
3. Desafios

### Desafio 1: O Semáforo Inteligente
Agora que você já sabe como usar o VS Code, vamos praticar a lógica de decisão (IF e ELSE).
O Problema: Você precisa programar um semáforo.
Se a cor for "verde", o carro pode passar.

Se for qualquer outra cor, o carro deve parar.
### Desafio 2: O Sensor de Temperatura
Imagine que você está programando um ar-condicionado inteligente. Ele deve decidir se liga o resfriamento ou não.
A Regra: Se a temperatura for maior que 25, o computador deve mostrar: "Ligando o ar-condicionado". Se for menor, deve mostrar: "Temperatura agradável".
Dica de Vídeo: Como usar o IF e ELSE no Python (Canal: Hashtag Programação - Explicação bem direta).

### Desafio 3: O Sistema de Login (Senha Secreta)
Todo aluno usa senhas para acessar redes sociais ou jogos. Vamos criar uma trava de segurança.
Objetivo: Crie uma variável chamada senha_correta com o valor "1234".

A Lógica:
- Peça para o usuário digitar uma senha.
- SE a senha for igual a "1234", o Python diz: "Acesso Liberado! 🔓".
- SENÃO, o Python diz: "Senha Errada! Tente de novo. ❌".
- Ajuda Visual: Pense no IF como uma chave. Se a chave encaixa, a porta abre. Se não, ela continua trancada.
### Desafio 4: O Robô do Cinema (Múltiplas Escolhas)
Este é um desafio de "nível mestre". Às vezes, não temos apenas duas opções (sim ou não), mas várias. Vamos usar o elif (que é o "se não, mas se...").

O Cenário: O robô do cinema dá descontos baseados na idade:
- Se a idade for menor que 12, o ingresso custa R$ 10,00.
- Se a idade for maior que 60, o ingresso custa R$ 15,00.
- Para os outros, custa R$ 30,00.

Código Base para completar no VS Code:
``` python
    idade = 10
    if idade < 12:
        print("Ingresso: R$ 10,00")
    elif idade > 60:
        print("Ingresso: R$ 15,00")
    else:
        print("Ingresso: R$ 30,00")
```

**O que entregar?**
Você pode escolher a melhor forma para você: 
- Print da tela: Uma foto ou captura do seus códigos rodando no VS Code.
- Explicação em Vídeo: Grave um vídeo curto mostrando a tela e explicando: "Eu usei o if para o robô decidir o que fazer quando a luz muda".