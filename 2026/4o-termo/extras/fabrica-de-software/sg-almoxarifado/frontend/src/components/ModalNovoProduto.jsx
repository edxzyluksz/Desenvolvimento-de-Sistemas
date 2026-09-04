import React, { useState } from 'react';
import { api } from '../services/api';
import { X, PlusCircle, AlertCircle } from 'lucide-react';

export function ModalNovoProduto({ aberto, onFechar, onProdutoCriado }) {
  const [nome, setNome] = useState('');
  const [sku, setSku] = useState('');
  const [quantidade, setQuantidade] = useState('');
  const [erro, setErro] = useState('');
  const [salvando, setSalvando] = useState(false);

  if (!aberto) return null;

  async function handleSubmit(e) {
    e.preventDefault();
    setErro('');

    if (!nome.trim() || !sku.trim()) {
      setErro('Nome do produto e código SKU são obrigatórios.');
      return;
    }

    const qtd = Number(quantidade) || 0;
    if (qtd < 0) {
      setErro('A quantidade inicial não pode ser negativa.');
      return;
    }

    setSalvando(true);

    try {
      await api.criarProduto({
        nome: nome.trim(),
        sku: sku.trim().toUpperCase(),
        quantidade_estoque: qtd,
      });

      // Limpa e fecha
      setNome('');
      setSku('');
      setQuantidade('');
      onProdutoCriado();
      onFechar();
    } catch (err) {
      setErro('Erro ao salvar o novo produto. Verifique a conexão com a API.');
      console.error(err);
    } finally {
      setSalvando(false);
    }
  }

  return (
    <div className="modal-overlay" onClick={onFechar}>
      <div className="modal-content" onClick={(e) => e.stopPropagation()}>
        <div className="card-header" style={{ padding: '16px 20px' }}>
          <div className="card-title" style={{ fontSize: '1rem' }}>
            <PlusCircle size={18} className="text-primary" />
            Cadastrar Novo Produto
          </div>
          <button
            type="button"
            className="btn btn-outline btn-sm"
            onClick={onFechar}
            style={{ padding: '4px 8px', border: 'none' }}
          >
            <X size={18} />
          </button>
        </div>

        <div className="card-body" style={{ padding: '20px' }}>
          {erro && (
            <div className="alert alert-danger" style={{ padding: '10px 12px', fontSize: '0.8125rem' }}>
              <AlertCircle size={16} />
              <div>{erro}</div>
            </div>
          )}

          <form onSubmit={handleSubmit}>
            <div className="form-group">
              <label className="form-label">Nome do Produto / Item:</label>
              <input
                type="text"
                className="form-control"
                placeholder="Ex: Capacete de Segurança com Jugular"
                value={nome}
                onChange={(e) => setNome(e.target.value)}
                required
              />
            </div>

            <div className="form-group">
              <label className="form-label">Código SKU / Referência:</label>
              <input
                type="text"
                className="form-control"
                placeholder="Ex: EPI-CAP-105"
                value={sku}
                onChange={(e) => setSku(e.target.value)}
                required
              />
            </div>

            <div className="form-group">
              <label className="form-label">Estoque Inicial (Unidades):</label>
              <input
                type="number"
                min="0"
                className="form-control"
                placeholder="0"
                value={quantidade}
                onChange={(e) => setQuantidade(e.target.value)}
              />
            </div>

            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '10px', marginTop: '20px' }}>
              <button type="button" className="btn btn-outline" onClick={onFechar}>
                Cancelar
              </button>
              <button type="submit" disabled={salvando} className="btn btn-primary">
                {salvando ? 'Salvando...' : 'Salvar Produto'}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
