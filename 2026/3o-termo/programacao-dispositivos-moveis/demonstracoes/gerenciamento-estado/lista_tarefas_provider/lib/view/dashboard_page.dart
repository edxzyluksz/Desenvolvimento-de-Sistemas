import 'package:flutter/material.dart';
import 'package:lista_tarefas_provider/controller/tarefa_controller.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dash de Tarefas"), centerTitle: true),
      // Construção dos dash
      // Escuta as mudanças de estado do Controller
      body: Consumer<TarefaController>(
        builder: (context, controller, child) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                _constructorCard(
                  titulo: "Total de Tarefas", 
                  value: controller.totalTarefas.toString(), 
                  icon: Icons.list_alt, 
                  color: Colors.blue),
                _constructorCard(
                  titulo: "Tarefas Concluídas", 
                  value: controller.totalTarefasConcluidas.toString(), 
                  icon: Icons.check_circle, 
                  color: Colors.green),
                _constructorCard(
                  titulo: "Tarefas Pendentes", 
                  value: controller.totalTarefasPendentes.toString(), 
                  icon: Icons.pending_actions, 
                  color: Colors.orange),
                _constructorCard(
                  titulo: "Porcentagem de Tarefas Concluídas", 
                  value: controller.porcentagemTarefasConcluidas.toString(), 
                  icon: Icons.percent, 
                  color: Colors.yellow)
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _constructorCard({
  required String titulo,
  required String value,
  required IconData icon,
  required Color color,
}) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.15),
        child: Icon(icon, color: color),
      ),
      title: Text(titulo, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Text(
        value,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    ),
  );
}
