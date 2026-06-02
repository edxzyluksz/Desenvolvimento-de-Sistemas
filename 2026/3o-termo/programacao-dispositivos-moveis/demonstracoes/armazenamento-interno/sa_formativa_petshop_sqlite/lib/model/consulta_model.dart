class Consulta {
  int? id;
  int petId;
  String tipoServico;
  String dataHora; // ISO-8601 conforme R-001 da DRS
  String observacoes;

  Consulta({this.id, required this.petId, required this.tipoServico, required this.dataHora, required this.observacoes});

  Map<String, dynamic> toMap() {
    return {
      'id': id, 
      'petId': petId, 
      'tipoServico': tipoServico, 
      'dataHora': dataHora, 
      'observacoes': observacoes};
  }

  factory Consulta.fromMap(Map<String, dynamic> map) {
    return Consulta(
      id: map['id'], 
      petId: map['petId'], 
      tipoServico: map['tipoServico'], 
      dataHora: map['dataHora'], 
      observacoes: map['observacoes']);
  }
}