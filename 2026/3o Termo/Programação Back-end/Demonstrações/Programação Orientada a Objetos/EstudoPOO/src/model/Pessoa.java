package model; // Atributos protegidos ficam acessíveis somente na package

public abstract class Pessoa { // Encapsulamento
    // Atributos Privados - só podem ser acessados pela classe
    // Outras classes e métodos não conseguem acessar esses atributos
    private String nome;
    private String cpf;
    private String dataNasc;

    // Métodos públicos

    // Construtor
    public Pessoa(String nome, String cpf, String dataNasc) {
        this.nome = nome;
        this.cpf = cpf;
        this.dataNasc = dataNasc;
    }

    // Criação dos getters and setter

    // Já que os atributos são privados, só é possível manipulá-los através destes métodos públicos

    public String getNome() {
        return nome;
    }

    public String getCpf() {
        return cpf;
    }

    public String getDataNasc() {
        return dataNasc;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public void setDataNasc(String dataNasc) {
        this.dataNasc = dataNasc;
    }
    public void exibirInfo(){
        System.out.println("Nome: " + nome);
        System.out.println("CPF: " + cpf);
    }
}
