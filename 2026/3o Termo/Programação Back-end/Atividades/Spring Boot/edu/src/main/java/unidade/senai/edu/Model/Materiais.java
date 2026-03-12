package unidade.senai.edu.Model;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.*;

@Entity
public class Materiais implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nome;

    private String descricao;
    private int quantidade;

    @ManyToOne
    @JoinColumn(name = "categoria_id")
    private Categorias categoria;

    @OneToMany(mappedBy = "material", cascade = CascadeType.ALL)
    private List<Movimentacoes> movimentacoes;

    // Getters e Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
    public int getQuantidade() { return quantidade; }
    public void setQuantidade(int quantidade) { this.quantidade = quantidade; }
    public Categorias getCategoria() { return categoria; }
    public void setCategoria(Categorias categoria) { this.categoria = categoria; }
    public List<Movimentacoes> getMovimentacoes() { return movimentacoes; }
    public void setMovimentacoes(List<Movimentacoes> movimentacoes) { this.movimentacoes = movimentacoes; }
}