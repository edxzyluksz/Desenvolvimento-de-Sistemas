import 'package:flutter/material.dart';

import 'pages/contato-page.dart';
import 'pages/formulario-page.dart';
import 'pages/home-page.dart';

void main() {
  runApp(MaterialApp(
    // Sistema de rotas para navegação entre telas
    // home -> tela inicial
    // form -> tela de formulário
    // contato -> tela de contato
    routes: {
      "/": (context) => HomePage(),
      "/form": (context) => FormularioPage(),
      "/contato": (context) => ContatoPage(),
    },
    initialRoute: "/", // Direciona o aplicativo para a homepage ao abrir
    
  ));
}