import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              _buildDashboardCard(
                "Hábitos (%)",
                "${provider.completionPercentage.toStringAsFixed(0)}%",
              ),
              _buildDashboardCard("Pontuação", provider.score.toString()),
              _buildDashboardCard(
                "Meta Semanal",
                "${provider.completedHabits.length} / ${provider.weeklyGoal}",
              ),
              _buildDashboardCard(
                "Meu Nível",
                provider.currentLevel.toString(),
              ),
              _buildDashboardCard(
                "Impacto CO2",
                provider.co2Impact > 0
                    ? "-${provider.co2Impact.toStringAsFixed(1)}%"
                    : "0%",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDashboardCard(String title, String value) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              color: Color(0xFF3A8136),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
