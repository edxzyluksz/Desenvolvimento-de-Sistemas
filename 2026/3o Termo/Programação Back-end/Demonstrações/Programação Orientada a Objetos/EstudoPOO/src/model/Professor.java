package model;

public class Professor extends Pessoa {
    // Atributos
    private double salario;

    // Métodos
    // Construtor
    public Professor(String nome, String cpf, String dataNasc, double salario){
        super(nome, cpf, dataNasc);
        this.salario = salario;
    }

    // Getters And Setters
    public double getSalario(){
        return salario;
    }
    public void setSalario(double salario){
        this.salario = salario;
    }

    // Exibir info 
    @Override
    public void exibirInfo(){
        super.exibirInfo();
        System.out.println("Salário: R$" + salario);
    }
}