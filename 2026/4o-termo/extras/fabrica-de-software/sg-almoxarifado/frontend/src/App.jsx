import React, { useState, useEffect } from 'react';
import { api } from './services/api';
import { Navbar } from './components/Navbar';
import { DashboardStats } from './components/DashboardStats';
import { FormularioMovimentacao } from './components/FormularioMovimentacao';
import { ListaProdutos } from './components/ListaProdutos';
import { HistoricoMovimentacoes } from './components/HistoricoMovimentacoes';
import { ModalNovoProduto } from './components/ModalNovoProduto';
import { AlertCircle, RefreshCw } from 'lucide-react';

export function App() {
  const [abaAtiva, setAbaAtiva] = useState('dashboard');
  const [produtos, setProdutos] = useState([]);
  const [usuarios, setUsuarios] = useState([]);
  const [movimentacoes, setMovimentacoes] = useState([]);
  
  const [carregando, setCarregando] = useState(true);
  const [erroApi, setErroApi] = useState('');
  const [modalProdutoAberto, setModalProdutoAberto] = useState(false);
  const [produtoSelecionadoParaMovimentacao, setProdutoSelecionadoParaMovimentacao] = useState('');

  // Carrega todos os dados iniciais do json-server
  useEffect(() => {
    carregarDados();
  }, []);

  async function carregarDados() {
    setCarregando(true);
    setErroApi('');
    try {
      const [dadosProdutos, dadosUsuarios, dadosMovimentacoes] = await Promise.all([
        api.getProdutos(),
        api.getUsuarios(),
        api.getMovimentacoes(),
      ]);
      setProdutos(dadosProdutos);
      setUsuarios(dadosUsuarios);
      setMovimentacoes(dadosMovimentacoes);
    } catch (err) {
      console.error('Falha ao conectar com o backend:', err);
      setErroApi(
        'Não foi possível conectar ao servidor da API (json-server). Verifique se ele está rodando na porta 3001.'
      );
    } finally {
      setCarregando(false);
    }
  }

  function handleMovimentarItem(produtoId) {
    setProdutoSelecionadoParaMovimentacao(produtoId);
    setAbaAtiva('movimentacao');
  }

  return (
    <div className="app-container">
      {/* Navbar Superior */}
      <Navbar
        abaAtiva={abaAtiva}
        setAbaAtiva={(aba) => {
          setAbaAtiva(aba);
          if (aba !== 'movimentacao') {
            setProdutoSelecionadoParaMovimentacao('');
          }
        }}
        onAbrirModalNovoProduto={() => setModalProdutoAberto(true)}
      />

      {/* Conteúdo Principal */}
      <main className="main-content">
        {/* Banner de Erro de Conexão com API */}
        {erroApi && (
          <div className="alert alert-danger" style={{ justifyContent: 'space-between' }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
              <AlertCircle size={20} />
              <div>
                <strong>Erro de Conexão:</strong> {erroApi}
              </div>
            </div>
            <button
              type="button"
              className="btn btn-outline btn-sm"
              onClick={carregarDados}
              style={{ borderColor: 'var(--danger-500)', color: 'var(--danger-700)' }}
            >
              <RefreshCw size={14} /> Tentar Novamente
            </button>
          </div>
        )}

        {/* Dashboard com Resumo de Indicadores (sempre visível no topo da visão geral) */}
        <DashboardStats produtos={produtos} movimentacoes={movimentacoes} />

        {/* Renderização Condicional por Aba */}
        {abaAtiva === 'dashboard' && (
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(460px, 1fr))', gap: '24px' }}>
            <FormularioMovimentacao
              produtos={produtos}
              usuarios={usuarios}
              onMovimentacaoSucesso={carregarDados}
              produtoPreSelecionadoId={produtoSelecionadoParaMovimentacao}
            />
            <ListaProdutos
              produtos={produtos}
              onMovimentarItem={handleMovimentarItem}
              onAbrirModalNovoProduto={() => setModalProdutoAberto(true)}
            />
          </div>
        )}

        {abaAtiva === 'movimentacao' && (
          <div style={{ maxWidth: '640px', margin: '0 auto' }}>
            <FormularioMovimentacao
              produtos={produtos}
              usuarios={usuarios}
              onMovimentacaoSucesso={carregarDados}
              produtoPreSelecionadoId={produtoSelecionadoParaMovimentacao}
            />
          </div>
        )}

        {abaAtiva === 'produtos' && (
          <ListaProdutos
            produtos={produtos}
            onMovimentarItem={handleMovimentarItem}
            onAbrirModalNovoProduto={() => setModalProdutoAberto(true)}
          />
        )}

        {abaAtiva === 'historico' && (
          <HistoricoMovimentacoes
            movimentacoes={movimentacoes}
            produtos={produtos}
            usuarios={usuarios}
          />
        )}
      </main>

      {/* Modal de Cadastro de Produto */}
      <ModalNovoProduto
        aberto={modalProdutoAberto}
        onFechar={() => setModalProdutoAberto(false)}
        onProdutoCriado={carregarDados}
      />

      {/* Rodapé do Sistema */}
      <footer className="footer">
        <strong>SG Almoxarifado</strong> — Sistema de Controle de Estoque com React & json-server | Senai / Fábrica de Software
      </footer>
    </div>
  );
}
export default App;
