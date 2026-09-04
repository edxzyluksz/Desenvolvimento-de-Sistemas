import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Exemplo2Page extends StatefulWidget {
  const Exemplo2Page({super.key});

  @override
  State<Exemplo2Page> createState() => _Exemplo2PageState();
}

class _Exemplo2PageState extends State<Exemplo2Page> {
    late SharedPreferences _prefs;
    /* escopo 'late' permite criar uma variável inicialmente nula para mudar posteriormente */
    bool _darkMode = false;



  @override
  void initState(){
      super.initState();
    _loadpreferences();
  }

  void getPreferences() async {
    _prefs = await SharedPreferences.getInstance();  
  }

  void _loadpreferences() async { // Pega os dados salvos no Shared Preferences
    getPreferences();
    setState(() {
      _darkMode = _prefs.getBool("darkMode") ?? false;
      // Verificação de nulidade obrigatória, ?? se caso a chave darkMode do Shared seja nula(não tenha valor atribuído)
    });
  }

  // Método para salvar dados no Shared
  void savePreferences() async {
    getPreferences();
    setState(() {
        _darkMode = !_darkMode; 
    });
    await _prefs.setBool("darkMode", _darkMode); // Atribui o valor de _darkMode à chave darkMode (true ou false) do Shared
  }

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text("Modo Escuro com Shared Preferences"),),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text("Tema Atual: ${_darkMode ? "Escuro" : "Claro"}"),
                        Switch(
                            value: _darkMode,
                            onChanged: (_) => savePreferences()
                        )
                    ],
                ),
            ),

        );
    }
}