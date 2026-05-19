// Modelagem de dados

class Nota {
  // Atributos
  final int? id; // '?' Permitir que a variável seja nula
  // Em um primeiro momento, a variável é nula
  // Somente quando cair no DB irá receber um valor para o ID
  final String titulo;
  final String conteudo;

  // Construtor
  Nota({this.id, required this.titulo, required this.conteudo});

 // Metódos de Serialização de Dados [toMap(), fromMap()]

 // toMap() => converter um obj da Classe Nota para MAP (inserir dados no DB)
 Map<String, dynamic> toMap(){
    return {
      "id": id,
      "titulo": titulo,
      "conteudo": conteudo
    };
    // As colunas do DB são equivalentes às chaves desse método
 }

 // Converter um MAP (Vindo do DB) => Objeto da Classe Nota
 // para fazer o from vamos usar um factory
 factory Nota.fromMap(Map<String, dynamic> map){
    return Nota(
      id: map["id"] as int, // Se está voltando do DB então tem um ID
      titulo: map["titulo"] as String,
      conteudo: map["conteudo"] as String
    );
 }

 // Método para imprimir dados
 @override
  String toString () {
    return "Nota:{id: $id, titulo: $titulo, conteúdo: $conteudo}";
  }
}