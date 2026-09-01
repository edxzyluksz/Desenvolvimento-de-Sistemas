/**
 * Serviço de Integração com o Back-end Mock (json-server)
 * Porta padrão do json-server: 3001
 */

const BASE_URL = 'http://localhost:3001';

async function handleResponse(response) {
  if (!response.ok) {
    const errorText = await response.text();
    throw new Error(`Erro na requisição (${response.status}): ${errorText || response.statusText}`);
  }
  return response.json();
}

export const api = {
  // ==========================================
  // USUÁRIOS
  // ==========================================
  async getUsuarios() {
    const response = await fetch(`${BASE_URL}/usuarios`);
    return handleResponse(response);
  },

  async getUsuarioById(id) {
    const response = await fetch(`${BASE_URL}/usuarios/${id}`);
    return handleResponse(response);
  },

  // ==========================================
  // PRODUTOS (INVENTÁRIO)
  // ==========================================
  async getProdutos() {
    const response = await fetch(`${BASE_URL}/produtos`);
    return handleResponse(response);
  },

  async getProdutoById(id) {
    const response = await fetch(`${BASE_URL}/produtos/${id}`);
    return handleResponse(response);
  },

  async criarProduto(produto) {
    const response = await fetch(`${BASE_URL}/produtos`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        ...produto,
        quantidade_estoque: Number(produto.quantidade_estoque || 0),
      }),
    });
    return handleResponse(response);
  },

  /**
   * Atualização parcial da quantidade em estoque (PATCH)
   * Utilizado após o registro de movimentações de Entrada ou Saída
   */
  async atualizarEstoqueProduto(id, novaQuantidade) {
    const response = await fetch(`${BASE_URL}/produtos/${id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        quantidade_estoque: Number(novaQuantidade),
      }),
    });
    return handleResponse(response);
  },

  // ==========================================
  // MOVIMENTAÇÕES (AUDITORIA / HISTÓRICO)
  // ==========================================
  async getMovimentacoes() {
    // Busca movimentações ordenadas pela data decrescente (mais recentes primeiro)
    const response = await fetch(`${BASE_URL}/movimentacoes?_sort=data&_order=desc`);
    return handleResponse(response);
  },

  /**
   * Registra a movimentação no histórico
   */
  async registrarMovimentacao(movimentacao) {
    const response = await fetch(`${BASE_URL}/movimentacoes`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        produto_id: String(movimentacao.produto_id),
        usuario_id: String(movimentacao.usuario_id),
        tipo: movimentacao.tipo, // 'entrada' | 'saida'
        quantidade_movimentada: Number(movimentacao.quantidade_movimentada),
        data: new Date().toISOString(),
      }),
    });
    return handleResponse(response);
  },
};
