import 'package:fetchvie/service/db_helper.dart';
import 'package:fetchvie/service/dotenv_loader.dart';
import 'package:fetchvie/view/user_select.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Carrega o BD e o .env antes de tudo
  await DotenvLoader.loadEnv();
  await DbHelper().database;

  runApp(
    MaterialApp(
      title: "Fetchvie",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 86, 133, 172),
        ),
        brightness: Brightness.dark,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        useMaterial3: true,
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        overscroll: false,
      ),
      home: const UserSelect(),
    ),
  );
}
