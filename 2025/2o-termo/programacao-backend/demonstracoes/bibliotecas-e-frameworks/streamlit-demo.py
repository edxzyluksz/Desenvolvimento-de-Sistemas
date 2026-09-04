import streamlit as st
# 1-- Exibição de título e texto ---
st.title('Meu Primeiro App Streamlit')
st.write('Olá! Digite seu nome e clique em "Saudar" para ver a mágica.')

# --- 2. Criação de Widgets ---
# st.text_input cria uma caixa de texto e armazena o valor digitado na variável 'nome'
nome = st.text_input('Qual é o seu nome?', 'Visitante')

#st.button cria um botão. Ele retorna True se foi clicado, False caso contrário.
if st.button('Saudar'):
    # O código dentro deste 'if' será executado apenas quando o botão for clicado

    if nome and nome != 'Visitante':
        st.success(f'Olá, {nome}! Seja muito bem-vindo(a) ao Streamlit')
    else:
        st.warning('Por favor, digite um nome válido')

# --- 3.Demonstração de um Slider ---
# Adicionando outro widget para mostrar a reatividade automática
st.subheader('\nDemonstração de Reatividade:')
idade = st.slider('Selecione sua idade: ',0, 100, 25)

# Este texto é atualizado automaticamente sempre que você move o slider
st.info(f'Sua idade selecionada é: {idade} anos.')