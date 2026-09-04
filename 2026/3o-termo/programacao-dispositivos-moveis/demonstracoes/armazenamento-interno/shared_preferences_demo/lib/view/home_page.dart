import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemplo Shared Preferences"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/tela1"),
              child: Text("Exemplo 1")),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/tela2"),
              child: Text("Exemplo 2")),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/tela3"),
              child: Text("Exemplo 3")),
          ],
        ),
      ),
    );
  }
}