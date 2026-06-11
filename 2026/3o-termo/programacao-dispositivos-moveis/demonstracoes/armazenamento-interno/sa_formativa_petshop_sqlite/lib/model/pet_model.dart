class Pet{
  // Atributos
  int? id; // Pode ser nulo inicialmente => quem irá atribuir o Id é o BD
  String nome;
  String raca;
  String nomeDono;
  String telefone;

  // Atributos públicos, se fossem privados, precisaria dos getter and setter (métodos públicos ) => encapsulamento //SAEP

  // Construtor
  Pet({this.id, required this.nome, required this.raca, required this.nomeDono, required this.telefone});

  // Mapaeamento de Dados
    Map<String,dynamic> toMap() => {
    "id":id,
    "nome":nome,
    "raca":raca,
    "nomeDono":nomeDono,
    "telefone":telefone
  };

  // Serialização dos dados
  factory Pet.fromMap(Map<String, dynamic> map)=>Pet(
    id: map["id"],
    nome: map["nome"], 
    raca: map["raca"], 
    nomeDono: map["nomeDono"], 
    telefone: map["telefone"]);
}