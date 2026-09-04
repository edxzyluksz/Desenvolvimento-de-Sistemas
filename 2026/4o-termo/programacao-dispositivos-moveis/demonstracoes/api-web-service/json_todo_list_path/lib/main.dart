import 'package:flutter/material.dart';
import 'package:json_todo_list_path/usuario_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lista de Tarefas',
      debugShowCheckedModeBanner: false,
      home: UsuarioPage(),
        );
  }
}
