import 'package:flutter/material.dart';
import 'package:sa_formativa_petshop_sqlite/model/pet_model.dart';
import '../controller/pet_controller.dart';

class AddPetScreen extends StatefulWidget {
  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  // Chave para validação do formulário
  final _formKey = GlobalKey<FormState>();

  // Controllers para capturar o texto dos inputs
  final _nomeController = TextEditingController();
  final _racaController = TextEditingController();
  final _donoController = TextEditingController();
  final _telefoneController = TextEditingController();

  final PetController _petController = PetController();

  // Função para processar o salvamento
  void _submitData() async {
    if (_formKey.currentState!.validate()) {
      // Criar o objeto Pet com os dados do formulário
      final novoPet = Pet(
        nome: _nomeController.text,
        raca: _racaController.text,
        nomeDono: _donoController.text,
        telefone: _telefoneController.text,
      );

      // Chamar o controller para persistir no SQLite
      bool sucesso = await _petController.salvarPet(novoPet) > 0;

      if (sucesso) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pet cadastrado com sucesso!'), backgroundColor: Colors.green),
        );
        Navigator.pop(context); // Volta para a HomeScreen
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar o pet.'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Novo Pet"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        //form para cadastrar novo pet
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Campo Nome do Pet
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: "Nome do Pet",
                  prefixIcon: Icon(Icons.pets),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o nome do pet" : null,
              ),
              SizedBox(height: 16),

              // Campo Raça
              TextFormField(
                controller: _racaController,
                decoration: InputDecoration(
                  labelText: "Raça",
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe a raça" : null,
              ),
              SizedBox(height: 16),

              // Campo Nome do Dono
              TextFormField(
                controller: _donoController,
                decoration: InputDecoration(
                  labelText: "Nome do Dono",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o nome do dono" : null,
              ),
              SizedBox(height: 16),

              // Campo Telefone do Dono
              TextFormField(
                controller: _telefoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Telefone do Dono",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o telefone" : null,
              ),
              SizedBox(height: 24),

              // Botão de Salvar
              ElevatedButton(
                onPressed: _submitData,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text("Salvar Cadastro"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpeza dos controllers ao fechar a tela
    _nomeController.dispose();
    _racaController.dispose();
    _donoController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }
}