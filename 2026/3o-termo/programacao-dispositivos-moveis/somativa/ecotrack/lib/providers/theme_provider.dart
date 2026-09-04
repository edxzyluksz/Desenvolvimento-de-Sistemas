import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  ThemeData get currentTheme => _isDark 
      ? ThemeData.dark() 
      : ThemeData(primaryColor: const Color(0xFF69D463), scaffoldBackgroundColor: const Color(0xFFF3F3F3));
}