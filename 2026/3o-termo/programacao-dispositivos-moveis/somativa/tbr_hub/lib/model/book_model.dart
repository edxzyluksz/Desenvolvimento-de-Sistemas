class Book {
  final int? id;
  final String title;
  final String author;
  final String isbn;
  final int year;
  final String publisher;
  final String genre;
  final String type; // 'Físico' ou 'E-Book'
  final int quantity;
  final String? coverPath;

  const Book({
    this.id,
    required this.title,
    required this.author,
    required this.isbn,
    required this.year,
    required this.publisher,
    required this.genre,
    required this.type,
    required this.quantity,
    this.coverPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'isbn': isbn,
      'year': year,
      'publisher': publisher,
      'genre': genre,
      'type': type,
      'quantity': quantity,
      'coverPath': coverPath,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      isbn: map['isbn'],
      year: map['year'],
      publisher: map['publisher'],
      genre: map['genre'],
      type: map['type'],
      quantity: map['quantity'],
      coverPath: map['coverPath'],
    );
  }
}