import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';

class SustainabilityHabits extends StatelessWidget {
  const SustainabilityHabits({super.key});

  // Função auxiliar para exibir a caixa de diálogo de adicionar hábito
  void _showAddHabitDialog(BuildContext context, HabitProvider provider) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Novo Hábito'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Digite o nome do hábito'),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  provider.addHabit(controller.text.trim());
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
    return Consumer<HabitProvider>(
      builder: (context, provider, child) {
        return ListView(
          children: [
            // Cabeçalho dos Pendentes com o botão de +
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hábitos Pendentes",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.green),
                    onPressed: () => _showAddHabitDialog(context, provider),
                  ),
                ],
              ),
            ),
            
            // Lista de Pendentes
            ...provider.pendingHabits.map((h) => ListTile(
                  title: Text(h.title),
                  leading: const Icon(Icons.circle_outlined),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => provider.removeHabit(h.id),
                  ),
                  onTap: () => provider.toggleHabitStatus(h.id),
                )),
                
            const Divider(),
            
            // Cabeçalho dos Concluídos
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Hábitos Concluídos",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            
            // Lista de Concluídos
            ...provider.completedHabits.map((h) => ListTile(
                  title: Text(
                    h.title,
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => provider.removeHabit(h.id),
                  ),
                  // Ao clicar no concluído, ele inverte o status e volta para pendente
                  onTap: () => provider.toggleHabitStatus(h.id),
                )),
          ],
        );
      },
    );
  }
}