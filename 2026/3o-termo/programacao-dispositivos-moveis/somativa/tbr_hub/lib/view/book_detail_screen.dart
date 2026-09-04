import 'package:flutter/material.dart';
import '../model/book_model.dart';
import '../model/loan_model.dart';
import '../database/database_helper.dart';
import 'loan_form_screen.dart';
import 'book_form_screen.dart'; 

class BookDetailScreen extends StatefulWidget {
  final Book book;
  const BookDetailScreen({super.key, required this.book});

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  late Future<List<Loan>> _loansFuture;
  late Book _currentBook; 

  @override
  void initState() {
    super.initState();
    _currentBook = widget.book;
    _refreshLoans();
  }

  void _refreshLoans() {
    if (_currentBook.type == 'Físico') {
      setState(() {
        _loansFuture = DatabaseHelper.instance.getLoansForBook(_currentBook.id!);
      });
    }
  }

  Widget _buildInfoCard(String title, String value, IconData icon, {Color iconColor = const Color(0xFF6DACFF)}) {
    return Card(
      color: const Color(0xFFFFFFF0), 
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xFFD6D6D2), width: 1.5), 
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentBook.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookFormScreen(book: _currentBook),
                ),
              );
              
              if (result != null && result is Book) {
                setState(() {
                  _currentBook = result;
                });
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () async {
              bool confirm = await showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  backgroundColor: const Color(0xFFFFFFF0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: const Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.redAccent), // Ícone de alerta
                      SizedBox(width: 8),
                      Text(
                        'Excluir Livro',
                        style: TextStyle(color: Color(0xFF6DACFF), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  content: const Text(
                    'Tem certeza que deseja apagar este livro do acervo? Esta ação não pode ser desfeita.',
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, false),
                      child: const Text(
                        'Cancelar', 
                        style: TextStyle(color: Color(0xFF6DACFF), fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, true),
                      child: const Text(
                        'Excluir', 
                        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ) ?? false;

              if (confirm) {
                await DatabaseHelper.instance.deleteBook(_currentBook.id!);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Livro removido com sucesso!')),
                );
                Navigator.pop(context); 
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard('Autor', _currentBook.author, Icons.person),
            const SizedBox(height: 6),
            _buildInfoCard('Editora', _currentBook.publisher, Icons.business),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(child: _buildInfoCard('Ano', _currentBook.year.toString(), Icons.calendar_today)),
                Expanded(child: _buildInfoCard('Gênero', _currentBook.genre, Icons.category)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(child: _buildInfoCard('ISBN', _currentBook.isbn, Icons.qr_code)),
                Expanded(child: _buildInfoCard('Tipo', _currentBook.type, _currentBook.type == 'Físico' ? Icons.menu_book : Icons.tablet_mac)),
              ],
            ),
            const SizedBox(height: 6),
            _buildInfoCard(
              'Quantidade em Estoque', 
              _currentBook.quantity.toString(), 
              Icons.inventory_2, 
              iconColor: const Color(0xFFD4B106) 
            ),
            
            const Divider(height: 30, thickness: 2),
            
            if (_currentBook.type == 'Físico') ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Histórico de Empréstimos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.add_box, color: Colors.blue),
                    onPressed: () async {
                      final devolveuAlgo = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoanFormScreen(book: _currentBook)),
                      );
                      
                      if (devolveuAlgo == true) {
                        setState(() {
                          _currentBook = Book(
                            id: _currentBook.id, title: _currentBook.title, author: _currentBook.author,
                            isbn: _currentBook.isbn, year: _currentBook.year, publisher: _currentBook.publisher,
                            genre: _currentBook.genre, type: _currentBook.type, coverPath: _currentBook.coverPath,
                            quantity: _currentBook.quantity - 1, 
                          );
                        });
                        _refreshLoans();
                      }
                    },
                  )
                ],
              ),
              Expanded(
                child: FutureBuilder<List<Loan>>(
                  future: _loansFuture,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('Nenhum empréstimo registrado.'));
                    }
                    
                    final reversedLoans = snapshot.data!.reversed.toList();

                    return ListView.builder(
                      itemCount: reversedLoans.length,
                      itemBuilder: (context, index) {
                        final loan = reversedLoans[index];
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(loan.borrowerName, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text('Devolver em: ${loan.expectedReturnDate}', style: const TextStyle(color: Colors.black87)),
                                Text('ID do Empréstimo: #${loan.id}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                              ],
                            ),
                            trailing: loan.actualReturnDate == null 
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF2E079), foregroundColor: Colors.black87),
                                  onPressed: () async {
                                    await DatabaseHelper.instance.returnLoan(loan.id!, DateTime.now().toString().split(' ')[0]);
                                    
                                    final updatedBook = Book(
                                      id: _currentBook.id, title: _currentBook.title, author: _currentBook.author,
                                      isbn: _currentBook.isbn, year: _currentBook.year, publisher: _currentBook.publisher,
                                      genre: _currentBook.genre, type: _currentBook.type, coverPath: _currentBook.coverPath,
                                      quantity: _currentBook.quantity + 1, 
                                    );
                                    await DatabaseHelper.instance.updateBook(updatedBook);

                                    setState(() { _currentBook = updatedBook; });
                                    _refreshLoans();
                                  },
                                  child: const Text('Devolver'),
                                )
                              : const Text('Devolvido', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ] else ...[
              const Center(child: Text('E-books não possuem registro de empréstimos físicos.', style: TextStyle(color: Colors.grey))),
            ]
          ],
        ),
      ),
    );
  }
}