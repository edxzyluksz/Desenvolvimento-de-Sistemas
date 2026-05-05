import 'package:flutter/material.dart';
import 'package:lista_tarefas_provider/controller/tarefa_controller.dart';
import 'package:lista_tarefas_provider/view/tarefas_page.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (_)=>TarefaController(),
      child: MaterialApp(
        home: TarefasPage(),
      ),
    )
  );
}