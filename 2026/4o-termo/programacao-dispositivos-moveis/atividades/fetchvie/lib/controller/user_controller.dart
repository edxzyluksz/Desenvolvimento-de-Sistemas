import 'package:fetchvie/model/user.dart';
import 'package:fetchvie/model/work.dart';
import 'package:fetchvie/service/db_helper.dart';

class UserController {
  final User? user;
  final dbHelper = DbHelper();

  UserController({this.user});

  Future<List<User>> getUsers() async {
    final List<User> users = await dbHelper.getSavedUsers();
    return users;
  }

  Future<int> createUser(User u) async {
    return await dbHelper.createUser(u);
  }

  Future<int> updateUser(User u) async {
    return await dbHelper.updateUser(u);
  }

  Future<bool> toggleFavoriteMovie(Work work) async {
    try {
      if (user == null || user!.uid == null) {
        throw Exception("Usuário inválido.");
      }
      return await dbHelper.toggleFavoriteMovie(user!, work);
    } catch (e) {
      throw Exception("Não foi possível atualizar os favoritos.");
    }
  }

  Future<List<Work>> getFavoriteMovies() async {
    try {
      final favorites = await dbHelper.getFavoriteMovies(user!);
      return favorites;
    } catch (e) {
      throw Exception("Não foi possível obter dados de favoritos.");
    }
  }
}
