import React, { useState } from 'react';
import { Search, Package, ArrowLeftRight, AlertCircle, CheckCircle } from 'lucide-react';

export function ListaProdutos({ produtos = [], onMovimentarItem, onAbrirModalNovoProduto }) {
  const [busca, setBusca] = useState('');

  const produtosFiltrados = produtos.filter(
    (p) =>
      p.nome.toLowerCase().includes(busca.toLowerCase()) ||
      p.sku.toLowerCase().includes(busca.toLowerCase())
  );

  function getStatusBadge(quantidade) {
    const qtd = Number(quantidade) || 0;
    if (qtd === 0) {
      return (
        <span className="badge badge-stock-empty">
          <AlertCircle size={12} /> Esgotado (0)
        </span>
      );
    }
    if (qtd <= 10) {
      return (
        <span className="badge badge-stock-low">
          <AlertCircle size={12} /> Estoque Baixo ({qtd})
        </span>
      );
    }
    return (
      <span className="badge badge-stock-ok">
        <CheckCircle size={12} /> Normal ({qtd})
      </span>
    );
  }

  return (
    <div className="card">
      <div className="card-header">
        <div>
          <h2 className="card-title">
            <Package size={20} className="text-primary" />
            Catálogo & Inventário do Almoxarifado
          </h2>
          <div className="card-subtitle">
            Acompanhamento de saldo e controle de produtos armazenados
          </div>
        </div>

        {/* Barra de Busca */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
          <div style={{ position: 'relative', width: '280px' }}>
            <Search
              size={16}
              style={{
                position: 'absolute',
                left: '12px',
                top: '50%',
                transform: 'translateY(-50%)',
                color: 'var(--slate-400)',
              }}
            />
            <input
              type="text"
              className="form-control"
              placeholder="Buscar por nome ou SKU..."
              value={busca}
              onChange={(e) => setBusca(e.target.value)}
              style={{ paddingLeft: '36px' }}
            />
          </div>
        </div>
      </div>

      <div className="card-body" style={{ padding: 0 }}>
        <div className="table-responsive">
          <table className="custom-table">
            <thead>
              <tr>
                <th>ID</th>
                <th>Nome do Produto</th>
                <th>Código SKU</th>
                <th>Qtd. em Estoque</th>
                <th>Status</th>
                <th style={{ textAlign: 'right' }}>Ações</th>
              </tr>
            </thead>
            <tbody>
              {produtosFiltrados.length === 0 ? (
                <tr>
                  <td colSpan="6" style={{ textAlign: 'center', padding: '40px', color: 'var(--slate-500)' }}>
                    Nenhum produto encontrado correspondente à busca "{busca}".
                  </td>
                </tr>
              ) : (
                produtosFiltrados.map((produto) => (
                  <tr key={produto.id}>
                    <td style={{ fontWeight: 600, color: 'var(--slate-400)' }}>#{produto.id}</td>
                    <td style={{ fontWeight: 600, color: 'var(--slate-900)' }}>{produto.nome}</td>
                    <td>
                      <code
                        style={{
                          backgroundColor: 'var(--slate-100)',
                          padding: '3px 8px',
                          borderRadius: '4px',
                          fontSize: '0.8rem',
                          color: 'var(--slate-700)',
                        }}
                      >
                        {produto.sku}
                      </code>
                    </td>
                    <td>
                      <span style={{ fontWeight: 700, fontSize: '0.95rem' }}>
                        {produto.quantidade_estoque}
                      </span>{' '}
                      <span style={{ fontSize: '0.75rem', color: 'var(--slate-500)' }}>unidades</span>
                    </td>
                    <td>{getStatusBadge(produto.quantidade_estoque)}</td>
                    <td style={{ textAlign: 'right' }}>
                      <button
                        type="button"
                        className="btn btn-outline btn-sm"
                        onClick={() => onMovimentarItem(produto.id)}
                        title="Movimentar Entrada ou Saída deste item"
                      >
                        <ArrowLeftRight size={14} />
                        Movimentar
                      </button>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
