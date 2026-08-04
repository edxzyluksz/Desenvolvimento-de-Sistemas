import 'package:flutter/material.dart';
import 'package:json_todo_list_path/json_helper.dart';
import 'package:json_todo_list_path/tarefas_page.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});
  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  Map<String, dynamic> _baseData = {};
  final TextEditingController _controllerName = TextEditingController();

  initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final data = await JsonHelper.getData();
    setState(() {
      _baseData = data;
      _controllerName.text = _baseData['name'] ?? '';
    });
  }

  void _addUser() async {
    final name = _controllerName.text;
    if (name.isNotEmpty) {
      _baseData['name'] = name;
      await JsonHelper.saveData(_baseData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário adicionado com sucesso!'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> usuarios = _baseData.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controllerName,
              decoration: const InputDecoration(labelText: 'Nome do Usuário'),
            ),
          ),
          ElevatedButton(
            onPressed: _addUser,
            child: const Text('Adicionar Usuário'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                final usuario = usuarios[index];
                return ListTile(
                  title: Text(usuario),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      setState(() {
                        _baseData.remove(usuario);
                      });
                      await JsonHelper.saveData(_baseData);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Usuário removido com sucesso!')),
                      );
                    },
                  ),
                  onTap:() {
                    //Navega para as tarefas do usuario selecionado
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TarefasPage(nomeUsuario: usuario, banco: _baseData),
                      ),
                    ).then((value) => _loadData()); // Atualiza a lista de usuários ao voltar da página de tarefas
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}