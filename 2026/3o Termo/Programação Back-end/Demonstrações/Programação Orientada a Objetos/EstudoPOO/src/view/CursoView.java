package view;

import java.util.Scanner;

import controller.CursoController;
import model.Aluno;
import model.Professor;

public class CursoView {
    // Atributo
    // Instanciar um objeto de Professor
    Professor jp = new Professor("João Pereira", "123.456", "10/10/1910", 15000.00);
    // Instanciar objeto de CursoController
    CursoController cursoJava = new CursoController("Programação Java", jp);
    
    // Métodos view (Tela interativa CLI)
    int operacao; // Escolher ação
    boolean continuar = true; // Continuar ação
    Scanner sc = new Scanner(System.in); // Entrada de dados

    public void menu() {
        while (continuar) {
            System.out.println("=== Gerenciamento de Curso ===");
            System.out.println("1. Cadastrar Aluno");
            System.out.println("2. Informação do Curso");
            System.out.println("3. Lançar Nota dos Alunos");
            System.out.println("4. Status da Turma");
            System.out.println("5. Sair");
            System.out.println("== Escolha Opção Desejada");
            operacao = sc.nextInt();
            switch (operacao) {
                case 1:
                    Aluno aluno = cadastrarAluno();
                    cursoJava.adicionarAluno(aluno);
                    break;
                case 2:
                    cursoJava.infoCurso();
                    break;
                case 3:
                    cursoJava.lancarNotas(sc);
                    break;
                case 4:
                    cursoJava.statusCurso();
                    break;
                case 5:
                    System.out.println("Saindo...");
                    continuar = false;
                    break;
                default:
                    System.out.println("Informe uma opção válida");
                    break;
            }
        }
    }

    private Aluno cadastrarAluno() {
        System.out.println("Digite o Nome do Aluno");
        String nome = sc.next();
        System.out.println("Informe o CPF do Aluno");
        String cpf = sc.next();
        System.out.println("Informe a Data de Nascimento do Aluno");
        String dataNasc = sc.next();
        System.out.println("Informe a Matrícula do Aluno");
        String matricula = sc.next();
        return new Aluno(nome, cpf, dataNasc, matricula);
    }
}
