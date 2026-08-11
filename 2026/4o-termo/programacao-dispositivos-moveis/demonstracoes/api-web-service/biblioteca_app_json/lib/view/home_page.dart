import 'package:biblioteca_app_json/view/book/book_list_page.dart';
import 'package:biblioteca_app_json/view/loan/loan_list_page.dart';
import 'package:biblioteca_app_json/view/user/user_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0; // Índice de navegaão entre páginas


  // Lista de páginas
  final List<Widget> _pages = [
    BookListPage(),
    LoanListPage(),
    UserListPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciamento de Biblioteca"),
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) => setState(()=>_index=value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Livros"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Empréstimos"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Usuários"
          )
        ]
      ),
    );
  }
}