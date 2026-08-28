import 'package:fetchvie/service/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:fetchvie/view/export.dart'; // Tática para exportar todos os arquivos do diretório

void main() async {
  DbHelper(); // Conexão com API

  runApp(MaterialApp(
    title: "Fetchvie",
    theme: ThemeData(
      primaryIconTheme: const IconThemeData(color: Color.fromARGB(255, 118, 86, 172)),
      brightness: Brightness.dark
    ),
    home: Fetchvie(),
  ));
}

class Fetchvie extends StatelessWidget {
  const Fetchvie({super.key});

  @override
  Widget build(BuildContext context) {
    return ;
  }
}
