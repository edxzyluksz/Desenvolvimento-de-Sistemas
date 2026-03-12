package unidade.senai.edu.Model;

import java.io.Serializable;
import java.time.LocalDateTime;
import jakarta.persistence.*;

@Entity
public class Movimentacoes implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int quantidade;
    private LocalDateTime dataMovimentacao;

    @ManyToOne
    @JoinColumn(name = "material_id")
    private Materiais material;

    @Column(nullable = false)
    private String tipo; // "ENTRADA" ou "SAÍDA"

    // Getters e Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public int getQuantidade() { return quantidade; }
    public void setQuantidade(int quantidade) { this.quantidade = quantidade; }
    public LocalDateTime getDataMovimentacao() { return dataMovimentacao; }
    public void setDataMovimentacao(LocalDateTime dataMovimentacao) { this.dataMovimentacao = dataMovimentacao; }
    public Materiais getMaterial() { return material; }
    public void setMaterial(Materiais material) { this.material = material; }
    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }
}