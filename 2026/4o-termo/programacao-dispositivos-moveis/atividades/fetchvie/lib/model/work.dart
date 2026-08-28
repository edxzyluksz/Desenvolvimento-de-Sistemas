class Work {
  final int? id; 
  final String title; // original_title || original_name
  final String posterPath;
  final String overview;
  double rating;

  Work({
    this.id,
    required this.title,
    required this.posterPath,
    this.overview = "No description",
    this.rating = 0.0
  });

  // Conversores
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "posterPath": posterPath,
      "overview": overview,
      "rating": rating
    };
  }

  factory Work.fromMap(Map<String, dynamic> map){
    return Work (
      id: map['id'],
      title: map['title'],
      posterPath: map['posterPath'],
      overview: map['overview'] ?? "No description",
      rating: (map['rating'] as num).toDouble()
    );
  }
}