import sys
# A única diferença significativa é que importamos do PySide6
from PySide6.QtWidgets import QApplication, QWidget, QLabel, QPushButton
from PySide6.QtGui import QFont
from PySide6.QtCore import Qt # Necessário para o alinhamento

#1. Definir a classe da Janela Principal (Herda de QWidget)
class MinhaJanela(QWidget):
    
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Exemplo PySide com Botão Fechar")
        self.setGeometry(100, 100, 450, 250) # Aumentamos um pouco o tamanho
        self.iniciar_componentes()
    
    def iniciar_componentes(self):
        # -- RÓTULO (LABEL) ---
        label = QLabel("Olá, PySide!", self)
        label.setFont(QFont('Arial', 24))
        # Centralizando o rótulo
        label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        #Posiciona o rótulo
        label.setGeometry(50, 50, 350, 50)

        # --- BOTÃO FECHAR (QPushButton)---
        botao_fechar = QPushButton('Fechar', self)
        botao_fechar.setFont(QFont('Arial', 12))

        # Posiciona o botão (x, y, largura, altura)
        botao_fechar.setGeometry(150, 150, 150, 40)

        # CONEXÃO: Conecta o sinal 'clicked' do botão ao método 'close' da janela.
        # O método self.close() é um método padrão de QWidget que fecha a janela.
        botao_fechar.clicked.connect(self.close)

# -- 2. EXECUTAR A APLICAÇÃO ---
if __name__ == '__main__':
    # Garante que o aplicativo seja executado corretamente em diferentes ambientes
    app = QApplication(sys.argv)

    # Cria e exibe a janela
    janela_principal = MinhaJanela()
    janela_principal.show()

    # Inicia o loop de eventos
    sys.exit(app.exec())