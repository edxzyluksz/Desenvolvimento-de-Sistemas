import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:3008";

  // Métodos para acessar os endpoints da API

  // GET (All)
  static Future<List<dynamic>> getList(String path) async {
    final res = await http.get(Uri.parse("$baseUrl/$path")); // No dart precisa converter String em Endereço URL
    if (res.statusCode == 200) return json.decode(res.body); // Se for status 200 (OK), converte o JSON para Map<dynamic>
    throw Exception("Falha de Conexão: $path"); // Se falhou, realiza uma exceção de erro
  }

  // GET (One)
  static Future<Map<String, dynamic>> getOne(String path, String id) async {
    final res = await http.get(Uri.parse("$baseUrl/$path/$id"));
    if (res.statusCode == 200) return json.decode(res.body);
    throw Exception("Falha de Conexão com $path");
  }

  // POST 
  static Future<Map<String, dynamic>> post(String path, Map<String, dynamic> body) async {
    final res = await http.post(
      Uri.parse("$baseUrl/$path"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(body)
    );
    if (res.statusCode == 201) return jsonDecode(res.body);
    throw Exception("Falha de conexão com $path");
  }

  // POST 
  static Future<Map<String, dynamic>> put(String path, Map<String, dynamic> body, String id) async {
    final res = await http.post(
      Uri.parse("$baseUrl/$path/$id"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(body)
    );
    if (res.statusCode == 200) return jsonDecode(res.body);
    throw Exception("Falha de conexão com $path");
  }

  static delete(String path, String id) async {
    final res = await http.delete(Uri.parse("$baseUrl/$path/$id"));
    if (res.statusCode != 200) throw Exception("Falha ao deletar de $path");
  }

}