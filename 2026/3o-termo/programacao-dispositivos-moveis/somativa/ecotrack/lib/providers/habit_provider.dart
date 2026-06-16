import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitProvider with ChangeNotifier {
  final List<Habit> _habits = [
    Habit(id: '1', title: 'Economizar água'),
    Habit(id: '2', title: 'Reciclar plástico'),
    Habit(id: '3', title: 'Usar transporte público'),
  ];

  List<Habit> get pendingHabits => _habits.where((h) => !h.isCompleted).toList();
  List<Habit> get completedHabits => _habits.where((h) => h.isCompleted).toList();

  void toggleHabitStatus(String id) {
    final index = _habits.indexWhere((h) => h.id == id);
    if (index != -1) {
      _habits[index].isCompleted = !_habits[index].isCompleted;
      notifyListeners();
    }
  }

  void addHabit(String title) {
    final newHabit = Habit(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // Gera um ID único
      title: title,
    );
    _habits.add(newHabit);
    notifyListeners();
  }

  void removeHabit(String id) {
    _habits.removeWhere((h) => h.id == id);
    notifyListeners();
  }

  double get completionPercentage {
    if (_habits.isEmpty) return 0.0;
    return (completedHabits.length / _habits.length) * 100;
  }

  // Cada hábito concluído vale 15 pontos
  int get score => completedHabits.length * 15;

  // Aumenta 1 nível a cada 3 hábitos concluídos, começando no level 1
  int get currentLevel => (completedHabits.length ~/ 3) + 1;

  // Cada hábito concluído reduz o impacto de CO2 em 1.5%
  double get co2Impact => completedHabits.length * 1.5;

  // Meta fixa semanal (definida pelo desenvolvedor)
  int get weeklyGoal => 10;
}