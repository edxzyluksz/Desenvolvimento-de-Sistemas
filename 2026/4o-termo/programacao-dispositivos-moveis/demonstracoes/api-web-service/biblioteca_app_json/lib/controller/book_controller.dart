import 'package:biblioteca_app_json/model/book.dart';
import 'package:biblioteca_app_json/service/api_service.dart';

class BookController {
  Future<List<Book>> fetchAll() async{
    final books = await ApiService.getList("/books");
    return books.map<Book>((item) => Book.fromMap(item)).toList();
  } 

  Future<Book> fetchOne(String id) async {
    final book = await ApiService.getOne("/books", id);
    return Book.fromMap(book);
  }

  Future<Book> create(Book b) async {
    final created = await ApiService.post("book", b.toMap());
    return Book.fromMap(created);
  }

  Future<Book> update(Book b) async {
    final updated = await ApiService.put("book", b.toMap(), b.id!);
    return Book.fromMap(updated);
  }

  void delete(String id) async {
    await ApiService.delete("book", id);
  }
}