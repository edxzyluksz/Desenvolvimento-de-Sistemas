package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import model.Aluno;
import model.Professor;

public class CursoController {
    // Classe que vai realziar a interação entre os modelos e a inferface view

    // Atributos
    private String nomeCurso;
    private Professor professor; // Instanciar um obj da classe professor
    private List<Aluno> alunosList;

    // Métodos
    // Ctor
    // Na criação do curso, deve-se passar o nome do curso e o professor do curso
    public CursoController(String nomeCurso, Professor professor) {
        this.nomeCurso = nomeCurso;
        this.professor = professor;
        this.alunosList = new ArrayList<>(); // Vetor de objetos Alunos
    }

    // Crud - Create, Read, Update, Delete
    // 1. Adicionar um aluno
    public void adicionarAluno (Aluno aluno){
        alunosList.add(aluno);
    }

    // 2. Exibir curso
    public void infoCurso(){
        System.out.println("Nome Curso: " + nomeCurso);
        System.out.println("Professor: " + professor.getNome());
        System.out.println("===================================");
        // Imprimir a lista de alunos
        for (Aluno aluno : alunosList) {
            System.out.println(aluno.getNome());
        }
    }
    // 3. Update
    // Lançar de nota de aluno por aluno já cadastrado
    public void lancarNotas(Scanner sc){
        for (Aluno aluno : alunosList) {
            System.out.println("Informe a nota para " + aluno.getNome());
            aluno.setNota(sc.nextDouble());
        }
    }

    // Ver notas dos alunos
    public void statusCurso(){
        System.out.println("Nome Curso: " + nomeCurso);
        System.out.println("Professor: " + professor.getNome());
        System.out.println("===================================");
        // Imprimir a lista de alunos
        for (Aluno aluno : alunosList) {
            System.out.println(aluno.getNome() + "| Nota: " + aluno.getNota());
        }
    }

    // 4. Delete
}
