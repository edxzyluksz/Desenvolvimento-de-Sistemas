import tkinter as tk
from tkinter import ttk

#-- VARIÁVEL GLOBAL PARA O TEXTO --
# Deve ser definida antes da função para que a função possa acessá-la e alterá-la
# Usamos tk.StringVar para que o Tkinter monitore as mudanças nesta variável

texto_dinamico = None # Será inicializada abaixo

def alterar_texto():
    """Altera o texto do rótulo manipulando a tk.StringVar."""
    #Obtém o valor atual da variável usando .get()
    texto_atual = texto_dinamico.get()
    
    if texto_atual == "Clique no botão abaixo!":
        # Altera o valor da variável usando .set()
        texto_dinamico.set("O texto mudou! Bem-vindo ao Tkinter!")
    else:
        #Altera o valor de volta
        texto_dinamico.set("Clique no botão abaixo!")

# --- 1. CONFIGURAÇÃO DA JANELA PRINCIPAL ---
janela = tk.Tk()
janela.title("Exemplo Tkinter Top Sucesso!!!")
janela.geometry("400x150")

# Inicializa a variável tk.StringVar que será manipulada pela função
texto_dinamico = tk.StringVar(value="Clique no botão abaixo!")


# --- 2. CRIAÇÃO DOS WIDGETS ---
frame_principal = ttk.Frame(janela, padding="10")
frame_principal.grid(row=0,column=0, sticky="nsew")

# Cria o rótulo (Label) e o VINCULA à variável texto_dinamico
# Usamos textvariable=texto_dinamico
label_mensagem = ttk.Label(
    frame_principal,
    textvariable=texto_dinamico, # Agora o Label lê o valor desta variável
    font=("Arial", 14)
)
label_mensagem.grid(row=0,column=0,pady=20,sticky="n")

# Cria o botão (Button)
botao_acao = ttk.Button(frame_principal, text="Alterar Mensagem", command=alterar_texto)
botao_acao.grid(row=1,column=0,pady=10)


# 3. --- CONFIGURAÇÃO DE LAYOUT E LOOP
janela.columnconfigure(0, weight=1)
janela.rowconfigure(0, weight=1)
frame_principal.columnconfigure(0, weight=1)

janela.mainloop()

# Este código estava incorreto, no entanto, o ChatGPT me avisou que necessitava 2 pontos de exclamação e alterar o valor da row de button para nao sobrepôr.