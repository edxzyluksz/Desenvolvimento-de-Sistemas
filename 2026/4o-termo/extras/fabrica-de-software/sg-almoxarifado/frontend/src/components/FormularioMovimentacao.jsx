import React, { useState } from 'react';
import { api } from '../services/api';
import { ArrowDownCircle, ArrowUpCircle, CheckCircle2, AlertCircle, RefreshCw } from 'lucide-react';

export function FormularioMovimentacao({
  produtos = [],
  usuarios = [],
  onMovimentacaoSucesso,
  produtoPreSelecionadoId = '',
}) {
  const [produtoId, setProdutoId] = useState(produtoPreSelecionadoId || '');
  const [usuarioId, setUsuarioId] = useState('');
  const [tipo, setTipo] = useState('entrada'); // 'entrada' | 'saida'
  const [quantidade, setQuantidade] = useState('');

  const [mensagemSucesso, setMensagemSucesso] = useState('');
  const [mensagemErro, setMensagemErro] = useState('');
  const [carregando, setCarregando] = useState(false);

  // Sincroniza se vier um produto pré-selecionado da listagem
  React.useEffect(() => {
    if (produtoPreSelecionadoId) {
      setProdutoId(String(produtoPreSelecionadoId));
    }
  }, [produtoPreSelecionadoId]);

  const produtoSelecionado = produtos.find((p) => String(p.id) === String(produtoId));

  /**
   * =========================================================================
   * REGRA DE NEGÓCIO: ATUALIZAÇÃO E CONTROLE DE ESTOQUE NO FRONT-END
   * =========================================================================
   */
  async function handleSubmit(e) {
    e.preventDefault();
    setMensagemErro('');
    setMensagemSucesso('');

    const qtdNumerica = Number(quantidade);

    // 1. Validações de campos obrigatórios
    if (!produtoId) {
      setMensagemErro('Por favor, selecione um produto para movimentar.');
      return;
    }

    if (!usuarioId) {
      setMensagemErro('Por favor, informe o responsável pela movimentação.');
      return;
    }

    if (isNaN(qtdNumerica) || qtdNumerica <= 0) {
      setMensagemErro('A quantidade movimentada deve ser um número maior que zero.');
      return;
    }

    if (!produtoSelecionado) {
      setMensagemErro('Produto selecionado não foi encontrado no catálogo.');
      return;
    }

    const estoqueAtual = Number(produtoSelecionado.quantidade_estoque) || 0;

    // 2. Validação da Regra de Negócio de Saída: Não permitir estoque negativo
    if (tipo === 'saida' && qtdNumerica > estoqueAtual) {
      setMensagemErro(
        `Operação Bloqueada! Saldo insuficiente. Estoque disponível: ${estoqueAtual} un | Solicitado: ${qtdNumerica} un.`
      );
      return;
    }

    // 3. Cálculo da nova quantidade em estoque
    const novoEstoque = tipo === 'entrada' ? estoqueAtual + qtdNumerica : estoqueAtual - qtdNumerica;

    setCarregando(true);

    try {
      // 4. PASSO 1: Registrar auditoria na entidade /movimentacoes (POST)
      await api.registrarMovimentacao({
        produto_id: produtoId,
        usuario_id: usuarioId,
        tipo,
        quantidade_movimentada: qtdNumerica,
      });

      // 5. PASSO 2: Atualizar o saldo físico no produto /produtos/:id (PATCH)
      await api.atualizarEstoqueProduto(produtoId, novoEstoque);

      // Feedback de sucesso
      setMensagemSucesso(
        `Movimentação de ${tipo.toUpperCase()} confirmada com sucesso! Produto: "${produtoSelecionado.nome}". Novo saldo em estoque: ${novoEstoque} un.`
      );

      // Limpa campos variáveis do formulário
      setQuantidade('');

      // Notifica o componente pai para sincronizar os dados da aplicação
      if (onMovimentacaoSucesso) {
        onMovimentacaoSucesso();
      }
    } catch (erro) {
      setMensagemErro('Falha ao comunicar com a API. Verifique se o json-server está em execução.');
      console.error('Erro na movimentação:', erro);
    } finally {
      setCarregando(false);
    }
  }

  return (
    <div className="card">
      <div className="card-header">
        <div>
          <h2 className="card-title">
            <RefreshCw size={20} className="text-primary" />
            Registrar Entrada / Saída de Estoque
          </h2>
          <div className="card-subtitle">
            Gera o registro de movimentação e atualiza o saldo do produto em tempo real
          </div>
        </div>
      </div>

      <div className="card-body">
        {mensagemErro && (
          <div className="alert alert-danger">
            <AlertCircle size={20} style={{ flexShrink: 0 }} />
            <div>{mensagemErro}</div>
          </div>
        )}

        {mensagemSucesso && (
          <div className="alert alert-success">
            <CheckCircle2 size={20} style={{ flexShrink: 0 }} />
            <div>{mensagemSucesso}</div>
          </div>
        )}

        <form onSubmit={handleSubmit}>
          {/* Seleção do Tipo: Entrada ou Saída */}
          <div className="form-group">
            <label className="form-label">Tipo de Movimentação:</label>
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '12px' }}>
              <button
                type="button"
                className={`btn ${tipo === 'entrada' ? 'btn-success' : 'btn-outline'}`}
                onClick={() => setTipo('entrada')}
                style={{ padding: '12px' }}
              >
                <ArrowUpCircle size={18} />
                Entrada (Adicionar ao Estoque)
              </button>

              <button
                type="button"
                className={`btn ${tipo === 'saida' ? 'btn-danger' : 'btn-outline'}`}
                onClick={() => setTipo('saida')}
                style={{ padding: '12px' }}
              >
                <ArrowDownCircle size={18} />
                Saída (Subtrair do Estoque)
              </button>
            </div>
          </div>

          {/* Seleção do Produto */}
          <div className="form-group">
            <label className="form-label">Produto:</label>
            <select
              className="form-control"
              value={produtoId}
              onChange={(e) => setProdutoId(e.target.value)}
              required
            >
              <option value="">-- Selecione o Produto no Almoxarifado --</option>
              {produtos.map((p) => (
                <option key={p.id} value={p.id}>
                  {p.nome} (SKU: {p.sku}) — Estoque Atual: {p.quantidade_estoque} un
                </option>
              ))}
            </select>
          </div>

          {/* Card informativo de saldo do produto selecionado */}
          {produtoSelecionado && (
            <div
              style={{
                backgroundColor: 'var(--slate-100)',
                padding: '12px 16px',
                borderRadius: 'var(--radius-md)',
                marginBottom: '18px',
                borderLeft: '4px solid var(--primary-500)',
                display: 'flex',
                justifyContent: 'space-between',
                alignItems: 'center',
              }}
            >
              <div>
                <div style={{ fontSize: '0.8125rem', color: 'var(--slate-500)' }}>Produto Selecionado</div>
                <div style={{ fontWeight: 700, color: 'var(--slate-800)' }}>{produtoSelecionado.nome}</div>
              </div>
              <div style={{ textAlign: 'right' }}>
                <div style={{ fontSize: '0.8125rem', color: 'var(--slate-500)' }}>Disponível</div>
                <div
                  style={{
                    fontWeight: 800,
                    fontSize: '1.1rem',
                    color: produtoSelecionado.quantidade_estoque <= 10 ? 'var(--danger-600)' : 'var(--primary-600)',
                  }}
                >
                  {produtoSelecionado.quantidade_estoque} un
                </div>
              </div>
            </div>
          )}

          {/* Seleção do Usuário Responsável */}
          <div className="form-group">
            <label className="form-label">Responsável pela Ação:</label>
            <select
              className="form-control"
              value={usuarioId}
              onChange={(e) => setUsuarioId(e.target.value)}
              required
            >
              <option value="">-- Selecione o Usuário Autorizado --</option>
              {usuarios.map((u) => (
                <option key={u.id} value={u.id}>
                  {u.nome} ({u.cargo})
                </option>
              ))}
            </select>
          </div>

          {/* Quantidade Movimentada */}
          <div className="form-group">
            <label className="form-label">Quantidade de Unidades:</label>
            <input
              type="number"
              className="form-control"
              min="1"
              value={quantidade}
              onChange={(e) => setQuantidade(e.target.value)}
              placeholder="Digite a quantidade a movimentar (ex: 10)"
              required
            />
          </div>

          {/* Botão de Confirmação */}
          <button
            type="submit"
            disabled={carregando}
            className={`btn ${tipo === 'entrada' ? 'btn-success' : 'btn-danger'}`}
            style={{ width: '100%', padding: '14px', marginTop: '10px' }}
          >
            {carregando ? (
              'Processando Operação...'
            ) : tipo === 'entrada' ? (
              <>
                <ArrowUpCircle size={18} /> Confirmar Entrada no Estoque
              </>
            ) : (
              <>
                <ArrowDownCircle size={18} /> Confirmar Saída do Estoque
              </>
            )}
          </button>
        </form>
      </div>
    </div>
  );
}
