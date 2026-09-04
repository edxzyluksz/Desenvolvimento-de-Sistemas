

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sa_formativa_petshop_sqlite/controller/consulta_controller.dart';
import 'package:sa_formativa_petshop_sqlite/model/consulta_model.dart';
import 'package:sa_formativa_petshop_sqlite/model/pet_model.dart';
import 'package:sa_formativa_petshop_sqlite/views/pet_detail_screen.dart';

 // Formulário de Cadastro da Consulta
class AddConsultaScreen extends StatefulWidget {
  final Pet pet; // Leva a informação do pet selecionada para a tela
  const AddConsultaScreen({super.key, required this.pet});

  @override
  _AddConsultaScreenState createState() => _AddConsultaScreenState();
}

class _AddConsultaScreenState extends State<AddConsultaScreen> {
   //formulario
  final _formKey = GlobalKey<FormState>();
  final _consultasControl = ConsultaController();

  late String _tipoServico;
  late String _observacao;
  DateTime _selectedDate = DateTime.now(); // Não pode selecionar uma data anterior a data atual
  TimeOfDay _selectedTime = TimeOfDay.now(); // Não pode selecionar uma hora anterior a data atual

  // Método para Seleção da Data
  // Abre um modal para selecionar a data
  void _dataSelecionada(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(), 
      lastDate: DateTime(2030),
      );
    if(picked != null && picked != _selectedDate){
      setState(() {
        _selectedDate = picked;
      });
    }
  }
  // Método para Seleção de Hora
  // Abre uma modal para selecionar a hora
  void _horaSelecionada(BuildContext context) async{
    final TimeOfDay? picked = await showTimePicker(
      context: context, 
      initialTime: _selectedTime);
    if(picked != null && picked != _selectedDate){
      setState(() {
        _selectedTime = picked;
      });
    }
  }
  // Salvar a Consulta
  void _salvarConsulta() async{
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save(); // Salva os Valores do Formulário

      // Correção de Data para banco de dados, para o formato ISO8601
      final DateTime dataFinal = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute
      );

      final newConsulta = Consulta(
        petId: widget.pet.id!,
        tipoServico: _tipoServico,
        dataHora: dataFinal.toIso8601String(),
        // Ternário para o campo de observação
        observacoes: _observacao.isEmpty ? "Sem Observações" : _observacao
      );
     
      
      try {
        await _consultasControl.salvarConsulta(newConsulta);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Agendamento Feito com Sucesso"))
        );
        Navigator.push(context, 
          MaterialPageRoute(builder: (context)=>PetDetailScreen(pet: widget.pet)));
        
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Exception: $e"))
        );
      }
    }
  }

  // Buildar a Tela
  @override
  Widget build(BuildContext context) {
    // Formatação para data e Hora
    final DateFormat dataFormatada = DateFormat("dd/MM/yyyy");
    final DateFormat horaFormatada = DateFormat("HH:mm");

    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Agendamento"),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      // Formulário para cadastrar consulta
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "tipo de Serviço"),
              validator: (value) => value!.isEmpty ? "Campo deve Ser Preenchido" : null,
              onSaved: (newValue) => _tipoServico = newValue!,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: Text("Data: ${dataFormatada.format(_selectedDate)}")),
                TextButton(onPressed: ()=>_dataSelecionada(context), child: Text("Selecionar Data"))
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Data: ${horaFormatada.format(
                  DateTime(0,0,0,_selectedTime.hour,_selectedTime.minute))}")),
                TextButton(onPressed: ()=>_horaSelecionada(context), child: Text("Selecionar Hora"))
              ],
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(labelText: "Observação"),
              maxLines: 3,
              onSaved: (newValue) => _observacao=newValue!,
            ),
            ElevatedButton(onPressed: _salvarConsulta, child: Text("Agendar Atendimento"))
            
          ],
        )),)
    );
  }
}