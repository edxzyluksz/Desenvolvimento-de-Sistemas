import tkinter as tk
from tkinter import messagebox

rotulo_resultado = None
entrada_1 = None
entrada_2 = None
entrada_3 = None

def verificacao():
    try:

        lado1 = float(entrada_1.get())
        lado2 = float(entrada_2.get())
        lado3 = float(entrada_3.get())
        resultado = ""
       
        if (lado1 + lado2 > lado3) and (lado2 + lado3 > lado1) and (lado3 + lado1 > lado2):
            
            if lado1 == lado2 and lado2 == lado3:
                resultado = 'Equilátero'
            elif lado1 == lado2 or lado1 == lado3 or lado2 == lado3:
                resultado = 'Isósceles'
            else:
                resultado = 'Escaleno'
        else:
            resultado = 'Não é possível um triângulo desse calibre...'
        
        rotulo_resultado.config(text=f"Resultado: {resultado}")

    except ValueError:
        messagebox.showerror("Erro", "Por favor, insira valores numéricos válidos")


def main():
    global entrada_1, entrada_2, entrada_3, rotulo_resultado

    janela = tk.Tk()
    janela.title("Classificador de Triângulos")
    janela.geometry("300x400")

    tk.Label(janela,text="Primeiro Lado").pack(pady=5)
    entrada_1 = tk.Entry(janela)
    entrada_1.pack()

    tk.Label(janela,text="Segundo Lado").pack(pady=5)
    entrada_2 = tk.Entry(janela)
    entrada_2.pack()

    tk.Label(janela,text="Terceiro Lado").pack(pady=5)
    entrada_3 = tk.Entry(janela)
    entrada_3.pack()

    botao_calcular = tk.Button(janela,text="Calcular",command=verificacao)
    botao_calcular.pack(pady=20)

    rotulo_resultado = tk.Label(janela, text="Resultado: ", font=('Arial', 12, 'bold'))
    rotulo_resultado.pack(pady=10)

    janela.mainloop()

if __name__ == '__main__':
    main()