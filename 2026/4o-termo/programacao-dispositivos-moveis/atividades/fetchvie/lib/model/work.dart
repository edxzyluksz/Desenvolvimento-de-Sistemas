class Work {
  final int id;
  final String title; // title || name
  final String type; // movie / tv
  final String posterPath;
  final String overview;
  final DateTime? releaseDate;
  final double rating;
  final String? favoritedAt; // Informação que será puxada do banco (se existir)

  Work({
    required this.id,
    required this.title,
    required this.type,
    required this.posterPath,
    required this.overview,
    this.releaseDate,
    required this.rating,
    this.favoritedAt,
  });

  // Conversores
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "type": type,
      "poster_path": posterPath,
      "overview": overview,
      "release_date": releaseDate?.toIso8601String(),
      "rating": rating,
    };
  }

  factory Work.fromMap(Map<String, dynamic> map, {String? providedType}) {
    // Considerando Work pode ser populado por dados tanto do SQLite quanto da API, adiciona-se várias verificações
    // O importante é que o nome bata com os campos
    final String? dateStr =
        map['releaseDate'] ?? map['release_date'] ?? map['first_air_date'];
    return Work(
      id: map['id'],
      title: map['title'] ?? map['name'] ?? 'Título desconhecido',
      type:
          map['type'] ??
          providedType ??
          'movie', // Assume que é 'filme' caso não tenha recebido nada
      posterPath: map['poster_path'] ?? '',
      overview: map['overview'] ?? "No description",
      releaseDate: dateStr != null ? DateTime.tryParse(dateStr) : null,
      rating: ((map['rating'] ?? map['vote_average']) as num).toDouble(),
      favoritedAt: map['favorited_at'],
    );
  }
}
