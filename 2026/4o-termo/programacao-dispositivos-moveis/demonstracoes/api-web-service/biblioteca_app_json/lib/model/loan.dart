import 'book.dart';
import 'user.dart';

class Loan {
    final String? id;
    final User user;
    final Book book;
    final DateTime startDate;
    final DateTime dueDate;
    final bool returned;

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
        "userId": user.toMap(),
        "bookId": book.toMap(),
        "startDate": startDate.toIso8601String(),
        "dueDate": dueDate.toIso8601String(),
        "returned": returned
    };

    factory Loan.fromMap(Map<String, dynamic> map) =>
    Loan(
        id: map["id"].toString(),
        user: User.fromMap(map["userId"]),
        book: Book.fromMap(map["bookId"]),
        startDate: DateTime.parse(map["startDate"].toString()),
        dueDate: DateTime.parse(map["dueDate"].toString()),
        returned: map["returned"] == true ? true : false
    );
}