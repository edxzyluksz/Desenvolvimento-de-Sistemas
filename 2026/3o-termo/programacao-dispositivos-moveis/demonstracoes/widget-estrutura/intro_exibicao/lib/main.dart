// tela para estudo dos widgets de eibição
// text, image, icon entre outros

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    // Configurações inciiais do app 

    //router => rotas de navegação

    //home => página inicial
    home: MyApp(),

    //themeApp => (claro/escuro)

  )); // Interessante colocar o MaterialApp no void main
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Estrutura da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      // Elemento principal da tela
      // appbar, drawer, vnVar, body, fabutton, snackbar
      appBar: AppBar(
        title: Text("Exemplos de Widget de exibição"),
      ),

      // Adicionar um elemento de Scroll

      body: SingleChildScrollView( // Mais usado para scroll de tela inteira
        child: Padding(
          padding: EdgeInsets.all(16),
          
          // Adicionar um child com um column dentro
          child: Expanded( // Mais usado para scroll em partes da tela
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                    
              children: [
                Text(
                  "Explorando o Flutter", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),
                ),
                // Ainda dentro da column, adicionar uma "Image"
                Image.network(
                  // Link URL da Imagem
                  'https://images.unsplash.com/photo-1531259683007-016a7b628fc3',
                  height: 600,
                  fit: BoxFit.contain,
                  
                ),
                Image.asset(
                  "assets/img/Kirby.png",
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}