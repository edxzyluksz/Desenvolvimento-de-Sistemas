package unidade.senai.edu.Model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.*;

@Entity
public class Categorias implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String nome;

    @OneToMany(mappedBy = "categoria", cascade = CascadeType.ALL)
    private List<Materiais> materiais;

    // Getters e Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public List<Materiais> getMateriais() { return materiais; }
    public void setMateriais(List<Materiais> materiais) { this.materiais = materiais; }
}