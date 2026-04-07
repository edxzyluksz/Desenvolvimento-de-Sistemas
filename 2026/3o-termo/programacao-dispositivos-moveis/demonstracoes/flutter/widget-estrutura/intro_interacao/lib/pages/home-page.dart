// Tela inicial
// Vai ter botões de navegação para outras telas

import 'package:flutter/material.dart';

// Tela inicial -> Logo do Aplicativo e Btões de Navegação
// Logo com SplashScreen -> Tela de Carregamento

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meu Aplicativo Interativo"),),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column( // Alinhamento do eixo principal vertical)
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo do aplicativo com atraso de carregamento de 2 segundos
            Image.network(
              "https://imgs.search.brave.com/e4ypHZfbgXt9KOvFoEbyf6Z1XOY1RuvPcrxWEIMc7vY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3LnJlZGQuaXQv/bnpkeHZwOTY1cW03/MS5qcGc_d2lkdGg9/NjQwJmNyb3A9c21h/cnQmYXV0bz13ZWJw/JnM9YjExYmRjNTMz/OWI4ODM0MTYyNjJl/ODllNWE2NTMyODcx/ZjJhNzIxMA",
              width:  150,
              height: 150,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // Método de navegação para a tea de formulário
              onPressed: () => Navigator.pushNamed(context, "/form"), 
              child: Text("Formulário"),
            ),

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/contato"), 
              child: Text("Contato"),
            )

          ],

          ),
        ),
      ),
    );
  }
}