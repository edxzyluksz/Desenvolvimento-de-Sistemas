import 'package:sa_formativa_petshop_sqlite/service/database_helper.dart';
import 'package:sa_formativa_petshop_sqlite/model/pet_model.dart';

class PetController {
  //estabelecer as conexões com o db
  final _dbHelper = DatabaseHelper();

  // métodos do controller

  Future<int> salvarPet( Pet pet) async{
    return _dbHelper.insertPet(pet);
  }

  Future<List<Pet>> listarTodos() async => _dbHelper.getPets();


}