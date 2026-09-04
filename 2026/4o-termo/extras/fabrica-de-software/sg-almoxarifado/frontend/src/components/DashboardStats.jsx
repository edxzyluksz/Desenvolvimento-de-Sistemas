import React from 'react';
import { Package, Layers, AlertTriangle, ArrowUpDown } from 'lucide-react';

export function DashboardStats({ produtos = [], movimentacoes = [] }) {
  const totalProdutos = produtos.length;
  const totalUnidadesEstoque = produtos.reduce((acc, p) => acc + (Number(p.quantidade_estoque) || 0), 0);
  const produtosEstoqueBaixo = produtos.filter((p) => (Number(p.quantidade_estoque) || 0) <= 10).length;
  const totalMovimentacoes = movimentacoes.length;

  return (
    <div className="stats-grid">
      <div className="stat-card">
        <div className="stat-icon-box stat-icon-blue">
          <Package size={24} />
        </div>
        <div>
          <div className="stat-value">{totalProdutos}</div>
          <div className="stat-label">Produtos Cadastrados</div>
        </div>
      </div>

      <div className="stat-card">
        <div className="stat-icon-box stat-icon-green">
          <Layers size={24} />
        </div>
        <div>
          <div className="stat-value">{totalUnidadesEstoque.toLocaleString('pt-BR')}</div>
          <div className="stat-label">Total de Itens em Estoque</div>
        </div>
      </div>

      <div className="stat-card">
        <div className="stat-icon-box stat-icon-amber">
          <AlertTriangle size={24} />
        </div>
        <div>
          <div className="stat-value">{produtosEstoqueBaixo}</div>
          <div className="stat-label">Itens c/ Estoque Baixo (≤ 10)</div>
        </div>
      </div>

      <div className="stat-card">
        <div className="stat-icon-box stat-icon-purple">
          <ArrowUpDown size={24} />
        </div>
        <div>
          <div className="stat-value">{totalMovimentacoes}</div>
          <div className="stat-label">Movimentações Realizadas</div>
        </div>
      </div>
    </div>
  );
}
