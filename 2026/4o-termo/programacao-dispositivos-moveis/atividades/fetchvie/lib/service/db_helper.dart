import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fetchvie/service/sql/create_tables.dart';

import 'package:fetchvie/model/work.dart';
import 'package:fetchvie/model/user.dart';

class DbHelper {
  // Arquitetura de instância única
  static final DbHelper _instance = DbHelper._internal();
  DbHelper._internal();
  factory DbHelper() => _instance;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), "fetchvie.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(createWorkScript);
        await db.execute(createUserScript);
        await db.execute(createUserFavoritesScript);
      },
    );
  }

  // REST

  // -- Works
  Future<List<Work>> getSavedWorks() async {
    final List<Map<String, dynamic>> maps = await (await database).query(
      "works",
      limit: 100,
      orderBy: "id DESC",
    );
    return List.generate(maps.length, (e) => Work.fromMap(maps[e]));
  }

  Future<int> postApiWorks(Work w) async =>
      (await database).insert("works", w.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

  Future<int> updateSavedWorkFromApi(Work w) async => (await database).update(
    "works",
    w.toMap(),
    where: "id = ?",
    whereArgs: [w.id],
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  // -- User
  Future<List<User>> getSavedUsers() async {
    final List<Map<String, dynamic>> maps = await (await database).query(
      "users",
      limit: 100,
      orderBy: "id",
    );
    return List.generate(maps.length, (e) => User.fromMap(maps[e]));
  }

  Future<User> getUser(User u) async {
    final List<Map<String, dynamic>> maps = await (await database).query(
      "users",
      where: "id = ?",
      whereArgs: [u.uid],
      limit: 1,
    );

    return User.fromMap(maps.first);
  }

  Future<int> createUser(User u) async =>
      (await database).insert("users", u.toMap());

  Future<int> updateUser(User u) async => (await database).update(
    "users",
    u.toMap(),
    where: "id = ?",
    whereArgs: [u.uid],
  );

  Future<List<Work>> getFavoriteMovies(User u) async {
    final db = await database;
    // Faz um JOIN entre works e user_favorites para trazer os dados completos da obra
    final List<Map<String, dynamic>> maps = await db.rawQuery(
      '''
      SELECT w.* FROM works w
      INNER JOIN user_favorites uf ON w.id = uf.work_id
      WHERE uf.user_id = ?
    ''',
      [u.uid],
    );
    return List.generate(maps.length, (e) => Work.fromMap(maps[e]));
  }

  Future<bool> toggleFavoriteMovie(User u, Work w) async {
    final db = await database;

    // 1. Verifica se a obra já está favoritada
    final List<Map<String, dynamic>> maps = await db.query(
      "user_favorites",
      where: "user_id = ? AND work_id = ?",
      whereArgs: [u.uid, w.id],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      await db.delete(
        "user_favorites",
        where: "user_id = ? AND work_id = ?",
        whereArgs: [u.uid, w.id],
      );
      return false; 
    } else {
      await postApiWorks(w);

      await db.insert("user_favorites", {"user_id": u.uid, "work_id": w.id});
      return true; 
    }
  }
}
