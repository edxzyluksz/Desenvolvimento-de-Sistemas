import 'package:biblioteca_app_json/model/book.dart';
import 'package:biblioteca_app_json/model/user.dart';

class Loan {
  // Atributos
    String? id;
    User user;
    Book book;
    DateTime startDate;
    DateTime dueDate;
    bool returned;

    Loan({
        this.id,
        required this.user,
        required this.book,
        required this.startDate,
        required this.dueDate,
        required this.returned
    });

    Map<String, dynamic> toMap() => {
        "id": id,
        "user": user.toMap(),
        "book": book.toMap(),
        "startDate": startDate.toIso8601String(),
        "dueDate": dueDate.toIso8601String(),
        "returned": returned
    };

    factory Loan.fromMap(Map<String, dynamic> map) =>
    Loan(
        id: map['id'].toString(),
        user: User.fromMap(map['user']),
        book: Book.fromMap(map['book']),
        startDate: DateTime.parse(map['startDate'].toString()),
        dueDate: DateTime.parse(map['dueDate'].toString()),
        returned: map['returned'] == true ? true : false
    );
}