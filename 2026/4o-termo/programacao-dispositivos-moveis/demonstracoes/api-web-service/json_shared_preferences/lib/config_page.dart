import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ConfigPage extends StatefulWidget {

  // Atributos
  final bool temaEscuro; // Atributo para armazenar o tema escuro
  final String nomeUsuario; // Atributo para armazenar o nome do usuário
  final Function(bool, String) onSalvar; // Atributo para armazenar a função de salvar as configurações

  // Construtor
  const ConfigPage({
    super.key, 
    required this.temaEscuro, 
    required this.nomeUsuario, 
    required this.onSalvar
  });

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  // Atributos 
  late bool _temaEscuro; // Atributos para armazenar o tema escuro
  late TextEditingController _nomeUsuario; // : late -> inicia a variável depois muda o valor

  // Método para iniciar as variáveis
  @override
  initState(){
    super.initState();
    _temaEscuro = widget.temaEscuro; // Atribui o valor do tema escuro passado pelo construtor para a variável local
    _nomeUsuario = TextEditingController(text: widget.nomeUsuario);
  }

  // Método para salvar as configurações do usuário
  void salvarConfig() async {
    Map<String, dynamic> config = {
      "temaEscuro": _temaEscuro,
      "nome": _nomeUsuario.text.trim()
    };
    // Chamar o SharedPreferences
    // Converter o map => String/JSON
    // Salvar o valor no SharedPreferences para a Chave "config"
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonConfig = json.encode(config);
    prefs.setString("config", jsonConfig);

    // Chamar a atualização
    widget.onSalvar(_temaEscuro, _nomeUsuario.text.trim());
  }

  // Build da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preferências do Usuário"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile( // Botão para mudar o tema escuro
              title: (Text("Tema Escuro")),
              value: _temaEscuro,
              onChanged: (bool value) {
                setState(() {
                  _temaEscuro = value;
                });
              },
            ),
            TextField(
              controller: _nomeUsuario,
              decoration: InputDecoration(
                labelText: "Nome do Usuário"
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                salvarConfig();
                // ScaffoldMessenger
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text ("Preferências Salvas")));
              },
              child: Text("Salvar Preferências"),
            ),
            Divider(),
            Text("Resumo Atual: ", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Tema: ${_temaEscuro ? "Escuro" : "Claro"}"),
            Text("Usuário: ${_nomeUsuario.text}")
          ],
        ),
      ),
    );
  }
}