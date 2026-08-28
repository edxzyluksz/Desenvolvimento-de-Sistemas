import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fetchvie/service/dotenv_loader.dart';

class TmdbService {
  static String basePath = 'https://api.themoviedb.org/3/';
  static String idioma = "pt-BR";

  TmdbService() { // Construtor (Requer leitura do .env para prosseguir)
    DotenvLoader.loadEnv();
  }

  static final apiKey = dotenv.env['API_KEY'];

  static Future<List<Map<String, dynamic>>> searchWork(String query, bool movie) async {
    String type = (movie) ? 'movie' : 'tv'; // Centraliza a lógica para buscar filmes ou séries no mesmo método
    final response = await http.get(
      Uri.parse('$basePath/search/$type?query=$query'), 
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $apiKey',
        HttpHeaders.contentTypeHeader: 'application/json'
      }
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(data["results"]);
    } else {
      throw Exception("Falha ao carregar dados.");
    }
  }
}