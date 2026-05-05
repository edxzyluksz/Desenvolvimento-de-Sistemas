import 'package:flutter/material.dart';
import 'package:shared_preferences_demo/view/exemplo1_page.dart';
import 'package:shared_preferences_demo/view/home_page.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    routes: {
      "/tela1": (context) => Exemplo1Page(),
      //"/tela2": (context) => Exemplo2Page(),
      //"/tela3": (context) => Exemplo3Page()
    },
    home: HomePage(),
  ));
}