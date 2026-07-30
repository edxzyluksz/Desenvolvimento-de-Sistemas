package com.example.escola_xyz.Model;

import java.io.Serializable;

import jakarta.persistence.*;

// Classe para conectar com o BD (Entidade do Banco)
// Colocar a anotação de entity

@Entity
public class Administrador implements Serializable{
    // Atributos
    @Id
    private String cpf;
    private String nome;
    private String email;
    private String senha;
    
    // Métodos Públicos (Getters and Setters)
    public String getCpf() {
        return cpf;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getSenha() {
        return senha;
    }
    public void setSenha(String senha) {
        this.senha = senha;
    }
}
