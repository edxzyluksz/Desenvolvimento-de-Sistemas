import 'package:path/path.dart';
import 'package:sa_formativa_petshop_sqlite/model/consulta_model.dart';
import 'package:sa_formativa_petshop_sqlite/model/pet_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Classe do tipo Singleton (permite o instanciamento de um único objeto por vez)
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  // Essa não possui um construtor normal
  // Ele Precisa do factory para estabelece a conexão com o banco de dados, 
  // Com essa técnica de escrita de construtor, a classe permite a criação de apenas um objeto por vez

  DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;


  // Conector do Banco de Dados
  Database? _database; //Privado

  // Método get da Conexão
  Future<Database> get database async{
    if(_database != null) return _database!; // Se conexão já existir retorna a conexão existente
    _database = await _initDb(); // Se não existir, inicia uma nova
    return _database!;
  }

  Future<Database> _initDb() async{
    // Começar a conexão com o banco
    String path = join(await getDatabasesPath(), "petshop_db");
    return await openDatabase(
      path,
      version: 1,
      // A primeira vez que for rodar o banco , cria as tabelas
      onCreate: (db, version) async{
        await db.execute(
          '''CREATE TABLE pets(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          nome TEXT, raca TEXT, 
          nomeDono TEXT, 
          telefone TEXT)''');
        await db.execute(
          '''CREATE TABLE consultas(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          petId INTEGER, 
          tipoServico TEXT, 
          dataHora TEXT, 
          observacoes TEXT,
          FOREIGN KEY(petId) REFERENCES pets(id) ON DELETE CASCADE)''');
      },
      onConfigure: (db) async => await db.execute("PRAGMA foreign_key = ON"), //garante o delete on CASCADE
      );
  }

  // Métodos do API REST Simplificados

  //POST
  Future<int> insertPet(Pet pet) async => (await database).insert("pets", pet.toMap());

  //GET
  Future<List<Pet>> getPets() async {
    // Busca os pets no banco e retrona uma lista em ordem alfabetica
    final List<Map<String, dynamic>> maps = await (await database).query("pets", orderBy: "nome ASC");
    return List.generate(maps.length, (e) => Pet.fromMap(maps[e]));
  }

  //POST
  Future<int> insertConsulta(Consulta c) async => (await database).insert("consultas", c.toMap());

  //GET
  Future<List<Consulta>> getConsultaPorPet(int petId) async{
    final List<Map<String,dynamic>> maps = await (await database).query("consultas", where: "petId = ?", whereArgs: [petId], orderBy: "dataHora DESC" );
    return List.generate(maps.length, (e)=>Consulta.fromMap(maps[e]));
  }

}