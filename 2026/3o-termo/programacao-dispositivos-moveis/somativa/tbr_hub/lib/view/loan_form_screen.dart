import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../model/loan_model.dart';
import '../model/book_model.dart';

class LoanFormScreen extends StatefulWidget {
  final Book book;
  const LoanFormScreen({super.key, required this.book});

  @override
  _LoanFormScreenState createState() => _LoanFormScreenState();
}

class _LoanFormScreenState extends State<LoanFormScreen> {
  TextEditingController? _nameController;
  final _returnDateController = TextEditingController();
  
  bool _showErrors = false;
  List<String> _existingBorrowers = [];

  @override
  void initState() {
    super.initState();
    _loadBorrowers();
  }

  // Carrega os usuários já cadastrados no banco
  Future<void> _loadBorrowers() async {
    final borrowers = await DatabaseHelper.instance.getBorrowers();
    setState(() {
      _existingBorrowers = borrowers;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)), // Sugere 7 dias pra frente
      firstDate: DateTime.now(), // Bloqueia datas no passado
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF6DACFF),
              onPrimary: Colors.white,
              onSurface: Colors.black87,
              surface: Color(0xFFFFFFF0),
            ),
            dialogBackgroundColor: const Color(0xFFFFFFF0),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF6DACFF),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        // Formata para DD/MM/AAAA
        _returnDateController.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
      if (_showErrors) setState(() {});
    }
  }

  void _saveLoan() async {
    setState(() => _showErrors = true);
    
    String borrowerName = _nameController?.text.trim() ?? '';
    String expectedDate = _returnDateController.text.trim();

    if (borrowerName.isEmpty || expectedDate.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha o nome e a data de devolução.'), backgroundColor: Colors.orange)
      );
      return;
    }

    if (widget.book.quantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Estoque indisponível!'), backgroundColor: Colors.redAccent)
      );
      return; 
    }

    // Salva o empréstimo
    final newLoan = Loan(
      bookId: widget.book.id!,
      borrowerName: borrowerName,
      loanDate: DateTime.now().toString().split(' ')[0], 
      expectedReturnDate: expectedDate,
    );
    await DatabaseHelper.instance.insertLoan(newLoan);

    // Salva o nome na tabela de Emprestadores (se for novo, ele entra pro Autocomplete)
    await DatabaseHelper.instance.insertBorrower(borrowerName);

    // Decrementa o estoque
    final updatedBook = Book(
      id: widget.book.id, title: widget.book.title, author: widget.book.author,
      isbn: widget.book.isbn, year: widget.book.year, publisher: widget.book.publisher,
      genre: widget.book.genre, type: widget.book.type, coverPath: widget.book.coverPath,
      quantity: widget.book.quantity - 1, 
    );
    await DatabaseHelper.instance.updateBook(updatedBook);

    Navigator.pop(context, true);
  }

  InputDecoration _getInputDeco(String label, String textValue) {
    bool isError = _showErrors && textValue.isEmpty;
    return InputDecoration(
      labelText: label,
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: isError ? Colors.red : Colors.grey, width: isError ? 1.5 : 1.0)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: isError ? Colors.red : const Color(0xFF6DACFF), width: 2.0)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Empréstimo')),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Text(
            'Empréstimo de ${widget.book.title}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF6DACFF)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Preencha os dados do locatário e a previsão de devolução do exemplar.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24), 
          
          // Autocomplete para o Nome
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textValue) {
              if (textValue.text.isEmpty) return const Iterable<String>.empty();
              return _existingBorrowers.where((opt) => opt.toLowerCase().contains(textValue.text.toLowerCase()));
            },
            fieldViewBuilder: (context, controller, focusNode, _) {
              _nameController = controller;
              return TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: _getInputDeco('Nome do Locatário', controller.text).copyWith(prefixIcon: const Icon(Icons.person)),
                onChanged: (_) { if (_showErrors) setState(() {}); },
              );
            },
          ),
          
          const SizedBox(height: 16), 
          
          TextField(
            controller: _returnDateController,
            readOnly: true, // Impede o usuário de digitar aleatoriamente
            onTap: () => _selectDate(context), // Abre o calendário ao tocar
            decoration: _getInputDeco('Data de Devolução', _returnDateController.text).copyWith(
              prefixIcon: const Icon(Icons.calendar_today), 
            ),
          ),
          
          const SizedBox(height: 32), 
          
          SizedBox(
            height: 50, 
            child: ElevatedButton.icon(
              onPressed: _saveLoan,
              icon: const Icon(Icons.save, color: Colors.white),
              label: const Text('Salvar Empréstimo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}