import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotenvLoader {
  static void loadEnv() {
    try {
      dotenv.load(fileName: ".env");
    } catch (e) {
      print("Erro ao carregar .env: $e");
    }
  }
}