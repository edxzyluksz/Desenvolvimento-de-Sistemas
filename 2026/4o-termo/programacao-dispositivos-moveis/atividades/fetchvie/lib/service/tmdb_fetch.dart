import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TmdbService {
  static String basePath = 'https://api.themoviedb.org/3';
  static String idioma = "pt-BR";

  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  static Future<List<Map<String, dynamic>>> searchWork(
    String query,
    bool movie,
    bool isAdult, {
    int page = 1,
  }) async {
    String type = (movie)
        ? 'movie'
        : 'tv'; // Centraliza a lógica para buscar filmes ou séries no mesmo método
    final response = await http.get(
      Uri.parse(
        '$basePath/search/$type?query=$query&include_adult=$isAdult&page=$page&language=$idioma',
      ),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $apiKey',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(data["results"]);
    } else {
      throw Exception("Falha ao carregar dados.");
    }
  }

  static Future<List<Map<String, dynamic>>> discoverWork(
    bool movie,
    bool isAdult, {
    int page = 1,
  }) async {
    String type = (movie) ? 'movie' : 'tv';
    final response = await http.get(
      Uri.parse(
        '$basePath/discover/$type?include_adult=$isAdult&page=$page&language=$idioma',
      ),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $apiKey',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(data["results"]);
    } else {
      throw Exception("Falha ao carregar dados.");
    }
  }
}
