import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/book_model.dart';
import '../model/loan_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'library_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE books(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        author TEXT NOT NULL,
        isbn TEXT NOT NULL UNIQUE,
        year INTEGER NOT NULL,
        publisher TEXT NOT NULL,
        genre TEXT NOT NULL,
        type TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        coverPath TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE loans(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bookId INTEGER NOT NULL,
        borrowerName TEXT NOT NULL,
        loanDate TEXT NOT NULL,
        expectedReturnDate TEXT NOT NULL,
        actualReturnDate TEXT,
        FOREIGN KEY (bookId) REFERENCES books (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE borrowers(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL UNIQUE
      )
    ''');
  }

  // CRUD PARA LIVROS
  
  // Create
  Future<int> insertBook(Book book) async {
    Database db = await instance.database;
    return await db.insert('books', book.toMap());
  }

  // Read
  Future<List<Book>> getBooks() async {
    Database db = await instance.database;
    var books = await db.query('books');
    return books.isNotEmpty ? books.map((c) => Book.fromMap(c)).toList() : [];
  }

  // Update
  Future<int> updateBook(Book book) async {
    Database db = await instance.database;
    return await db.update(
      'books',
      book.toMap(),
      where: 'id = ?',
      whereArgs: [book.id],
    );
  }

  // Delete
  Future<int> deleteBook(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'books',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD PARA EMPRÉSTIMOS
  
  // Create
  Future<int> insertLoan(Loan loan) async {
    Database db = await instance.database;
    return await db.insert('loans', loan.toMap());
  }

  // Read
  Future<List<Loan>> getLoansForBook(int bookId) async {
    Database db = await instance.database;
    var loans = await db.query('loans', where: 'bookId = ?', whereArgs: [bookId]);
    return loans.isNotEmpty ? loans.map((c) => Loan.fromMap(c)).toList() : [];
  }

  // Update (Registrar Devolução)
  Future<int> returnLoan(int loanId, String returnDate) async {
    Database db = await instance.database;
    return await db.update(
      'loans',
      {'actualReturnDate': returnDate},
      where: 'id = ?',
      whereArgs: [loanId],
    );
  }

  Future<void> insertBorrower(String name) async {
    Database db = await instance.database;
    // ConflictAlgorithm.ignore faz com que ele não dê erro se o nome já existir
    await db.insert('borrowers', {'name': name}, conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<String>> getBorrowers() async {
    Database db = await instance.database;
    var result = await db.query('borrowers');
    return result.map((m) => m['name'] as String).toList();
  }
}