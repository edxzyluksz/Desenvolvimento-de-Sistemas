import os
import tkinter as tk
from tkinter import ttk, messagebox
import math


def calcular():
    try:
        base = float(base.get().replace(",", "."))
        altura = float(base.get().replace(",", "."))
    except ValueError:
        messagebox.showerror("Essa calculadora aceita somente números.")
        return
    
    resultado = None
    msg = ""
    perimetro = (base * 2) + (altura * 2)
    diagonal = math.sqrt((base ** 2) + (altura **2))

janela = tk.Tk()
janela.title("Calculadora Tkinter")
janela.geometry("420x380")
janela.resizable(False, False)

frame_calc = ttk.Frame(janela, padding="15")

titulo = ttk.Label(
    textvariable="Calculadora de Retângulos",
    font=('Arial', 20)
)

ttk.Label(frame_calc, text="\nDigite o primeiro número:").pack()
#ttk.Entry(frame_calc, textvariable=).pack()

ttk.Label(frame_calc, text="Digite o segundo número:").pack()
#ttk.Entry(frame_calc, textvariable=num2_var).pack()

ttk.Button(frame_calc, text="Calcular", command=calcular).pack(pady=10)

resultado_label = ttk.Label(frame_calc, text="", font=("Arial", 12))
resultado_label.pack(pady=10)

janela.mainloop()
