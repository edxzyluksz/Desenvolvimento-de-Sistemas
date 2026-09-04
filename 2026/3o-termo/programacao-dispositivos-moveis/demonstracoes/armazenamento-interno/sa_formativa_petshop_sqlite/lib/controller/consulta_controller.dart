import 'package:sa_formativa_petshop_sqlite/model/consulta_model.dart';
import 'package:sa_formativa_petshop_sqlite/service/database_helper.dart';

class ConsultaController { // CRUD
  final _dbHelper = DatabaseHelper();

  // Create
  Future<int> salvarConsulta(Consulta c) async => _dbHelper.insertConsulta(c);

  // READ
  Future<List<Consulta>> listarConsultas(int petId) async => _dbHelper.getConsultaPorPet(petId);
}