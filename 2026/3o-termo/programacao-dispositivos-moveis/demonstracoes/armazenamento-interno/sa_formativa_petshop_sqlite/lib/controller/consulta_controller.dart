import 'package:sa_formativa_petshop_sqlite/service/database_helper.dart';
import 'package:sa_formativa_petshop_sqlite/model/consulta_model.dart';

class ConsultaController {
  final _dbHelper = DatabaseHelper();

  Future<bool> salvaConsulta(Consulta c) async{
    await _dbHelper.insertConsulta(c);
    return true;
  }

  Future<List<Consulta>> listarConsultas(int petId) async => await _dbHelper.getConsultasPorPet(petId);
}