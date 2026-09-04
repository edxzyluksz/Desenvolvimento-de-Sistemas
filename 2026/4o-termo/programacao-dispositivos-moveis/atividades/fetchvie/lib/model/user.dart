import 'dart:io';
import 'package:flutter/material.dart';

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

  ImageProvider? getPfpOrigin(String? path) {
    // Função auxiliar para processar a imagem do usuário corretamente

    if (path == null || path.isEmpty) {
      return AssetImage("assets/guest_pfp.jpg");
    }

    final lowerPath = path.toLowerCase();

    if (lowerPath.startsWith("https://") || lowerPath.startsWith("http://")) {
      return NetworkImage(path);
    } else if (lowerPath.startsWith("assets/")) {
      return AssetImage(path);
    } else {
      return FileImage(File(path));
    }
  }

  // IMPORTANTE!!!

  // No ToMap, os atributos entre aspas DEVEM ser >IGUAIS< AOS CAMPOS DO BD
  Map<String, dynamic> toMap() => {
    "id": uid,
    "username": username,
    "pfp_path": pfpPath,
    "is_adult": isAdult ? 1 : 0,
  };

  // No fromMap, os nomes dentro de 'map' devem ser >IGUAIS< aos CAMPOS DO BD
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['id'],
      username: map['username'],
      pfpPath: map['pfp_path'] ?? 'assets/guest_pfp.jpg',
      isAdult: map['is_adult'] == 1,
    );
  }

  @override
  String toString() {
    return 'User(uid: $uid, username: $username, pfpPath: $pfpPath, isAdult: $isAdult)';
  }
}
