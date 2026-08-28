class User {
  final int? uid;
  final String username;
  final String? pfpPath; // Foto de perfil personalizada para o usuário
  final bool isAdult;

  User({
    this.uid,
    required this.username,
    this.pfpPath, // Usará foto padrão caso nulo
    this.isAdult = false,
  });
  
  Map<String, dynamic> toMap() => {
    "uid": uid,
    "username": username,
    "pfpPath": pfpPath,
    "isAdult": isAdult
  };

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      username: map['username'],
      pfpPath: map['pfpPath'],
      isAdult: map['isAdult'] ?? false
    );
  }
}