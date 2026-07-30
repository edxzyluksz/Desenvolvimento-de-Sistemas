import 'package:flutter/material.dart';
import 'config_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Atributos
  bool temaEscuro = false;
  String nomeUsuario = "";

  // Método para carregar informações antes mesmo do build da tela
  @override
  void initState() {
    super.initState();
    carregarPreferencias();
  }

  // Método para conectar com o shared preferences
  void carregarPreferencias() async { // Async - Não trava a aplicação se a busca der errado
    // Conexão com o sharedPreferences (pub add para adicionar na aplicação)
    final prefs = await SharedPreferences.getInstance(); // Conecta com o cace para pegar info do usuário
    // Armazena em um texto as configurações salvas pelo usuário da aplicação
    String? jsonString = prefs.getString("config"); // ? => Permite que a variável seja nula
    if (jsonString != null) {
      // Converter o texto/json em map/dart
      Map<String, dynamic> config = json.decode(jsonString);
      // Chama a mudança de estado
      setState(() {
        // Atribuir as variáveis os valores armazenados
        temaEscuro = config['temaEscuro'] ?? false; // Se o valor da chave for nula, atribua 'false'
        nomeUsuario = config["nome"] ?? ""; // Verificação de nulidade
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: "App de Configuração",
      theme: temaEscuro ? ThemeData.dark() : ThemeData.light(),
      home: ConfigPage(
        temaEscuro: temaEscuro,
        nomeUsuario: nomeUsuario,
        onSalvar: (bool tema, String nome){
          setState(() {
            temaEscuro = tema;
            nomeUsuario = nome;
          });
        }
      )
    );
  }
}