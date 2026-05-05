// Criar o void main
// Responsável por rodar o elemento principal da aplicação 

import 'package:flutter/material.dart';

void main(){
  //runApp => Chama o elemetno com o materialAPP
  runApp(MainApp());
}

// Criar a classe MainApp
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // Construtor da Tela Estática
  @override
  Widget build(BuildContext context) {
    // Montar a estrutura do MaterialAPP
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Tela de Login"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ // Permite mais de 1, abre colchetes
              // Elementos de input de texto
              Text("Email"),
              TextField(textAlign: TextAlign.center),
              Text("Senha"),
              TextField(textAlign: TextAlign.center, obscureText: true),
              TextButton(onPressed: (){}, child: Text("Enviar"))
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: // Permite mais de 1, abre colchetes 
          [
            BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "Back"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.arrow_forward), label: "Forward"),
          ]
        ),
      ),
    );
  }
}