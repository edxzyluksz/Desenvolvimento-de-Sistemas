import 'package:sa_formativa_petshop_sqlite/model/pet_model.dart';
import 'package:sa_formativa_petshop_sqlite/service/database_helper.dart';

class PetController { //SlinControllers
  // Atributo para estabelecer conexão com o banco
  final _dbHelper = DatabaseHelper();

  // Métodos dos controller
  
  // Salvar pet
  Future<int> salvarPet(Pet pet) async => _dbHelper.insertPet(pet);

  // Listar Todos os Pets
  Future<List<Pet>> listarTodos() async => _dbHelper.getPets();


}