package com.example.rh.Model;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Funcionario implements Serializable {
    // Transformar a classe em Base para o DB

    // Serializable é uma interface que permite que 
    // os objetos da classe sejam convertidos em um formato que 
    // pode ser facilmente armazenado ou transmitido, como um arquivo ou uma rede. 
    // Isso é útil para persistência de dados, comunicação entre sistemas e 
    // outras operações que envolvem a transferência de objetos.
    private static final long serialVersionUID = 1L; 

    // Static - Atributo usado somente na classe
    // Final - Posso declarar um valor inicial, mas permite ser alterado somente uma vez.

    // Anotações para integração do JPA @
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String nome;
    private String email;
    
    public long getId() {
        return id;
    }
    public String getNome() {
        return nome;
    }
    public String getEmail() {
        return email;
    }
    public void setId(long id) {
        this.id = id;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public void setEmail(String email) {
        this.email = email;
    }

}
