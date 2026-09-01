import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotenvLoader {
  static Future<void> loadEnv() async {
    try {
      await dotenv.load(fileName: ".env");
    } catch (e) {
      print("Erro ao carregar .env: $e");
    }
  }
}
