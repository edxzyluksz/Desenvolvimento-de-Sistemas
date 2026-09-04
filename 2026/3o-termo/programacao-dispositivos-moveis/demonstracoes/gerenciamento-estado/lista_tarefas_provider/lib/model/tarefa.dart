// Modelagem dos Dados

class Tarefa {
  // Atributos
  String titulo; // Armazena o título da tarefa
  bool concluida; // Status da tarefa
  // Classe que armazena informações de data
  DateTime dataCriacao;

  // Tarefa(String titulo) {
  //   this.titulo = titulo;
  //   this.concluida = false;
  //   this.criacao = DateTime.now();
  // }

  Tarefa({required this.titulo, this.concluida = false, DateTime? dataCriacao})
    : dataCriacao = dataCriacao ?? DateTime.now();
  // se dataCriacao for null, atribui uma data DateTime.now() -> data atual

  // Se data de criação for nulo, atribui uma data DateTime.now()
}
