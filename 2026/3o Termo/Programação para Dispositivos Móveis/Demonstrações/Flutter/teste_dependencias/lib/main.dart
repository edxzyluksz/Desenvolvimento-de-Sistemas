// Arquivo principal da aplicação

// Sempre começa com um void main

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(MaterialApp(
    home: // Estrutura máxima de janela
      Scaffold(
        appBar: AppBar(title: Text("My First App"),),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              Fluttertoast.showToast(
                msg: "Hello, World!!!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER);
            }, 
            child: Text("Do not panic!!!")
          ),
        ),
      ),
  ));
}