import 'package:flutter/material.dart';
import 'package:shared_preferences_demo/view/exemplo1_page.dart';
import 'package:shared_preferences_demo/view/exemplo2_page.dart';
import 'package:shared_preferences_demo/view/exemplo3_page.dart';
import 'package:shared_preferences_demo/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool("darkMode") ?? false;
  runApp(MaterialApp(
    routes: {
      "/tela1": (context) => Exemplo1Page(),
      "/tela2": (context) => Exemplo2Page(),
      "/tela3": (context) => Exemplo3Page()
    },
    home: HomePage(),
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light),
  );
}