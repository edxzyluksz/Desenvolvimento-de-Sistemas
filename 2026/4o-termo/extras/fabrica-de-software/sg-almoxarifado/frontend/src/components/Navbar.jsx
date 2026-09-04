import React from 'react';
import { Package, ArrowLeftRight, Boxes, History, PlusCircle } from 'lucide-react';

export function Navbar({ abaAtiva, setAbaAtiva, onAbrirModalNovoProduto }) {
  return (
    <header className="navbar">
      <div className="navbar-inner">
        {/* Brand */}
        <div className="brand">
          <div className="brand-icon-wrapper">
            <Package size={24} />
          </div>
          <div>
            <div className="brand-title">SG Almoxarifado</div>
            <div className="brand-subtitle">Gestão de Inventário & Estoque</div>
          </div>
        </div>

        {/* Navigation Tabs */}
        <nav className="nav-tabs">
          <button
            type="button"
            className={`nav-tab-btn ${abaAtiva === 'dashboard' ? 'active' : ''}`}
            onClick={() => setAbaAtiva('dashboard')}
          >
            <Boxes size={16} />
            Visão Geral
          </button>

          <button
            type="button"
            className={`nav-tab-btn ${abaAtiva === 'movimentacao' ? 'active' : ''}`}
            onClick={() => setAbaAtiva('movimentacao')}
          >
            <ArrowLeftRight size={16} />
            Movimentação
          </button>

          <button
            type="button"
            className={`nav-tab-btn ${abaAtiva === 'produtos' ? 'active' : ''}`}
            onClick={() => setAbaAtiva('produtos')}
          >
            <Package size={16} />
            Produtos
          </button>

          <button
            type="button"
            className={`nav-tab-btn ${abaAtiva === 'historico' ? 'active' : ''}`}
            onClick={() => setAbaAtiva('historico')}
          >
            <History size={16} />
            Histórico
          </button>
        </nav>

        {/* Action Button & Status */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
          <button
            type="button"
            className="btn btn-primary btn-sm"
            onClick={onAbrirModalNovoProduto}
          >
            <PlusCircle size={16} />
            Novo Produto
          </button>

          <div className="status-badge online" title="API json-server conectada na porta 3001">
            <span className="status-dot"></span>
            API Online
          </div>
        </div>
      </div>
    </header>
  );
}
