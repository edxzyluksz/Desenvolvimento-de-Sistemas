// Função principal (faz o aplicativo rodar)
import 'package:flutter/material.dart';

void main(List<String> args){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Remove a flag do debug
    home: ToDoList(),
  ));
}

// st -> snippets (atalhos para código)

// Janela do Aplicativo

// 1ª Class identifica a mudança de estado => Chama o build
class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

// 2ª Class => Lógica de construção da janela
class _ToDoListState extends State<ToDoList> {
  // Atributos
  // Final => Permite a mudança de valor uma única vez (escopo da variável)
  // O uso do underline restringe o uso da variável para interno da classe (private)
  final TextEditingController _tarefaController = TextEditingController(); // Pega o valor do input
  final List<Map<String, dynamic>> _tarefas = [];
  // Explicação: Cria-se uma lista que não utiliza index, porém com "key" que é string que aceita qualquer valor (dynamic)

  // Métodos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Tarefas"), centerTitle: true), // Centraliza o t exto no meio da AppBar
      body: Padding(
        // Espaçamento geral de 8px
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            //Input para adicionar novas tarefas
            TextField(
              controller: _tarefaController, // Passa o valor do texto para o controller
              decoration: InputDecoration(
                labelText: "Digite uma Tarefa"
              ),
            ),
            SizedBox(height: 10), // Espaçamento de altura
            ElevatedButton(
              onPressed: _adicionarTarefa, 
              child: Text("Adicionar Tarefa")),
              Expanded(
                // Listar as tarefas da coleção
                child: ListView.builder(
                  itemCount: _tarefas.length, // Conta o nº de item na lista
                  itemBuilder: (context, index) => 
                    // Exibe o elemento da lista
                  ListTile(
                    title: Text(_tarefas[index]["titulo"], style: TextStyle(
                      // Operador Ternário (if, else)
                      decoration: _tarefas[index]["concluida"] ? TextDecoration.lineThrough : null
                    ),),
                    leading: Checkbox( // Permite mudar o valor da tarefa para concluída ou não
                      value: _tarefas[index]["concluida"], 
                      onChanged: (bool ? valor) => setState(() {
                        _tarefas[index]["concluida"] = valor!;
                      })
                    ),
                  )
                ),
              )
          ],
        ),
      ),
    );
  }

  // Método para adicionar tarefa na lista
  void _adicionarTarefa() {
    if(_tarefaController.text.trim().isNotEmpty){
      setState(() {
        // Adiciona a tarefa na lista
        _tarefas.add({
          "titulo": _tarefaController.text, 
          "concluida": false
        });
        // Limpa o campo do input
        _tarefaController.clear();
      });
    }
  }
}