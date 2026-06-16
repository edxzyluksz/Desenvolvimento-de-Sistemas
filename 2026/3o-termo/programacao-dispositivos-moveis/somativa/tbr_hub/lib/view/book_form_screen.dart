import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../database/database_helper.dart';
import '../model/book_model.dart';

class BookFormScreen extends StatefulWidget {
  final Book? book; 
  const BookFormScreen({Key? key, this.book}) : super(key: key);

  @override
  _BookFormScreenState createState() => _BookFormScreenState();
}

class _BookFormScreenState extends State<BookFormScreen> {
  TextEditingController? _titleController;
  TextEditingController? _authorController;
  TextEditingController? _publisherController;
  TextEditingController? _genreController;

  final _isbnController = TextEditingController();
  final _yearController = TextEditingController();
  final _quantityController = TextEditingController();
  
  String _selectedType = 'Físico';
  bool _showErrors = false; 
  
  bool _isbnFormatError = false;

  List<String> _existingTitles = [];
  List<String> _existingAuthors = [];
  List<String> _existingPublishers = [];
  List<String> _existingGenres = [];

  List<Book> _allBooks = [];

  @override
  void initState() {
    super.initState();
    _isbnController.text = widget.book?.isbn ?? '';
    _yearController.text = widget.book?.year.toString() ?? '';
    _quantityController.text = widget.book?.quantity.toString() ?? '';
    
    if (widget.book != null) {
      _selectedType = widget.book!.type;
    }

    _loadExistingData();
  }

  Future<void> _loadExistingData() async {
    final books = await DatabaseHelper.instance.getBooks();
    setState(() {
      _allBooks = books;
      _existingTitles = books.map((b) => b.title).toSet().toList();
      _existingAuthors = books.map((b) => b.author).toSet().toList();
      _existingPublishers = books.map((b) => b.publisher).toSet().toList();
      _existingGenres = books.map((b) => b.genre).toSet().toList();
    });
  }

  String _sanitizeString(String input) {
    return input.trim().replaceAll(RegExp(r'\s+'), ' '); 
  }

  String _toTitleCase(String text) {
  if (text.trim().isEmpty) return text;

  final excecoes = { // Preposições / Artigos comuns, que gramaticalmente são minúsculos
    'e', 'ou', 'mas', 'nem', 
    'de', 'da', 'do', 'das', 'dos', 
    'a', 'o', 'as', 'os', 
    'em', 'no', 'na', 'nos', 'nas', 
    'por', 'para', 'com', 'sem'
  };

  final words = text.trim().toLowerCase().split(RegExp(r'\s+'));

  final titleCasedWords = words.asMap().entries.map((entry) {
    int index = entry.key;
    String word = entry.value;

    if (word.isEmpty) return '';

    if (index == 0 || !excecoes.contains(word)) {
      return word[0].toUpperCase() + word.substring(1);
    }

    return word;
  });

  return titleCasedWords.join(' ');
}

  bool _isValidISBNFormat(String isbn) {
    String cleanIsbn = isbn.replaceAll(RegExp(r'[-\s]'), '').toUpperCase();
    final isbn10RegExp = RegExp(r'^\d{9}[\dX]$');
    final isbn13RegExp = RegExp(r'^\d{13}$');
    return isbn10RegExp.hasMatch(cleanIsbn) || isbn13RegExp.hasMatch(cleanIsbn);
  }

  void _saveBook() async {
    setState(() {
      _showErrors = true;
      _isbnFormatError = false; 
    });

    String title = _toTitleCase(_sanitizeString(_titleController?.text ?? ''));
    String author = _toTitleCase(_sanitizeString(_authorController?.text ?? ''));
    String publisher = _toTitleCase(_sanitizeString(_publisherController?.text ?? ''));
    String genre = _toTitleCase(_sanitizeString(_genreController?.text ?? ''));
    String isbn = _sanitizeString(_isbnController.text).replaceAll(RegExp(r'[-\s]'), '').toUpperCase();
    String yearStr = _yearController.text.trim();
    String qty = _quantityController.text.trim();

    if (title.isEmpty || author.isEmpty || publisher.isEmpty || genre.isEmpty || 
        isbn.isEmpty || yearStr.isEmpty || qty.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Existem campos obrigatórios não preenchidos.'), backgroundColor: Colors.orange)
      );
      return; 
    }

