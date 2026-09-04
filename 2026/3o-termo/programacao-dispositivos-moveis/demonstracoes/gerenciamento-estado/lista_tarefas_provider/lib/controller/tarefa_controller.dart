import "package:flutter/material.dart";
import "package:lista_tarefas_provider/model/tarefa.dart";

class TarefaController extends ChangeNotifier {
  // ChangeNotifier -> Classe do Provider
  // Tarefas Controller está herdando elementos da ChanceNotifier
  // Herda o método notifierListener()

  // Atributos
  // Lista para armazenar as tarefas criadas
  final List<Tarefa> _tarefas = []; // Atributo privado

  // Getter
  List<Tarefa> get tarefas => _tarefas;
  // Método get para acessar os dados da

  // Métodos CRUD
  // Adicionar tarefa (create)

  void criarTarefa(String titulo) {
    if (titulo.trim().isEmpty) return;

    _tarefas.add(Tarefa(titulo: titulo.trim()));

    notifyListeners();
  }

  // Alterar tarefa (Update)
  void alterarTarefa(int index) {
    _tarefas[index].concluida = !_tarefas[index].concluida;
    notifyListeners();
  }

  // Remover tarefa (Delete)
  void removerTarefa(int index) {
    // Void -> Função que não tem return
    // Busca a tarefa e remove da lista
    _tarefas.removeAt(index);
    notifyListeners();
  }

  // Criando métricas para usar no DashboardPage
  // Calcular o total de tarefas
  // Calcula quantas tarefas tem no vetor
  int get totalTarefas => _tarefas.length;

  // int totalTarefas() {
  //   return _tarefas.length;
  // }

  // Total de Tarefas Concluídas
  int get totalTarefasConcluidas =>
      _tarefas.where((tarefa) => tarefa.concluida).length;

  // Total de Tarefas Pendentes
  int get totalTarefasPendentes =>
      _tarefas.where((tarefa) => !tarefa.concluida).length;

  // Porcentagem de Tarefas concluídas
  double get porcentagemTarefasConcluidas {
    if (_tarefas.isEmpty) return 0;
    return (totalTarefasConcluidas / totalTarefas) * 100;
  }
}
