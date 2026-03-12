package unidade.senai.edu.Model;

import java.io.Serializable;
import jakarta.persistence.*;

@Entity
public class Ativos implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;
    private String descricao;
    private String localizacao;
    private boolean status; // true = ativo, false = inativo

    // Getters e Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
    public String getLocalizacao() { return localizacao; }
    public void setLocalizacao(String localizacao) { this.localizacao = localizacao; }
    public boolean isStatus() { return status; }
    public void setStatus(boolean status) { this.status = status; }
}