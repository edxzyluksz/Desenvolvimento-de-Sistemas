class Book {
    final String? id;
    final String title;
    final String author;
    final bool available;

    // Construtor

    Book({
        this.id,
        required this.title,
        required this.author,
        required this.available
    });

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "author": author,
        "available": available
    };

    factory Book.fromMap(Map<String, dynamic> map) =>
    Book(
        id : map["id"].toString(),
        title: map["title"].toString(),
        author: map["author"].toString(),
        available: map["available"] == true ? true : false
    );
}