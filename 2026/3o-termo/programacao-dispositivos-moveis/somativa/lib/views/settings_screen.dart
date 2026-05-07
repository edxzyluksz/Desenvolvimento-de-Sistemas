import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Configurações"),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SwitchListTile(
          title: const Text("Modo Escuro"),
          value: themeProvider.isDark,
          onChanged: (_) => themeProvider.toggleTheme(),
        ),
      ),
    );
  }
}
