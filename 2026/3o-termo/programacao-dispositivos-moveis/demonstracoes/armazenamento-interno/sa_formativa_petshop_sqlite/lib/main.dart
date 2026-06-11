import 'package:flutter/material.dart';
import 'package:sa_formativa_petshop_sqlite/views/home_screen.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: "PetShop SqLite",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: HomeScreen(),
  ));
}