from dash import Dash, dcc, html, Input, Output
import pandas as pd
import plotly.express as px

# 1. Inicia o aplicativo Dash
# 'name' é o nome do módulo principal
app = Dash(__name__)

# 2. DEFINIÇÃO DO LAYOUT
# O layout define a estrutura visual da página usando componentes

app.layout = html.Div([
    # Título (Usamos um componente HTML)
    html.H1(children='Dash - Reatividade Simples', style={'textAlign': 'center'}),

    # Componente de entrada (Dash Core COmponents)
    html.Div(children='Digite um número:', style={'marginTop': 20,'marginBottom': 10}),

    #dcc.Input é o widget de entrada de texto
    dcc.Input(
        id='entrada-numero',
        type='number', # Define que o tipo de entrada é número
        value=5, #Valor inicial
        style={'fontSize': 16}
    ),
# Rótulo de Saída (Onde o resultado será exibido)
html.Div(id='saida-resultado', style={'marginTop': 20, 'fontSize': 20, 'color': 'darkblue'})
])

# 3. DEFINIÇÃO DO CALLBACK (A LÓGICA DE INTERAÇÃO)
@app.callback(
# OUTPUT: Onde o resultado será exibido
Output(component_id='saida-resultado', component_property='children'),
# INPUT: De qual componente e propriedade o valor será lido
Input(component_id='entrada-numero', component_property='value')
)

def atualizar_saida(valor_de_entrada):
    try:
        # Se o valor for válido (não nulo), calcula o quadrado
        numero = float(valor_de_entrada)
        resultado = numero ** 2
        return f'O quadrado de {numero} é {resultado:.2f}'
    except:
        # Retorna uma mensagem de erro se a entrada não for um número válido
        return 'Por favor, insira um número válido.'


# 4. INICIA O SERVIDOR
if __name__ == '__main__':
    # Roda o aplicativo ao modo debug para ver as alterações em tempo real
    app.run(debug=True)