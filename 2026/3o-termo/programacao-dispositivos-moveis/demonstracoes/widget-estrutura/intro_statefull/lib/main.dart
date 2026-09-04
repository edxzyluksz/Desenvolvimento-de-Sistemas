// Aplicativo usando Stateful (Com mudança de estado => Rebuild da Tela)

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // Método que identifica as mudanças de estado e chama a reconstrução da tela
  @override
  State<MyApp> createState() => _MyAppState();
  // Arrow Function
}

class _MyAppState extends State<MyApp>{
  // Variável para identificar o número de clicks no botão
  int contador = 0;

  // Build da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aplicativo com Stateful - Contador"),),
      // container Padding => Espaçamento interno
      body: Padding(
        // Espaçamento em todos os lados de 8px
        padding: EdgeInsets.all(8),
        // container Center => Centraliza os elementos no meio da tela (Lateral - Margens direita e esquerda)
        child: Center(
          // Column => Permite adicionar mais de um elemento
          child: Column(
            // Centraliza os Elementos com relação ao Top e Bottom
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nº de Click: $contador", style: TextStyle(fontSize: 20)),
              // Adicionar um botão => Todo botão permite criar uma ação ao ser pressionado
              ElevatedButton(
                onPressed: (){
                  // Adicionar o setState
                  setState(() {
                    // Colocar a ação para o botão
                    contador++;
                  });
                }, // Ação do botão (){} ou ()=>
                child: Text("Adicionar +1")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
