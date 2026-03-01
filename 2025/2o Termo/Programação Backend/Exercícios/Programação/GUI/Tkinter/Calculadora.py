import tkinter as tk
from tkinter import ttk, messagebox

# --------------------------
#  Funções principais
# --------------------------

def validar_nome():
    """Valida o nome digitado e avança para a calculadora."""
    nome = nome_var.get().strip()

    if not nome.replace("'", " ").replace("-", " ").replace(" ", "").isalpha() or nome == "":
        messagebox.showerror("Erro", "Por favor, digite um nome válido!\n"
                             "Nomes não podem conter números ou caracteres especiais,\n"
                             "exceto hífen (-) e apóstrofo (').")
        return
    
    user_label.config(text=f"Usuário: {nome.title()}")
    frame_nome.pack_forget()   # Esconde a tela de nome
    frame_calc.pack(pady=20)   # Mostra a tela da calculadora


def calcular():
    """Executa o cálculo escolhido."""
    try:
        x = float(num1_var.get().replace(",", "."))
        y = float(num2_var.get().replace(",", "."))
    except ValueError:
        messagebox.showerror("Erro", "Esta calculadora aceita somente números.")
        return

    op = operacao_var.get()
    resultado = None
    msg = ""

    if op in ("+", "1"):
        resultado = x + y
        msg = f"{x} + {y} = {round(resultado, 2)}"
    elif op in ("-", "2"):
        resultado = x - y
        msg = f"{x} - {y} = {round(resultado, 2)}"
    elif op in ("*", "3"):
        resultado = x * y
        msg = f"{x} × {y} = {round(resultado, 2)}"
    elif op in ("/", "4"):
        if y == 0:
            msg = "Divisão por zero não é permitida!"
        else:
            resultado = x / y
            msg = f"{x} ÷ {y} = {round(resultado, 2)}"

    resultado_label.config(text=msg)


def reiniciar():
    """Reinicia o programa para outro usuário."""
    nome_var.set("")
    num1_var.set("")
    num2_var.set("")
    resultado_label.config(text="")
    frame_calc.pack_forget()
    frame_nome.pack(pady=30)


def sair():
    """Fecha a aplicação."""
    janela.destroy()


# --------------------------
#  Configuração da janela
# --------------------------

janela = tk.Tk()
janela.title("Calculadora Tkinter")
janela.geometry("420x380")
janela.resizable(False, False)

# --------------------------
#  Variáveis
# --------------------------
nome_var = tk.StringVar()
num1_var = tk.StringVar()
num2_var = tk.StringVar()
operacao_var = tk.StringVar(value="+")  # valor padrão

# --------------------------
#  Frame 1 — Nome do usuário
# --------------------------

frame_nome = ttk.Frame(janela, padding="15")
frame_nome.pack(pady=30)

ttk.Label(frame_nome, text="Bem-vindo, usuário!", font=("Arial", 16)).pack(pady=5)
ttk.Label(frame_nome, text="Digite o seu nome:", font=("Arial", 12)).pack()

ttk.Entry(frame_nome, textvariable=nome_var, width=30).pack(pady=8)
ttk.Button(frame_nome, text="Continuar", command=validar_nome).pack(pady=10)

# --------------------------
#  Frame 2 — Calculadora
# --------------------------

frame_calc = ttk.Frame(janela, padding="15")

user_label = ttk.Label(frame_calc, text="", font=("Arial", 12))
user_label.pack(pady=5)

ttk.Label(frame_calc, text="Escolha sua operação favorita:", font=("Arial", 12)).pack(pady=5)

operacoes = [("+  (1) Adição"),
             ("-  (2) Subtração"),
             ("*  (3) Multiplicação"),
             ("/  (4) Divisão")]

for texto in operacoes:
    ttk.Radiobutton(frame_calc, text=texto, value=texto[0], variable=operacao_var).pack(anchor="w")

# Campos numéricos
ttk.Label(frame_calc, text="\nDigite o primeiro número:").pack()
ttk.Entry(frame_calc, textvariable=num1_var).pack()

ttk.Label(frame_calc, text="Digite o segundo número:").pack()
ttk.Entry(frame_calc, textvariable=num2_var).pack()

# Botão de calcular
ttk.Button(frame_calc, text="Calcular", command=calcular).pack(pady=10)

# Resultado
resultado_label = ttk.Label(frame_calc, text="", font=("Arial", 12))
resultado_label.pack(pady=10)

# Botões de controle
botoes_frame = ttk.Frame(frame_calc)
botoes_frame.pack(pady=10)
ttk.Button(botoes_frame, text="Novo Usuário", command=reiniciar).grid(row=0, column=0, padx=10)
ttk.Button(botoes_frame, text="Sair", command=sair).grid(row=0, column=1, padx=10)

# --------------------------
#  Iniciar o loop
# --------------------------
janela.mainloop()
