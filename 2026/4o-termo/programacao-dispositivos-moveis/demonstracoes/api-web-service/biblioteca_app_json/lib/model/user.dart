class User {
    // Atributos
    final String? id;
    final String name;
    final String email;

    // Construtor
    User({
        this.id, 
        required this.name, 
        required this.email
    });

    // toMap: Objeto --> Entidade [Objetivo: Transformar os atributos da classe em uma coleção (para sera ser enviada ao BD)]
    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email
    };

    // fromMap: Entidade -> Objeto [Objetivo: Instanciar um objeto com base na classe do Banco]
    factory User.fromMap(Map<String, dynamic> map) => 
    User(
        id: map["id"].toString(),
        name: map["name"].toString(),
        email: map["email"].toString()
    );
}