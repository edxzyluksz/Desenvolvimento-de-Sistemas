class Loan { // Empréstimo
  final int? id;
  final int bookId;
  final String borrowerName;
  final String loanDate;
  final String expectedReturnDate;
  final String? actualReturnDate;

  const Loan({
    this.id,
    required this.bookId,
    required this.borrowerName,
    required this.loanDate,
    required this.expectedReturnDate,
    this.actualReturnDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bookId': bookId,
      'borrowerName': borrowerName,
      'loanDate': loanDate,
      'expectedReturnDate': expectedReturnDate,
      'actualReturnDate': actualReturnDate,
    };
  }

  factory Loan.fromMap(Map<String, dynamic> map) {
    return Loan(
      id: map['id'],
      bookId: map['bookId'],
      borrowerName: map['borrowerName'],
      loanDate: map['loanDate'],
      expectedReturnDate: map['expectedReturnDate'],
      actualReturnDate: map['actualReturnDate'],
    );
  }
}