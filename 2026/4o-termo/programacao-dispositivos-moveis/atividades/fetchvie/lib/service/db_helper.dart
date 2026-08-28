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
    String path = join(await getDatabasesPath(), "fetchvie");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(createWorkScript);
        await db.execute(createUserScript);
      },
    );
  }

  // REST

  // -- Works
  Future<List<Work>> getSavedWorks() async {
    final List<Map<String, dynamic>> maps = await (await database).query("works", limit: 100, orderBy: "id DESC");
    return List.generate(maps.length, (e) => Work.fromMap(maps[e]));
  }
  Future<int> postApiWorks(Work w) async => (await database).insert("works", w.toMap());
  Future<int> updateSavedWorkFromApi(Work w) async => (await database).update("works", w.toMap(), where: "id = ?", whereArgs: [w.id]);

  // -- User
  Future<List<User>> getSavedUsers() async {
    final List<Map<String, dynamic>> maps = await (await database).query("users", limit: 100, orderBy: "id");
    return List.generate(maps.length, (e) => User.fromMap(maps[e]));
  }
  Future<int> createUser(User u) async => (await database).insert("works", u.toMap());
  Future<int> updateUser(User u) async => (await database).update("users", u.toMap(), where: "uid = ?", whereArgs: [u.uid]);
}