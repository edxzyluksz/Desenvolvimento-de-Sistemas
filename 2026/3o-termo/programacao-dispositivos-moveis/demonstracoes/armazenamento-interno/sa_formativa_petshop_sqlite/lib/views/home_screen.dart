import 'package:flutter/material.dart';
import 'package:sa_formativa_petshop_sqlite/controller/pet_controller.dart';
import 'package:sa_formativa_petshop_sqlite/model/pet_model.dart';
import 'package:sa_formativa_petshop_sqlite/views/add_pet_screen.dart';
import 'package:sa_formativa_petshop_sqlite/views/pet_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _controller = PetController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PetShop - Lista de Pets")),
      body: FutureBuilder<List<Pet>>(
        future: _controller.listarTodos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final pets = snapshot.data!;
          // Lista com todos os pets cadastrados
          return ListView.builder(
            itemCount: pets.length,
            itemBuilder: (context, i) => ListTile(
              leading: Icon(Icons.pets),
              title: Text(pets[i].nome),
              subtitle: Text(pets[i].raca),
              // Navegar para a tela de detalhe do pet ao clicar
              onTap: () => Navigator.push(context, 
                MaterialPageRoute(builder: (c) => PetDetailScreen(pet: pets[i]))).then((value) => setState(() {})),
            ),
          );
        },
      ),
      // Botão flutuante para adiconar novo pet
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context, 
          MaterialPageRoute(builder: (c) => AddPetScreen())).then((value) => setState(() {})),
      ),
    ); 
  }
}
