// Ajudante de conexão com o dataBase (DB)
import 'package:sqflite_exemplo/nota_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class notaDbhelper{
  // Atributos
  static const String db_name = "notas.db";
  static const String table_name = "notas";
  static const String create_table = """
    CREATE TABLE IF NOT EXISTS $table_name(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    conteudo TEXT NOT NULL
  )""";

  // MÉTODO DE CONEXÃO
  // tipo Future (async) vai retornar o Banco de Dados
  Future<Database> _getDB() async {
    return openDatabase(
      // Colocar o endereço do DB
      join(await getDatabasesPath(), db_name),
      onCreate:(db, version) { // Se é a primeira vez que está sendo executado, ele irá criar o DB
        return db.execute(create_table);
      },
      version: 1
    );
  } // Retornar o banco de dados no final

  // CRUD do Banco de Dados (Controller)

  // Create
  void create(Nota nota) async {
  try {
    final Database db = await _getDB();
    await db.insert(table_name, nota.toMap()); // Insere o dado no banco
  } catch(e) {
      print(e);
      return;
    }
  }

  // Read
  Future<List<Nota>> getNotas() async {
    try {
      final Database db = await _getDB(); // Estabelece conexão
      final List<Map<String, dynamic>> maps = await db.query(table_name); // Pega todos os dados do banco
      // Converter o MAP em List<Nota>
      return List.generate(maps.length, (e) => Nota.fromMap(maps[e])); // Retorna a lista com os objetos
    } catch (e) {
      print(e); // Mostre o erro
      return []; // Retorna una lista vazia
    }
  }

  // Update
  void updateNota(Nota nota) async {
    try {
      final Database db = await _getDB();
      await db.update(table_name, nota.toMap(), where: "id = ?", whereArgs: [nota.id]);
      // Atualiza a nota a partir do ID
    } catch(e) {
      print(e);
      return;
    }
  }

  // Delete
  void deleteNota(int id) async {
    try {
      final Database db = await _getDB();
      await db.delete(table_name, where: "id = ?", whereArgs: [id]);
    } catch(e) {
      print(e);
      return;
    }
  }
}