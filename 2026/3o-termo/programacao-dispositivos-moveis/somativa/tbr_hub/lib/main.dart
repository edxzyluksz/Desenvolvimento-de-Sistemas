import 'package:flutter/material.dart';
import 'view/home_screen.dart';

void main() {
  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TBRHub - Gerenciamento de Biblioteca',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFF0), // Bege
        primaryColor: const Color(0xFF6DACFF), // Azul
        
        // Estilização da AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6DACFF), // Azul
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        
        // Cores dos botões flutuantes e de ação
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFF2E079), // Amarelo Leve
          foregroundColor: Colors.black, // Corrigido aqui!
        ),
        
        // Estilização dos Cards (Livros)
        cardTheme: const CardThemeData( // Corrigido para CardThemeData!
          color: Color(0xFFD6D6D2), // Cinza Claro
          elevation: 2,
        ),
        
        // Estilização dos Botões Padrão
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6DACFF), // Azul
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        
        // Inputs dos Formulários
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF6DACFF), width: 2),
          ),
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}