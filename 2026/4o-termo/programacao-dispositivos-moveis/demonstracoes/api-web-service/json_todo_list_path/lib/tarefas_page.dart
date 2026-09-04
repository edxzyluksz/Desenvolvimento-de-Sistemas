import 'package:flutter/material.dart';
import 'package:json_todo_list_path/json_helper.dart';

class TarefasPage extends StatefulWidget {
  final String nomeUsuario;
  final Map<String, dynamic> banco;

  const TarefasPage({super.key, required this.nomeUsuario, required this.banco});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {

  List<Map<String,dynamic>> _tarefas = [];

  initState() {
    super.initState();
    _loadUserTasks();
  }

  void _loadUserTasks() {
    final usuario = widget.nomeUsuario;
    final banco = widget.banco;

    if (banco.containsKey(usuario)) {
      setState(() {
        _tarefas = List<Map<String, dynamic>>.from(banco[usuario]);
      });
    }
  }

  void _saveChanges() {
    widget.banco[widget.nomeUsuario] = _tarefas;
    JsonHelper.saveData(widget.banco);
  }

  void _modifyTask(int index){
    setState(() {
      _tarefas[index]['concluida'] = !_tarefas[index]['concluida'];
    });
    _saveChanges();
  }

  void _adicionarTarefa() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController _tituloController = TextEditingController();
        return AlertDialog(
          title: const Text('Adicionar Tarefa'),
          content: TextField(
            controller: _tituloController,
            decoration: const InputDecoration(labelText: 'Título da Tarefa'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final titulo = _tituloController.text;
                if (titulo.isNotEmpty) {
                  setState(() {
                    _tarefas.add({'titulo': titulo, 'concluida': false});
                  });
                  _saveChanges();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas de ${widget.nomeUsuario}'),
      ),
      body: ListView.builder(
        itemCount: _tarefas.length,
        itemBuilder: (context, index) {
          final tarefa = _tarefas[index];
          return ListTile(
            title: Text(tarefa['titulo']),
            trailing: Checkbox(
              value: tarefa['concluida'],
              onChanged: (value) {
                _modifyTask(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: _adicionarTarefa, child: const Icon(Icons.add),),
    );
  }
}