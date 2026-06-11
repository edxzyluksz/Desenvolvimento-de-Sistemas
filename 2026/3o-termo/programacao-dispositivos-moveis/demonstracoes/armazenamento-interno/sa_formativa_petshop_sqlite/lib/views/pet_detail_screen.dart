
import 'package:flutter/material.dart';
import 'package:sa_formativa_petshop_sqlite/model/consulta_model.dart';
import 'package:sa_formativa_petshop_sqlite/model/pet_model.dart';
import 'package:sa_formativa_petshop_sqlite/service/database_helper.dart';
import 'package:sa_formativa_petshop_sqlite/views/add_consulta_screen.dart';

class PetDetailScreen extends StatefulWidget {
  final Pet pet;
  const PetDetailScreen({super.key, required this.pet});

  @override
  _PetDetailScreenState createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Perfil: ${widget.pet.nome}")),
      body: Column(
        children: [
          ListTile(title: Text("Dono: ${widget.pet.nomeDono}"), subtitle: Text("Tel: ${widget.pet.telefone}")),
          Divider(),
          Padding(padding: EdgeInsets.all(8), child: Text("Histórico de Consultas", style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
            child: FutureBuilder<List<Consulta>>(
              future: DatabaseHelper().getConsultaPorPet(widget.pet.id!),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();
                final consultas = snapshot.data!;
                // Lista todas as consultas/agendamento do pet selecionado
                return ListView.builder(
                  itemCount: consultas.length,
                  itemBuilder: (context, i) => Card(
                    child: ListTile(
                      title: Text(consultas[i].tipoServico),
                      subtitle: Text(consultas[i].dataHora),
                      trailing: Icon(Icons.calendar_today),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      // Botão flutuante para agendar nova consulta para o pet selecionado
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Agendar"),
        icon: Icon(Icons.add_task),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => AddConsultaScreen(pet: widget.pet))).then((value) => setState(() {})),
      ),
    );
  }
}