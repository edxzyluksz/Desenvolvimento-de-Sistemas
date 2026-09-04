import 'package:biblioteca_app_json/model/user.dart';
import 'package:biblioteca_app_json/service/api_service.dart';

class UserController {
  // Não precisa instanciar objeto de service (Static)

  // Ler todos
  Future<List<User>> fetchAll() async {
    final users = await ApiService.getList("users?_sort=name"); // Flag para ordenar em ordem alfabética dos nomes
    return users.map<User>((item) => User.fromMap(item)).toList();
  }

  // Ler individual
  Future<User> fetchOne(String id) async {
    final user = await ApiService.getOne("users", id);
    return User.fromMap(user);
  }

  // Criar
  Future<User> create(User u) async {
    final created = await ApiService.post("users", u.toMap());
    // Adiciona um usuário e retorna o usuário criado -> ID
    return User.fromMap(created);
  }

  // Atualizar
  Future<User> update(User u) async {
    final updated = await ApiService.put("users", u.toMap(), u.id!);
    // Envia a atualização do usuário e retorna o usuário atualizado do banco
    return User.fromMap(updated);
  }

  // Deletar
  void delete(String id) async {
    await ApiService.delete("users", id);
    // Se o método não funcionar, gera uma exception
  }
}