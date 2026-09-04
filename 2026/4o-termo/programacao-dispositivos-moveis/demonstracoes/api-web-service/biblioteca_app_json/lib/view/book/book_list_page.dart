import 'package:biblioteca_app_json/controller/book_controller.dart';
import 'package:biblioteca_app_json/model/book.dart';
import 'package:biblioteca_app_json/view/book/book_form_page.dart';
import 'package:flutter/material.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {

  final ValueNotifier<int> _notifier = ValueNotifier<int>(0);
  final BookController _bookController = BookController();

  final _bookSearch = TextEditingController();

  List<Book> _books = [];
  List<Book> _filtered = [];

  bool _isLoading = true;
  String error = "";

  @override
  void initState() {
    _load();
  }

  void _load() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _books = await _bookController.fetchAll();
      _filtered = _books;
    } catch(e) {
      error = e.toString();
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _filterBooks() {
    final query = _bookSearch.text.trim().toLowerCase();
    setState(() {
      _filtered = _books.where((book) {
        return book.title.toLowerCase().contains(query) || book.author.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _delete(Book book) async {
    final confirm = showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Confirmar exclusão?"),
        content: Text("Uma vez que esta ação for realizada, não poderá ser revertida."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text("Cancelar")),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text("Excluir"))
        ],
      ));
    
    if (confirm == true) {
      try {
        _bookController.delete(book.id!);
      } catch (e) {
        // Catch e
      }
    }
  }

  void _openForm({Book? book}) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => BookFormPage(book: book)));
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _notifier,
        builder: (context, _, _) {
          return FutureBuilder(
            future: _bookController.fetchAll(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 60, color: Colors.red),
                      SizedBox(height: 16),
                      // Botão para recarregar
                    ],
                  ),
                );
              }
                final books = snapshot.data ?? [];
                if (books.isEmpty) {
                  return Center(
                    child: Text("Nenhum livro na lista..."),
                  );
                } else {
                  return ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = _filtered[index];
                      return Card(
                        child: ListTile(
                          title: Text(book.title),
                          subtitle: Text(book.author),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(onPressed: () => _openForm(book: book), icon: Icon(Icons.edit)),
                              IconButton(onPressed: () => _delete(book), icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
            })
          );
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _openForm(), child: Icon(Icons.add)),
    );
  }
}