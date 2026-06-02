import 'package:flutter/material.dart';
import 'package:sa_formativa_petshop_sqlite/service/database_helper.dart';
import 'package:sa_formativa_petshop_sqlite/model/consulta_model.dart';
import 'package:sa_formativa_petshop_sqlite/model/pet_model.dart';

class PetDetailScreen extends StatefulWidget {
  final Pet pet;// sera importado da tela anterior o obj PET
  const PetDetailScreen({super.key, required this.pet});

  @override
  State<PetDetailScreen> createState() => _PetDetailScreenState();
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
              future: DatabaseHelper().getConsultasPorPet(widget.pet.id!),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();
                final consultas = snapshot.data!;
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
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Agendar"),
        icon: Icon(Icons.add_task),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => AddConsultaScreen(pet: widget.pet))).then((value) => setState(() {})),
      ),
    );
  }
}

class AddConsultaScreen extends StatefulWidget {
  final Pet pet;
  const AddConsultaScreen({super.key, required this.pet});

  @override
  State<AddConsultaScreen> createState() => _AddConsultaScreenState();
}

class _AddConsultaScreenState extends State<AddConsultaScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _dataHoraController = TextEditingController();

  @override
  void dispose() {
    _tipoController.dispose();
    _dataHoraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agendar para ${widget.pet.nome}')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tipoController,
                decoration: InputDecoration(labelText: 'Tipo de serviço'),
                validator: (v) => (v == null || v.isEmpty) ? 'Informe o serviço' : null,
              ),
              TextFormField(
                controller: _dataHoraController,
                decoration: InputDecoration(labelText: 'Data e hora'),
                validator: (v) => (v == null || v.isEmpty) ? 'Informe data e hora' : null,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  final consulta = Consulta(
                    id: null,
                    petId: widget.pet.id!,
                    tipoServico: _tipoController.text,
                    dataHora: _dataHoraController.text,
                    observacoes: '',
                  );
                  await DatabaseHelper().insertConsulta(consulta);
                  Navigator.pop(context, true);
                },
                child: Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}