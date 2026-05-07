import 'package:flutter/material.dart';
import 'main_layout.dart';

class AppPresentation extends StatelessWidget {
  const AppPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity, // Força a ocupação de toda a largura
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centraliza horizontalmente
            children: [
              const Icon(Icons.eco, size: 120, color: Color(0xFF69D463)),
              const SizedBox(height: 24),
              const Text(
                "Bem vindo ao EcoTrack",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 48),

              // Botões com largura fixa e estilo mais elegante
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF69D463),
                  ),
                  onPressed: () => _navigateTo(context, 0),
                  child: const Text(
                    "Meus Hábitos",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3A8136),
                  ),
                  onPressed: () => _navigateTo(context, 1),
                  child: const Text(
                    "Meu Dashboard",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 48),

              Container(
                width: 400,
                decoration: BoxDecoration(
                  color: Colors
                      .white, // Cor de fundo se a imagem tiver transparência
                  borderRadius: BorderRadius.circular(25)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.asset(
                    'assets/images/mulher-sustentabilidade.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainLayout(initialIndex: index)),
    );
  }
}
