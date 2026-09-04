import 'package:biblioteca_app_json/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:biblioteca_app_json/model/user.dart';
import 'package:biblioteca_app_json/view/user/user_form_page.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {

  // Atributos
  List<User> _users = [];

  // Permitir o filtro de usuários
  final _userSearch = TextEditingController(); // Campo para digitar o nome do usuário
  List<User> _filtered = [];
  bool _isLoading = true;
  String _error = "";

  final _userController = UserController();

  // Métodos
  @override
  void initState() { // Sempre que preciso carregar informações antes do build da page, usar o método initState
    _load(); // Carregar as informações
  }

  void _load() async {
    setState((){
      _isLoading = true;
    });
    try {
      _users = await _userController.fetchAll();
      _filtered = _users;
    } catch(e) {
      // Tratar o erro!
      _error = e.toString();
    }
    setState((){
      _isLoading = false;
    });
  }

  void _filterUsers(){
    final query = _userSearch.text.toLowerCase();
    setState(() {
      _filtered = _users.where((user){
        return user.name.toLowerCase().contains(query) || user.email.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _openForm({User? user}) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => UserFormPage(user:user)));
    _load();
  }

void _delete(User user) async{
    final confirm = await showDialog(
      context: context, 
      builder: (context)=>AlertDialog(
        title: Text("Confirma Exclusão"),
        content: Text("Deseja realmente exluir o usuário ${user.name}"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context,false), child: Text("Cancelar")),
          TextButton(onPressed: () => Navigator.pop(context,true), child: Text("Excluir"))
        ],
      ));
      if(confirm == true){
        try {
          _userController.delete(user.id!);
        } catch (e) {
          //Criar uma mensagem de Erro
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Não precisa de AppBar (Já está na home)
      body:  _isLoading 
      ? Center(child: CircularProgressIndicator()) 
      : Padding(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            TextField(
              controller: _userSearch,
              decoration: InputDecoration(
                labelText: "Pesquisar Usuário",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _filterUsers(),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filtered.length,
                itemBuilder: (context, index) {
                  final user = _filtered[index];
                  return Card (
                    child: ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () => _openForm(user: user), icon: Icon(Icons.edit)),
                          IconButton(onPressed: () => _delete(user), icon: Icon(Icons.delete), color: Colors.red)
                        ],
                      ),
                    ),
                  );
                }
              ),
            )
          ],),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () => _openForm(), child: Icon(Icons.add)),
    );
  }
}