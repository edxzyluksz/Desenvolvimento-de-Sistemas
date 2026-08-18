import 'package:biblioteca_app_json/controller/user_controller.dart';
import 'package:biblioteca_app_json/model/user.dart';
import 'package:flutter/material.dart';

class UserFormPage extends StatefulWidget {
  // Atributos
  final User? user; // Pode ser nulo
  const UserFormPage({super.key, this.user});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {

  // Atributos
  final _formKey = GlobalKey<FormState>(); // Armazena as informações do formulário
  final _userController = UserController();
  final _nameInput = TextEditingController();
  final _emailInput = TextEditingController();
  String userId = "";

  // Se existir dados do usuário, precisa do initState
  @override
  void initState() {
    super.initState();
    // Pegar os dados se for edição
    if (widget.user != null) {
      userId = widget.user!.id!;
      _nameInput.text = widget.user!.name;
      _emailInput.text = widget.user!.email;
    }
  }

  void save() async {
    if (_formKey.currentState!.validate()) {
      final user = User(
        name: _nameInput.text.trim(),
        email: _emailInput.text.trim()
      );

      try {
        await _userController.create(user);
      } catch (e) {
        // Tratar o erro
      }

      Navigator.pop(context);
    }
  }

  void update() async {
    if (_formKey.currentState!.validate()) {
      final user = User(
        id: widget.user!.id!,
        name: _nameInput.text.trim(),
        email: _emailInput.text.trim()
      );
      try {
        await _userController.update(user);
      } catch (e) {
        // Tratar erro
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? "Novo Usuário" : widget.user!.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameInput,
                decoration: InputDecoration(labelText: "Nome"),
                validator: (value) => value!.isEmpty? "Informe o nome" : null,
              ),
              TextFormField(
                controller: _emailInput,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) => value!.isEmpty? "Informe o email" : null,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: widget.user == null ? save : update, 
                child: Text(widget.user == null ? "Salvar" : "Atualizar")
              )
            ],
          ),
        ),
      ),

    );
  }
}