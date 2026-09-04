import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class JsonHelper {

  // Static -> Método da classe. Não precisa instanciar objeto

  static Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File("${dir.path}/config.json");
  }

  static Future<Map<String, dynamic>> getData() async {
    try {
      final file = await _getFile();
      if (await file.exists()) {
        final content = await file.readAsString();
        return json.decode(content);
      }
    } catch(e) {
      print("Erro ao ler dados: $e");
    }
    return {};
  }

  static Future<void> saveData(Map<String, dynamic> data) async {
    try {
      final file = await _getFile();
      final content = json.encode(data);
      await file.writeAsString(content);
    } catch (e) {
      print("Erro ao salvar dados: $e");
    }
  }
}