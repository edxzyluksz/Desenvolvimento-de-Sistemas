package model;

public class Aluno extends Pessoa {
    // ATRIBUTOS
    // Já tem os atributos (nome, cpf, dataNasc) da SuperClasse Pessoa
    private String matricula;
    private double nota;

    // Métodos
    // Construtor (sem a nota)
    public Aluno(String nome, String cpf, String dataNasc, String matricula) {
        super(nome, cpf, dataNasc);
        this.matricula = matricula;
    }

    // Getters and Setters
    public String getMatricula() {
        return matricula;
    }

    public double getNota() {
        return nota;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }
    
    // Exibir informações do aluno
    @Override // Polimorfismo de classe
    public void exibirInfo(){
        super.exibirInfo();
        System.out.println("Matrícula: " + matricula);
    }
}
