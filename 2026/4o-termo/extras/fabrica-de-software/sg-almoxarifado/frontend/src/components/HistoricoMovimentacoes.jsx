import React from 'react';
import { History, ArrowUpRight, ArrowDownRight, Calendar, User, Package } from 'lucide-react';

export function HistoricoMovimentacoes({ movimentacoes = [], produtos = [], usuarios = [] }) {
  // Mapas para busca rápida de nome por ID
  const mapaProdutos = new Map(produtos.map((p) => [String(p.id), p]));
  const mapaUsuarios = new Map(usuarios.map((u) => [String(u.id), u]));

  function formatarData(dataIso) {
    if (!dataIso) return '-';
    try {
      const d = new Date(dataIso);
      return new Intl.DateTimeFormat('pt-BR', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit',
      }).format(d);
    } catch {
      return dataIso;
    }
  }

  return (
    <div className="card">
      <div className="card-header">
        <div>
          <h2 className="card-title">
            <History size={20} className="text-primary" />
            Histórico & Auditoria de Movimentações
          </h2>
          <div className="card-subtitle">
            Registro cronológico de todas as operações de Entrada e Saída executadas no almoxarifado
          </div>
        </div>
      </div>

      <div className="card-body" style={{ padding: 0 }}>
        <div className="table-responsive">
          <table className="custom-table">
            <thead>
              <tr>
                <th>ID</th>
                <th>Data / Hora</th>
                <th>Tipo</th>
                <th>Produto</th>
                <th>Qtd. Movimentada</th>
                <th>Responsável</th>
              </tr>
            </thead>
            <tbody>
              {movimentacoes.length === 0 ? (
                <tr>
                  <td colSpan="6" style={{ textAlign: 'center', padding: '40px', color: 'var(--slate-500)' }}>
                    Nenhuma movimentação registrada no histórico até o momento.
                  </td>
                </tr>
              ) : (
                movimentacoes.map((mov) => {
                  const produto = mapaProdutos.get(String(mov.produto_id));
                  const usuario = mapaUsuarios.get(String(mov.usuario_id));
                  const isEntrada = mov.tipo === 'entrada';

                  return (
                    <tr key={mov.id}>
                      <td style={{ fontWeight: 600, color: 'var(--slate-400)' }}>#{mov.id}</td>
                      <td>
                        <span style={{ display: 'inline-flex', alignItems: 'center', gap: '6px' }}>
                          <Calendar size={14} color="var(--slate-400)" />
                          {formatarData(mov.data)}
                        </span>
                      </td>
                      <td>
                        <span className={`badge ${isEntrada ? 'badge-entrada' : 'badge-saida'}`}>
                          {isEntrada ? <ArrowUpRight size={14} /> : <ArrowDownRight size={14} />}
                          {isEntrada ? 'ENTRADA' : 'SAÍDA'}
                        </span>
                      </td>
                      <td>
                        <div style={{ fontWeight: 600, color: 'var(--slate-900)' }}>
                          {produto ? produto.nome : `Produto ID #${mov.produto_id}`}
                        </div>
                        {produto && (
                          <div style={{ fontSize: '0.75rem', color: 'var(--slate-500)' }}>
                            SKU: {produto.sku}
                          </div>
                        )}
                      </td>
                      <td>
                        <span
                          style={{
                            fontWeight: 700,
                            color: isEntrada ? 'var(--success-700)' : 'var(--danger-700)',
                          }}
                        >
                          {isEntrada ? `+${mov.quantidade_movimentada}` : `-${mov.quantidade_movimentada}`} un
                        </span>
                      </td>
                      <td>
                        <div style={{ display: 'inline-flex', alignItems: 'center', gap: '6px' }}>
                          <User size={14} color="var(--slate-400)" />
                          <span>
                            {usuario ? (
                              <>
                                <strong>{usuario.nome}</strong>{' '}
                                <span style={{ fontSize: '0.75rem', color: 'var(--slate-500)' }}>
                                  ({usuario.cargo})
                                </span>
                              </>
                            ) : (
                              `Usuário ID #${mov.usuario_id}`
                            )}
                          </span>
                        </div>
                      </td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