    if (!_isValidISBNFormat(isbn)) {
      setState(() => _isbnFormatError = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formato de ISBN inválido. Deve ter 10 ou 13 dígitos.'), backgroundColor: Colors.redAccent)
      );
      return;
    }

    int? parsedYear = int.tryParse(yearStr);
    if (parsedYear == null || parsedYear > DateTime.now().year) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ano de publicação inválido ou no futuro.'), backgroundColor: Colors.redAccent)
      );
      return;
    }

    bool isDuplicate = false;
    for (var b in _allBooks) {
      if (widget.book != null && b.id == widget.book!.id) continue;
      if (b.title.toLowerCase() == title.toLowerCase() && b.type == _selectedType) {
        isDuplicate = true;
        break;
      }
    }

    if (isDuplicate) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Este livro já está cadastrado com esse formato (Físico/E-book). Apenas atualize a quantidade do existente!'), backgroundColor: Colors.redAccent)
      );
      return; 
    }

    final savedBook = Book(
      id: widget.book?.id, 
      title: title, 
      author: author,
      isbn: isbn,
      year: parsedYear,
      publisher: publisher,
      genre: genre,
      type: _selectedType,
      quantity: int.parse(qty),
    );

    try {
      if (widget.book == null) {
        await DatabaseHelper.instance.insertBook(savedBook);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Livro salvo com sucesso!')));
      } else {
        await DatabaseHelper.instance.updateBook(savedBook);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Livro atualizado com sucesso!')));
      }
      
      Navigator.pop(context, savedBook); 
      
    } catch (e) {
      String errorMessage = 'Erro inesperado ao salvar: $e';
      if (e.toString().contains('UNIQUE constraint failed')) {
        errorMessage = 'Ops! Esse ISBN já está cadastrado no acervo.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.redAccent)
      );
    }
  }

  InputDecoration _getInputDeco(String label, String textValue, IconData icon) {
    bool isError = _showErrors && textValue.isEmpty;
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: isError ? Colors.red : Colors.grey), 
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: isError ? Colors.red : Colors.grey, width: isError ? 1.5 : 1.0)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: isError ? Colors.red : const Color(0xFF6DACFF), width: 2.0)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    );
  }

  // Decoração estilizada para o ISBN
  InputDecoration _getIsbnDeco(String label, String textValue, IconData prefixIcon) {
    bool isError = (_showErrors && textValue.isEmpty) || _isbnFormatError;
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefixIcon, color: isError ? Colors.red : Colors.grey), 
      suffixIcon: IconButton(
        icon: const Icon(Icons.info_outline, color: Color(0xFF6DACFF)),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              backgroundColor: const Color(0xFFFFFFF0), // Fundo Bege
              title: const Text('O que é ISBN?', style: TextStyle(color: Color(0xFF6DACFF), fontWeight: FontWeight.bold)), // Azul
              content: const Text(
                'O International Standard Book Number (ISBN) é um identificador comercial único para livros.\n\n'
                '• ISBN-10: Possui 10 dígitos (usado até 2006).\n'
                '• ISBN-13: Possui 13 dígitos (padrão atual).'
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Entendi', style: TextStyle(color: Color(0xFF6DACFF))),
                ),
              ],
            ),
          );
        },
      ),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: isError ? Colors.red : Colors.grey, width: isError ? 1.5 : 1.0)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: isError ? Colors.red : const Color(0xFF6DACFF), width: 2.0)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    );
  }

  // Decoração estilizada para o ano
  InputDecoration _getYearDeco(String label, String textValue, IconData prefixIcon) {
    bool isError = _showErrors && textValue.isEmpty;
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefixIcon, color: isError ? Colors.red : Colors.grey), 
      suffixIcon: IconButton(
        icon: const Icon(Icons.info_outline, color: Color(0xFF6DACFF)),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              backgroundColor: const Color(0xFFFFFFF0), // Fundo Bege
              title: const Text('Ano de Publicação', style: TextStyle(color: Color(0xFF6DACFF), fontWeight: FontWeight.bold)), // Azul
              content: const Text(
                'Insira o ano original de publicação da obra.\n\n'
                'Dica: Para livros escritos Antes de Cristo (A.C.), basta colocar um sinal de menos (-) na frente do ano. Exemplo: -800.'
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Entendi', style: TextStyle(color: Color(0xFF6DACFF))),
                ),
              ],
            ),
          );
        },
      ),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: isError ? Colors.red : Colors.grey, width: isError ? 1.5 : 1.0)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: isError ? Colors.red : const Color(0xFF6DACFF), width: 2.0)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    );
  }

  Widget _buildAutocomplete({
    required String label,
    required String initialValue,
    required List<String> options,
    required IconData icon, 
    required Function(TextEditingController) onControllerReady,
  }) {
    return Autocomplete<String>(
      initialValue: TextEditingValue(text: initialValue),
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) return const Iterable<String>.empty();
        return options.where((opt) => opt.toLowerCase().contains(textEditingValue.text.toLowerCase()));
      },
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        onControllerReady(controller);
        return ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, _) {
            return TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: _getInputDeco(label, value.text, icon), 
              onChanged: (_) {
                if (_showErrors) setState(() {}); 
              },
            );
          }
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.book != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Editar Livro' : 'Cadastrar Livro')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildAutocomplete(
            label: 'Título', initialValue: widget.book?.title ?? '',
            icon: Icons.menu_book, 
            options: _existingTitles, onControllerReady: (c) => _titleController = c,
          ),
          const SizedBox(height: 12),
          
          _buildAutocomplete(
            label: 'Autor', initialValue: widget.book?.author ?? '',
            icon: Icons.person, 
            options: _existingAuthors, onControllerReady: (c) => _authorController = c,
          ),
          const SizedBox(height: 12),
          
          TextField(
            controller: _isbnController,
            decoration: _getIsbnDeco('ISBN', _isbnController.text, Icons.qr_code), 
            onChanged: (val) { 
              if (_showErrors || _isbnFormatError) {
                if (_isbnFormatError) {
                   setState(() => _isbnFormatError = false);
                } else {
                   setState(() {}); 
                }
              }
            },
          ),
          const SizedBox(height: 12),
          
          _buildAutocomplete(
            label: 'Editora', initialValue: widget.book?.publisher ?? '',
            icon: Icons.business, 
            options: _existingPublishers, onControllerReady: (c) => _publisherController = c,
          ),
          const SizedBox(height: 12),
          
          _buildAutocomplete(
            label: 'Gênero (Ex: Ficção, Terror)', initialValue: widget.book?.genre ?? '',
            icon: Icons.category, 
            options: _existingGenres, onControllerReady: (c) => _genreController = c,
          ),
          const SizedBox(height: 12),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: _yearController,
                  decoration: _getYearDeco('Ano', _yearController.text, Icons.calendar_today), 
                  keyboardType: const TextInputType.numberWithOptions(signed: true), 
                  inputFormatters: [
                     FilteringTextInputFormatter.allow(RegExp(r'^-?\d*')), 
                  ],
                  onChanged: (_) { if (_showErrors) setState(() {}); },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Tipo', 
                    prefixIcon: Icon(Icons.devices), 
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Físico', child: Text('Físico')),
                    DropdownMenuItem(value: 'EBook', child: Text('E-Book')),
                  ],
                  onChanged: (val) => setState(() => _selectedType = val!),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          TextField(
            controller: _quantityController,
            decoration: _getInputDeco('Quantidade Disponível', _quantityController.text, Icons.inventory_2), 
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (_) { if (_showErrors) setState(() {}); },
          ),
          
          const SizedBox(height: 30),
          SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _saveBook,
              icon: const Icon(Icons.save, color: Colors.white),
              label: Text(
                isEditing ? 'Atualizar Livro' : 'Salvar Livro',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}